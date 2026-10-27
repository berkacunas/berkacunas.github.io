# DVD’DEN DIVX YAPIMI (ADIM ADIM)

## GEREKLİ PROGRAMLAR VE LİNKLERİ

1. [GordianKnot Rip Pack v.0.33.1](http://prdownloads.sourceforge.net/gordianknot/GordianKnot.RipPack.0.33.1.Setup.exe?download )
2. [Gordian Knot Codec Pack 1.9](http://prdownloads.sourceforge.net/gordianknot/Gordian.Knot.Codec.Pack.1.9.Setup.exe?download)

**Gordian Knot Rip Pack içindeki programlar:**

- **Gordian Knot**
	- DVDDecrypter
	- DGIndex
	- VirtualDubMod
	- Nandub
	- robot4rip
	- BeSweet
	- vStrip

**Adım adım izleyeceğimiz yol:**

1. robot4rip’i açıp tüm ayarlarını yapacağız. Ardından seçili ayarlarla robotu çalıştırıp DVD’den DivX’e Encoding için gerekli ön-malzemeyi oluşturacağız.
2. Gordian Knot arayüzü ile gerekli ayarları yapacağız.

---

Rip paketini kurduktan sonra robot4rip’i açalım.

![open robot4rip](./images/dvd-to-divx-encoding-guide/00-open-robot4rip.png)

Aşağıdaki şekilde açılacak.

![robot4rip main screen](./images/dvd-to-divx-encoding-guide/01-robot4rip-main-screen.png)

robot4rip'in ana penceresi yukarıdaki gibi. (Programdaki yazılı bilgiler benim son çalışmamdan kalanlar)

![robot4rip preferences](./images/dvd-to-divx-encoding-guide/02-robot4rip-preferences.png)

İlk kullanımda ayarları yapmamız gerekiyor. Bunun için `Tools > Preferences` yolunu izleyeceğiz.

![robot4rip preferences folders](./images/dvd-to-divx-encoding-guide/03-robot4rip-preferences-folders.png)

Preferences ekranı 8 sekmeden oluşuyor. Gordian Knot Rip Pack `v.0.33’teki bir bug’dan dolayı` robot4rip ile kullanacağım tüm entegre programların yolları hatalı gösterilmiş. Adım adım sekmeleri ayarlarken hatalı yolları da (path) kesinlikle düzeltmeliyiz.

Sırasıyla başlayalım. Soldan birinci sekme, `Folders` sekmesinde yaratılacak `ISO dosyası`, `Full Copy` dosyası, `Vob`’ların konulacağı klasör ve proje klasörünün yollarını gösterelim. Burada, kendi makinamda h: sürücüsünün root’unu kök klasör olarak atıyorum. Buradaki klasör atamaları programın default olarak ileride kullandığı klasörler olup sonradan aynı yerden istenildikleri gibi değiştirilmeleri mümkün.

Yukarıdaki resimdeki gibi `Replace [space] with “_” in Project Title (recommended)` seçili olacak.

![](images/dvd-to-divx-encoding-guide/04-robot4rip-preferences-fullcopy_isoimage.png)

`Full Copy / ISO Image` sekmesinde, **1** numara ile işaretlenen ayarda DVD’deki dosyaları harddiske `tam kopya` mı alacağımızı yoksa `Daemon Tools` ile `ISO image`’ini mi yapacağımızı seçiyoruz. Resimdeki gösterildiği gibi `Copy all files to a harddisk folder (Full Copy)` seçili olacak. **2 numara** ile işaretlenen ayarda, DVD dosyalarını DVD’den HDD’ye çıkaracak `DVDDecrypter.exe` programının diskteki yolunu doğru gösterelim. Bunun için adresin solundaki küçük klasör ikonuna tıklamamız yeterli. Altındaki `Daemon Tool` ayarlarını ellemiyoruz.

![robot4rip preferences pgc-rip](./images/dvd-to-divx-encoding-guide/05-robot4rip-preferences-pgc_rip.png)

PGC Rip sekmesinde ayarlar yukarıdaki gibi olacak. Vstrip’in yol ifadesinin doğru olduğunu kontrol edelim.

![robot4rip preferences indexing-demuxing](./images/dvd-to-divx-encoding-guide/06-robot4rip-preferences-indexing_demuxing.png)

Indexing/Demuxing sekmesinde DVD2AVI’nin yolunu gösterirken Gordian Knot 0.33 versiyonu için yeni geliştirilmiş DGIndex.exe programının yolunu göstereceğiz. Diğer ayarlar yukarıdaki gibi olacak.

![robot4rip preferences subtitles](./images/dvd-to-divx-encoding-guide/07-robot4rip-preferences-subtitles.png)

Subtitles sekmesinde `vobsub.dll` dosyasının yolunu düzeltiyoruz. VobSub dosyaları robot4rip ile otomatik olarak yaratıldıktan sonra istersek gene robot4rip ile; yaratılan bu iki VobSub dosyasını (`.sub` ve `.idx` dosyaları) resimde `1 numara` ile gösterilen kısma bilgisayarımızdaki `winrar.exe`’nin yolunu göstererek otomatik olarak rar’latabilir, `2 numaralı` kutuyu seçerek sıkıştırtabilir ve `3 numaralı` kutuyu seçerek sıkıştırmadan önceki VobSub dosyalarını sildirtebiliriz.

`Auto Select Language` kısmında DVD’de bulunan altyazılardan hangi dillerde olanlarını otomatik olarak seçmesini istediğimizi robot4rip'e gösterebiliriz. Kendi rip’lerimde DVD’deki tüm altyazıları aldığım ve ne yapacağıma ondan sonra karar verdiğim için bu şıkkın benim için pek önemi yok.

![robot4rip preferences chapters](./images/dvd-to-divx-encoding-guide/08-robot4rip-preferences-chapters.png)

ChapterXTracker.exe’nin yolunu resimdeki gibi düzeltelim. Bu özelliği bu rehberde kullanmayacağız.

![robot4rip preferences finalize](./images/dvd-to-divx-encoding-guide/09-robot4rip-preferences-finalize.png)

Finalize özelliğini de kullanmayacağız.

![robot4rip preferences defaults](./images/dvd-to-divx-encoding-guide/10-robot4rip-preferences-defaults.png)

Son olarak Defaults sekmesinde, DVD’den veya HDD’den yapılan her dosya taraması sonrası varsayılan olarak açık veya kapalı olmasını istediğimiz özellikleri buradan belirliyoruz. Resimdeki gibi, PGC Rip, Indexing / Demuxing, Subtitles seçili olacak; ISO Image, Chapters ve Finalize seçili olmayacak.

Preferences ile ilgili ayarlar bu kadar. Save deyip çıkıyoruz. Tools > Audio Preferences’a giriyoruz. 

![robot4rip tools audio-preferences](./images/dvd-to-divx-encoding-guide/11-robot4rip-tools-audio_preferences.png)

Audio Preferences’taki ayarlar, transcoding yapacaksak (AC3 > MP3 gibi) gerekli olacak. 

Transcoding en basit anlatımıyla daha önce sıkıştırılmış bir dosyanın decode edilip başka bir formatta yeniden sıkıştırılma işlemidir. Eğer lossy codec'lerle yapılırsa ilk sıkıştırmadaki kalite kaybının üstüne ikinci sıkıştırmada bir miktar daha kaliteden kaybedilir. Tercih edildiği koşullar olabilir. Bunlardan biri DVD'deki AC3 ses dosyasının MP3'e dönüştürülmesidir. 

![robot4rip tools audio-preferences main screen labeled](./images/dvd-to-divx-encoding-guide/12-robot4rip-tools-audio_preferences-main-screen-labeled.png)

Resimde işaretli `9 ayar` görülebilir. Şimdi tek tek, bunların üzerinde duracağız. 

`1 numara` ile gösterilen ayar, DVD’deki orijinal ses dosyasını hangi formata dönüştüreceğimizi seçeceğimiz ayar. Aşağıdakiler formatlar yüklü geliyor:

![robot4rip tools audio-preferences select audio encoder settings](./images/dvd-to-divx-encoding-guide/13-robot4rip-tools-audio_preferences-select-audio-encoder-settings.png)

Bu formatlara ilave yapmak istersek önceki resimde 4 numara ile gösterdiğim yerdeki script ile oynamamız gerekecek. Örneğin mp3 128kbps vbr için script burada mevcut: 

-core( -input "%input%" -output "%output%" -logfile "%log%" ) -ota( -hybridgain -d %delay% ) -azid( -L -3db -c normal ) -lame( --alt-preset 128 ) -profile( %version% )

Şimdi buraya, mp3 192kbps vbr ekleyelim. 

Bunun için yukarıdaki resimde ilk 5 numara dolu, 6 numarayı seçelim. Bir üst resimde 2, 3 ve 4 numaralı yerlerdeki değerlerin ve yazıların kaybolduğunu göreceksiniz. Yeni ekleyeceğimiz format için 2 numaralı yere bir isim girelim: mp3 vbr 192. 3 numaralı yere extension olarak mp3 yazalım. Ses formatını, yaratacağımız 4 numaralı script kısmına ya yaratacağımız ses formatının script’ini öğrenip gireceğiz ya da mp3 192kbps için az yukarıya italik olarak kopyaladığım script’teki 128 değerini 192 yapacağız. Bundan sonra, transcoding işleminde bu formatı kullanmak için;

![robot4rip audio tracks](./images/dvd-to-divx-encoding-guide/14-robot4rip-audio-tracks.png)

Yukarıdaki gibi ana ekranda, transcode etmek istediğimiz ses dosyasına sağ tıklayıp listeden çevireceğimiz formatı seçeceğiz.


