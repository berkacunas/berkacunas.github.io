# LimitedSharpen() ( a mod of mf's "BlindSharpen" )
# Needs MaskTools v1.5.8

function LimitedSharpen( clip clp, float "ss_x", float "ss_y",
\                        int "dest_x", int "dest_y",
\                        int "Smode" , int "strength", int "radius",
\                        int "Lmode", bool "wide", bool "overshoot",
\                        bool "soft", int "edgemode", bool "special",
\                        int "exborder" )
{
    ss_x      = default( ss_x, 1.5 )
    ss_y      = default( ss_y, 1.5 )
    dest_x    = default( dest_x, clp.width )
    dest_y    = default( dest_y, clp.height )
    Smode     = default( Smode, 3 )
    strength  = default( strength, 160 )
    radius    = default( radius, 2 )
    Lmode     = default( Lmode, 1 )
    wide      = default( wide, false )
    overshoot = default( overshoot, false )
    soft      = default( soft, false )
    edgemode  = default( edgemode, 0 )
    special   = default( special, false )
    exborder  = default( exborder, 0 )

    ox = clp.width
    oy = clp.height

    tmp = (ss_x != 1.0 || ss_y != 1.0) ? clp.lanczosresize(round(ox*ss_x/8)*8, round(oy*ss_y/8)*8) : clp

    dark_limit   = tmp.inpand()
    bright_limit = tmp.expand()
    minmaxavg    = special==false ? yv12lutxy(dark_limit,bright_limit,yexpr="x y + 2 /")
    \                             : maskedmerge(dark_limit,bright_limit,tmp,Y=3,U=-128,V=-128)

    Str       = string(float(strength)/100.0)
    normsharp = Smode==1 ? unfilter(tmp,strength,strength) 
    \         : Smode==2 ? sharpen(tmp,float(strength)/100.0) 
    \         : Smode==3 ? yv12lutxy(tmp,minmaxavg,yexpr="x x y - "+Str+" * +") 
    \         :            tmp

    wide_limit = wide==true ? yv12lutxy(tmp.expand(),tmp.inpand(),yexpr="x y + 2 /")
    \                       : tmp

    dark_limit = overshoot ? dark_limit.blur(0.2) : dark_limit
    bright_limit = overshoot ? bright_limit.blur(0.2) : bright_limit

    dark_limit   = (wide==true && Lmode==1) ? yv12lutxy(dark_limit,wide_limit,yexpr="x y < x y ?") : dark_limit
    bright_limit = (wide==true && Lmode==1) ? yv12lutxy(bright_limit,wide_limit,yexpr="x y > x y ?") : bright_limit

    Lmode == 1 ? yv12lutxy(normsharp,dark_limit,yexpr="x y < x y ?")
    \          : normsharp

    Lmode == 1 ? yv12lutxy(last,bright_limit,yexpr="x y > x y ?")
    \          : last

    edgemask = edgemode==0 ? blankclip(tmp) 
    \        : edgemode==1 ? tmp.edgemask(3,255,255,255,"roberts",Y=3,V=1,U=1).fitY2UV() 
    \        :               tmp.edgemask(3,255,255,255,"sobel",Y=3,V=1,U=1).fitY2UV()

    edgemode!=0 ? maskedmerge(tmp,last,edgemask,Y=3,U=1,V=1) : last

    (ss_x != 1.0 || ss_y != 1.0) 
    \ ? (dest_x != ox || dest_y != oy) ? lanczosresize(dest_x,dest_y) 
    \                                  : lanczosresize(ox,oy) 
    \ : last

    return last
}