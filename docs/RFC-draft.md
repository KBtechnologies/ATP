# !!!
## to be worked on...

---
### Notes:
- Suggested [MIME Type](https://en.wikipedia.org/wiki/Media_type): `application/atp.archive`
- Suggested [Filename Extensions](https://en.wikipedia.org/wiki/Filename_extensions): 
  - `.atpc` Airgapped Transfer Protocol Contailer.
    - This is a fully completed transmission and may behave like a `.tar.bz2.gpg` file:
      - aka. a `tar` archive compressed with `bzip2` and encrypted with `GnuPG`.
  - `.X.atps` Airgapped Transfer Protocol Splinter
    - Where `X` stands for the Splinter's number.
      - The files `.0.atps` to `N.atps` are being merged to one `.atpc` file.
  - `.atph` Airgapped Transfer Protocol Header
    - The Header as seperate file.
      - Normally this would be part of the 1st Splinter named `X.0.atps` which would be the 1st splinter of the ATPS file named `X.atpc`
