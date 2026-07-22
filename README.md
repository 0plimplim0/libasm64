# Libasm64

A modular low-level library ecosystem written in pure x86-64 Assembly. Its core provides standard functionality while additional modules extend it with specialized capabilities such as compression, windowing and more.

> **NOTE:** This project targets **Linux x86-64** and is not intended to be linked with **glibc**. Programs should be built using the provided build templates.

---

## Prerequisites

To compile and link the library you'll need the standard GNU development tools:
* `as` (GNU Assembler)
* `ar` (Archiver)
* `make` (GNU Make)
* `gcc` (GNU Compiler Collection)

---

## How to build

First clone the repository:
```bash
git clone https://github.com/0plimplim0/libasm64
cd libasm64
```

### 1. Just for Assembly (Generate static file `.a`)
If you're going to code in pure assembly and only need the static file:
```bash
make
```

### 2. Just for C (Generate static file with bindings)
If you're going to make your own things and just want the static file:
```bash
make c
```

### 3. Full distribution (Recommended)
Packs everything you'll need (Headers + static file + makefile template) in one directory:
```bash
make dist
# dist/ contains all you need to start coding.
```

---

## Modules

- **Core** - Standard low-level routines.

---
## Documentation

The detailed reference for functions and calling conventions is divided by language:

* [Assembly](documentation/assembly/index.md)
* [C](documentation/c/index.md)

---

## License

[MIT](LICENSE)