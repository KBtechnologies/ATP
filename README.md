# ATP
### Airgapped Transfer Protocol
##### A standard for transfering Files between airgapped units over a simplex transmission agnostic to the medium, transfer speed and distribution network.

---
## Why?
### TL;DR:
I wanted to find a sleek and secure way to exchange private keys securely and conveniently between devices that only have a cameras and screens.
- Said Keys exceeded the size of a QR Code, so I had to manually split and merge them, which was annoying me into "*weapons-grade boredom*".

So I started this here...

### Sensitive and Classified Information Exchange
Not everything can or should be transfered in the open, or at least not in a way that makes it trivial to [eavesdrop](https://en.wikipedia.org/wiki/Eavesdropping) and/or [manipulate](https://en.wikipedia.org/wiki/Replay_attack) data being transfered.
- This includes [public and espechally private keys](https://en.wikipedia.org/wiki/Public-key_cryptography) in asymetric encryption systems, like OpenPGP, GnuPG or similar.

### Deployment of Updates onto Airgapped Systems
To prevent ["Juice Jacking"](https://en.wikipedia.org/wiki/Juice_jacking) and other methods of attacks onto systems by physically connecting data lines to them.
- This may not prevent an [attacker from tampering](https://www.youtube.com/watch?v=U7VwtOrwceo&t=232s) with the hardware and [brute-forcing their way by fuzzing every pin they can find](https://www.youtube.com/watch?v=U7VwtOrwceo&t=335s) if not [blatantly sabotage hardware with tools](https://www.youtube.com/watch?v=RyW0lXnoFOA) but it should not be possible to crack a system without violating the physical integrity of it's casing and [soldering stuff onto the mainboard](https://www.youtube.com/watch?v=Vq1lxeg_gNs).
  - Attacks like [the Reset Glitch Hack](https://www.youtube.com/watch?v=hpOlGeCHwro) are out-of-scope.

Thus [Over-The-Air Updates](https://en.wikipedia.org/wiki/Over-the-air_update) are just not possible!

### Circumvent the issues of an RF transmission.
It may sometimes not feasible or desireable to transmit on certain bands, as they may suffer from overuseage if not malicious interference of the spectrum as [DoS or DDoS attack](https://en.wikipedia.org/wiki/Denial-of-service_attack).
- In many cases, this may even be illegal as per protocol.
  - This includes [TEMPEST - style shielded systems](https://en.wikipedia.org/wiki/Tempest_(codename)) that should neither be detected in operation nor eavesdropped upon.

### Why not use existing protocols?
Most existing Protocols don't handle simplex transmissions at all or very poorly.

Espechally for [Commercial Off-The-Shelf (COTS)](https://en.wikipedia.org/wiki/Commercial_off-the-shelf) Hardware and Software outside the [Hamradio Space](https://en.wikipedia.org/wiki/Amateur_radio) there is significant lack of solutions that are easy to use even by ["Tech Illterates"](https://en.wikipedia.org/wiki/Digital_literacy#Digital_natives_and_digital_immigrants).
- [Bluetooth](https://en.wikipedia.org/wiki/Bluetooth) and [WiFi](https://en.wikipedia.org/wiki/Wi-Fi) can be [trivially jammed](https://en.wikipedia.org/wiki/Wi-Fi_deauthentication_attack) with vry few countermeasures to [prevent deauthentification attacks](https://en.wikipedia.org/wiki/IEEE_802.11w-2009) even being standardized.
  - Implementation of said protections is costly and time consuming and not feasible in the field.
- [Li-Fi](https://en.wikipedia.org/wiki/Li-Fi), [RONJA](https://en.wikipedia.org/wiki/RONJA), [IrDA](https://en.wikipedia.org/wiki/Infrared_Data_Association) and other [(in)visible light communication systems](https://en.wikipedia.org/wiki/Visible_light_communication) all are bidirectional protocols and require both [handshakes](https://en.wikipedia.org/wiki/Handshake_(computing)) and are not easy to replay [even at absurdly low baud rates](https://www.youtube.com/watch?v=aqHauk3bNFA).
- [Consumer Infrared](https://en.wikipedia.org/wiki/Consumer_IR) may be sufficient for sending short commands via line of sight where repeating these is not an issue and [security is not a concern but at most an annoyance](https://www.youtube.com/watch?v=3IabovMr9LQ&t=101s) when attacked with Tools like the [Flipper Zero](https://en.wikipedia.org/wiki/Flipper_Zero).
- [USB](https://en.wikipedia.org/wiki/USB) is unfixably insecure and [BadUSB attacks](https://en.wikipedia.org/wiki/BadUSB) are rampant and basically impossile [to prevent or counteract in any meaningful way](https://www.youtube.com/watch?v=Aatp5gCskvk).
  - Thus [USB flashdrives](https://en.wikipedia.org/wiki/USB_flash_drive) and any other removeable media like [MicroSD cards](https://en.wikipedia.org/wiki/SD_card#microSD_2) cannot be trusted.
- That being said, encrypted Removeable Media are good at storing huge amounts of data, but aside from [Linux](https://en.wikipedia.org/wiki/Linux) supporting a [eCryptFS](https://en.wikipedia.org/wiki/ECryptfs) and [dm-crypt](https://en.wikipedia.org/wiki/Dm-crypt) there are hardly any solutions that work closs-platform aside from [VeraCrypt](https://en.wikipedia.org/wiki/VeraCrypt).
  - These are all great for amounts of data that go into the Megabytes and way beyond, but not for smaller files.
    - A solution that works as-easy as QR-Codes yet allows [more data to be transfered](https://en.wikipedia.org/wiki/QR_code#Information_capacity) is not only desireable but necessary.

---
## How?
The ATP Standard aims to be easy to implement and use.

### Encoding
#### 1. Archive Generation
The data to be tansmitted is to be collected in a container [this may be a folder or tar archive].
####

#### 2. Optional Compression
The Container is then to be compressed if desired.
- Compression is optional and can be omnitted.
  - Compression should be omnitted if the output is "not smaller" in that it could save any space in the sense of outputting less "splinters".
####

#### 3. Encryption
The optionally compressed Container can also be encrypted.
- Encryption is optional and can be omnitted.
  - Encryption can be handled externally by tools like [AESCrypt](https://www.aescrypt.com/), [age](https://github.com/FiloSottile/age), [enc](https://github.com/life4/enc), [OpenSSL](https://askubuntu.com/questions/60712/how-do-i-quickly-encrypt-a-file-with-aes/60713#60713), [GnuPG](https://en.wikipedia.org/wiki/GNU_Privacy_Guard) - regardless if [Public-Private Keys](https://en.wikipedia.org/wiki/Pretty_Good_Privacy#OpenPGP) or [symmetric keys](https://askubuntu.com/questions/60712/how-do-i-quickly-encrypt-a-file-with-aes/449647#449647) are being used.
####

#### 4. Checksumming
The Container is then checksummed.
- Checksumming can, but should not be omnitted.
  - A secure algorithm like [SHA3-512](https://en.wikipedia.org/wiki/SHA-3) is recommended.
####

#### 5. Header Creation
A Header is being used to communicate the essential parameters, including the following:
- Compression [if used, which type]
- Encryption [if used, which type]
- Checksum [if used]
- Total Size of the Container in bytes
- Number of Splinters [as of now, a maximum of 2¹⁶-1 = 65535 is specified]
  - This is considered sufficient for the current use-case, as this allows up to 193.524.855 bytes or ~ 184,56 MB of storage just by using QR Codes of 2.953 bytes each.
    - Under ideal constellations [60fps] this yields a gross "transfer rate" of ~173 kB/s
      - For comparison: [A 2880 kB 3,5" FDD can reach 1.000 kbit/s under ideal conditions](https://en.wikipedia.org/wiki/Floppy_disk#Sizes,_performance_and_capacity) and a [1x CD-ROM drive reaches 150 kbit/s](https://en.wikipedia.org/wiki/CD-ROM#Original_speed).
      - It would take 18 minutes and 12,27 seconds to do so.
  - In practical use, it's expected that rarely more than a few dozen or hundred will be needed to transfer said data.
  - The first splinter must contain the header.
- Size of the Splits [as of now, a maximum of 2¹⁶-1 = 65535 bytes is specified.]
- Unix Timestamp of Creation [can be omnitted.]
- Checksum of the header [if used, which type]
  - [Adler-32](https://en.wikipedia.org/wiki/Adler-32) is recommended.
##### Optional Link to a ["How To Decode?"](docs/howto-decode.md) - [Tutorial](https://en.wikipedia.org/wiki/Tutorial) if need be.
This should help uninitiated people to actually recieve and decode it.
####

#### 6. Splitting
To fit within the constraints of the medium used to transfer, the [optionally compressed] container is being split-to-size based off the parameters given.
####

#### 7. Storage and/or Transfer
The Splitted Parts [which may be called splinters] will then be stored and if necessary, converted into the format that is desireable for transfer.
- This can be [QR Codes](https://en.wikipedia.org/wiki/QR_code), [JAB Codes](https://en.wikipedia.org/wiki/JAB_Code) or other media.
  - Whilst not recommended, this could even be [RFID-](https://en.wikipedia.org/wiki/Radio-frequency_identification) and [NFC Tags](https://en.wikipedia.org/wiki/Near-field_communication) or [AFSK](https://en.wikipedia.org/wiki/Frequency-shift_keying#Audio_frequency-shift_keying) modulated Audio for transmission of [CB Radio](https://en.wikipedia.org/wiki/Citizens_band_radio) or Telephony as it's media agnostic.
##### Since the System is designed to do Simplex Data Transfers, it can be be retransfered or [time-shifted](https://en.wikipedia.org/wiki/Time_shifting) as desired.
####

### Decoding
Basically the same prcess as Encoding in reverse.
##### It's vital to have the complete header decoded successfully.

---
## Acknowledgements

### Proof of Concepts
- [Can you fit a whole game into a QR code?](https://www.youtube.com/watch?v=ExwqNreocpg), MattKC et. al.
  - Using a [QR Code](https://en.wikipedia.org/wiki/QR_code) to distribute a Win32 executeable of Snake which had to fit the [2.953 bytes size limit](https://en.wikipedia.org/wiki/QR_code#Information_capacity) of it.

In fact, one could just take a file, encode it in as [Base64](https://en.wikipedia.org/wiki/Base64) as per [RFC 4648](https://datatracker.ietf.org/doc/html/rfc4648) and spit it out as QR Code.
- This also means one could manually split and merge larger files.
  - In fact, automating that away is [the reason this was started in the first place](README.md#Why).
####

### Name
The name is chosen as a resemblance to [FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) as it aims at similar goals.
- [AFTP is a closed-source protocol for making FTP faster](https://www.jscape.com/blog/introducing-accelerated-file-transfer) aimed to circumvent the [TCP Slow Start Problem](https://en.wikipedia.org/wiki/TCP_congestion_control#Slow_start) on high-latency links like SATCOM.
- There also was an [FTP Client](https://en.wikipedia.org/wiki/Comparison_of_FTP_client_software) for [Android](https://en.wikipedia.org/wiki/Android_(operating_system)) named aFTP.
######
Since it not only can transfer Files but anything, ATP seemed to be a better naming for it.
####

### Existing solutions
#### Archive Splitting
[Archive Formats](https://en.wikipedia.org/wiki/Archive_file#Archive_formats) like [RAR](https://en.wikipedia.org/wiki/RAR_(file_format)), [BZip2](https://en.wikipedia.org/wiki/Bzip2) and [7zip](https://en.wikipedia.org/wiki/7-Zip)'s [7z Format](https://en.wikipedia.org/wiki/7z) among others do natively support splitting of files, something [TAR](https://en.wikipedia.org/wiki/Tar_(computing)), [PAX](https://en.wikipedia.org/wiki/Pax_(command)) don't.
- Of course there [are](https://superuser.com/questions/290986/how-to-create-tar-archive-split-into-or-spanning-multiple-files/290990#290990) [multiple](https://unix.stackexchange.com/questions/61774/create-a-tar-archive-split-into-blocks-of-a-maximum-size/61776#61776) [ways](https://stackoverflow.com/questions/1120095/split-files-using-tar-gz-zip-or-bzip2/1121070#1121070) to do that on the command line, but that's not an easy solution and does require quite a good knowledge on how to do this. 
  - It's also not trivial to reassemble the split archives unless natively supported by said application.
- It's quite cumbersome for a lot of work and not easy to do by Tech-Illiterates.
  - Whilst solutions like [PeaZip](https://en.wikipedia.org/wiki/PeaZip) support cascaded encryption, they are not multi-platform.
####

#### Applications already in public existance
- Updates for [REINER SCR Authenticator Devices are being distributed via YouTube Videos](https://www.youtube.com/watch?v=4Y4HqWP7my4)
  - These contain a series of QR Codes being shown multiple times to be scanned by the device and reassebled into a firmware update file.
    - This allows for updating the device in a secure manner by denying any opportunity for [Juice Jacking](https://en.wikipedia.org/wiki/Juice_jacking) and keeping said authenticator as an encapsulated decice and thus not needing to break any anti-tampering seals.
  - It is very likely these basically use a proprietary Imprementation of ATP that predates it with integrity checking, digital signatures and potentially even encryption to prevent malicious updates to be distributed and loaded.
    - At least that's what I hope for...
####

#### [SQR Codes](https://simple.wikipedia.org/wiki/SQR_codes)
Which are a patented [Secure QR Codes](https://de.wikipedia.org/wiki/QR-Code#Secure-QR-Code) that are encrypted in part or whole.
- These aim at the same, however being a patented and proprietary standard, to avoid infringement the ATP Standard aims to be more general and media-agnostic.
####

#### [PhotoTAN](https://de.wikipedia.org/wiki/Transaktionsnummer#photoTAN_und_QR-TAN)
Which is a [PSD2](https://en.wikipedia.org/wiki/Payment_Services_Directive#Revised_Directive_on_Payment_Services_(PSD2))-compliant [TAN](https://en.wikipedia.org/wiki/Transaction_authentication_number) System designed to authenticate Bank Transactions.
- It typically uses a 25x25 pixel grid which has either red, green, blue or no [white] dots and can encode around 100 Bytes od Data.
  - It is being used with either Apps or dedicaded devices to Authorize Transactions.
####