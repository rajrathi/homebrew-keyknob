# Homebrew tap for Keyknob

[Keyknob](https://github.com/rajrathi/keyknob) is a configurator and knob
helper for the AULA F75 Pro keyboard.

```sh
brew install --cask rajrathi/keyknob/keyknob
```

For the Mac-only keys (Command/Option swap, a real Globe key on the knob
press or Caps Lock), also install Karabiner-Elements:

```sh
brew install --cask karabiner-elements
```

Then open Keyknob → **Mac keys**. Full guide:
[packaging/macos/README.md](https://github.com/rajrathi/keyknob/blob/plan6-macos/packaging/macos/README.md).

Keyknob is ad-hoc signed, not notarized; the cask removes the download
quarantine so macOS opens it.
