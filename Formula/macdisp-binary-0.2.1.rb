class MacdispBinary < Formula
  desc "macOS display configuration utility - Rust implementation of displayplacer"
  homepage "https://github.com/noworrieseh/macdisp"
  version "0.2.1"
  license "MIT"

  on_arm do
    url "https://github.com/noworrieseh/macdisp/releases/download/v0.2.1/macdisp-macos-v0.2.1.tar.gz"
    sha256 "ab6ef7ce5fc482d09d5853b27cf57140abd1abdcd48e2da67a2492c4d3e88501"
  end

  on_intel do
    url "https://github.com/noworrieseh/macdisp/releases/download/v0.2.1/macdisp-universal-v0.2.1.tar.gz"
    sha256 "b5c35e6c88ea37f196642308dd492251eb7b2fb66374392aafd3b8d8e2c10419"
  end

  depends_on :macos

  def install
    bin.install "macdisp"
  end

  test do
    # Test that the binary runs and shows help
    assert_match "macOS command line utility to configure display settings", shell_output("#{bin}/macdisp --help")

    # Test version info
    assert_match version.to_s, shell_output("#{bin}/macdisp --version 2>&1", 1)

    # Test list command with JSON output (requires a display)
    system "#{bin}/macdisp", "list", "--json"
  end

  def caveats
    <<~EOS
      macdisp has been installed!

      Quick Start:
        macdisp list                    # List all displays
        macdisp list --json             # List displays as JSON
        macdisp modes 1                 # Show available modes for display 1
        macdisp modes 1 --json          # Show modes as JSON

      MacBook Pro Notch Commands:
        macdisp notch hide              # Hide the notch
        macdisp notch show              # Show the notch
        macdisp notch toggle            # Toggle notch visibility

      Configure Displays:
        macdisp "id:1 res:1920x1080 hz:60 color_depth:8 scaling:on origin:(0,0)"

      Multiple Displays:
        macdisp "id:1 res:2560x1440 hz:60 origin:(0,0)" \
                "id:2 res:1920x1080 hz:60 origin:(2560,0)"

      For more information:
        https://github.com/noworrieseh/macdisp
    EOS
  end
end
