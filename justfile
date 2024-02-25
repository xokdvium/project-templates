alias f := format
alias l := lint
alias r := run-workflows

run-workflows:
  @act -P ubuntu-22.04=ghcr.io/catthehacker/ubuntu:runner-22.04

check:
  @nix build ".#all-checks" -L
  @nix flake check

check-format:
  @nix build ".#all-formats" -L

format:
  @nix build ".#format-all"
  @result/bin/format-all

lint: check format

update-inputs:
  #!/usr/bin/env bash
  for i in $(fd --full-path flake.nix); do
    echo $(cd $(dirname $i) && nix flake update)
  done
