<p align="center">
  <img width="100%" src="https://raw.githubusercontent.com/mauro-balades/sf/main/images/header_image.png">
</p>
<p align="center">
  <a href="https://github.com/mauro-balades/sf/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/mauro-balades/sf?labelColor=2A2734&color=ef282c&style=for-the-badge" alt="License: MIT">
  </a>
  <a href="#">
    <img src="https://img.shields.io/github/last-commit/mauro-balades/sf?labelColor=2A2734&color=ef282c&style=for-the-badge" alt="Active development">
  </a>
</p>

---

### What is sf?

sf (Small fetcher) is a distribution system fectcher for UNIX-like operating systems. It is very small and the idea was to make it in less than `400` lines (comments does not count). It is very customizable and it works well for linux ricing.


* /etc/os-release
* `UNIX-like` OS

But don't worry if you don't have those files/programs, sm checks
if they exist and it has default values if you use a distro wich
does not meet the requirements. Sm has support for a lot of linux
Distributions such as: Ubuntu, void Gentoo and many more.

The purpose of sm is to create a simple low-weight system information
fetcher.The fetcher is made in less than 500 lines of bash code (comments
does not count). It is a single file programm so you can install it easily
on your /usr/bin or you can use the installer (more info in the `README.md`).

### Instalation

To install sf, curl the instalation script and run it with bash.

**note**: it will use `sudo` so that the shell script can be in `/bin/sf`.

```
curl -fsSL https://raw.githubusercontent.com/mauro-balades/sf/main/install.sh | sh
```

### Thanks

* [ufetch](https://gitlab.com/jschx/ufetch) for the ASCII art.
* Thanks to all of the starazers!

#### License

* `Small fetcher` is under the license of [MIT](./LICENSE)
