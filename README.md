# ❄️ xokdivum's project templates 🤯

This repository contains several ready-to-go project templates for
several languages. All of the templates are exposes via a nix flake.

Currently supported languages:

- [x] C/C++
  - Build system is [CMake](https://cmake.org/)
  - Formatter - [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
  - Static analysis - [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
- [x] Ruby
- [x] Rust
- [ ] Nix

## How to use 📖

To initialize a directory with a template of your choosing run:

```bash
cd mycoolproject
nix flake init -t "github:xokdvium/project-templates#cpp"
```

Each repository contains a `justfile` with basic functionality to run 
linters and formatters via [lint-nix](https://github.com/xc-jp/lint.nix).

Basic usage:

```bash
just format # to format the repo
just check # run all checkers and linters
just lint # format & check
just run-workflows # run github actions via act
```

Short aliases for the same commands:

```bash
just f # format
just l # lint
just r # run-workflows
```
