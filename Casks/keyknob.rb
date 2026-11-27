# Homebrew cask for Keyknob (https://github.com/rajrathi/keyknob).
#
#   brew install --cask rajrathi/keyknob/keyknob
#
# `version` and `sha256` are updated after each release by
# packaging/macos/bump-cask.sh in the keyknob repository.
cask "keyknob" do
  version "0.1.3"
  sha256 "7b92fff2e56f63608c4ad337c0809dbd6bf122e220461d524ce6b7705becdb0f"

  url "https://github.com/rajrathi/keyknob/releases/download/v#{version}/Keyknob_#{version}_universal.dmg"
  name "Keyknob"
  desc "Configurator and knob helper for the AULA F75 Pro keyboard"
  homepage "https://github.com/rajrathi/keyknob"

  depends_on macos: ">= :big_sur"

  app "Keyknob.app"

  # Keyknob is ad-hoc signed, not notarized (no paid Apple developer account).
  # Without this, macOS refuses to open a downloaded copy.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Keyknob.app"]
  end

  uninstall quit: "app.keyknob"

  # Keyboard backups and knob settings in ~/Library/Application Support/keyknob
  # are kept on purpose: the first backup is the keyboard's factory state.
  zap trash: [
    "~/Library/Caches/app.keyknob",
    "~/Library/WebKit/app.keyknob",
  ]

  caveats <<~EOS
    Mac-only keys (Command/Option, Globe on the knob press or Caps Lock)
    are applied by Karabiner-Elements:
      brew install --cask karabiner-elements
    Then open Keyknob → Mac keys tab.

    The knob helper needs Accessibility permission (Keyknob → Knob tab → Allow…).
    After an upgrade, turn Keyknob off and on again in
    System Settings → Privacy & Security → Accessibility.
  EOS
end
