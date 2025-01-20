# haskell-template (forked)

A template for developing Haskell projects with Nix

## Ethics of this fork

Before you start, please read [CONDUCT.md](./CONDUCT.md), which explains the
motivations for this fork and cautions about the externally linked documentation
for this project, specifically on https://srid.ca.

## Project goals

Get a Haskell development environment up and running quickly. Thanks to Nix, this template is optimized for a fully reproducible and friendly development environment. It is based on:

- [Nix](https://srid.ca/haskell-nix) + [Flakes](https://serokell.io/blog/practical-nix-flakes) (via [`github:shajra/haskell-flake`](https://github.com/shajra/haskell-flake)) + GHC 9.6
- VSCode + [HLS](https://github.com/haskell/haskell-language-server)
- [fourmolu](https://github.com/fourmolu/fourmolu) autoformatting
- [Relude](https://github.com/kowainik/relude) as Prelude.
  - `.hlint.yaml` is [from relude](https://github.com/kowainik/relude/blob/main/.hlint.yaml)
- Devshell commands are provided via [just](https://just.systems/); run `just` in devshell.

If you have an *existing* Haskell project, consider using https://github.com/shajra/haskell-flake instead.

## Getting started

Initialize this template using:

```sh
nix run github:juspay/omnix -- \
  init github:shajra/haskell-template -o ./yourproject
```

The command may take some time to build `omnix`.  If you want to use pre-built
binaries, you can run the command with `nix --accept-flake-config`, which allows
`justpay/omnix` to bypass security guards and inject Nix configuration.  But you
can [see what's injected][omnix-nix-config] (an external Nix substitutor) and
decide for yourself.

*tldr: [Install Nix](https://nixos.asia/en/install), [setup direnv](https://nixos.asia/en/direnv), open in VSCode, install recommended extensions and run `just run`.*

Full instructions: https://srid.ca/haskell-template/start

Recommended dev environment setup: https://nixos.asia/en/direnv

## Tips

- Run `nix flake update` to update all flake inputs.
- Run `nix run github:juspay/omnix ci` to build _all_ outputs.
- [pre-commit] hooks will automatically be setup in Nix shell. You can also run `pre-commit run -a` manually to run the hooks (e.g.: to autoformat the project tree using fourmolu, nixpkgs-fmt, etc. as well run programs like hlint). The hooks will checked as part of flake checks (thus CI).
- Run `just docs` to start Hoogle with packages in your cabal file.
- Run the application without installing: `nix run github:shajra/haskell-template` (or `nix run .` from checkout)
- Common workflows
  - Adding library dependencies in Nix: https://community.flake.parts/haskell-flake/dependency
  - Adding tests: https://shajra/haskell-template/tests

## Release

Be aware that for now the `main` branch of this fork will rebase against
upstream development. Though an inconvenience for collaboration, this makes it
easier to maintain this work. End user consumption through flakes should be
unaffected.

[pre-commit]: https://github.com/cachix/git-hooks.nix
[omnix-nix-config]: https://github.com/juspay/omnix/blob/main/flake.nix#L2-L5
