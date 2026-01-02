class Macdisp < Formula
  desc "macOS display configuration utility - Rust implementation of displayplacer"
  homepage "https://github.com/noworrieseh/macdisp"
  url "https://github.com/noworrieseh/macdisp/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "00e8c5d7acb5dbe44e286bf942b4a33378ed58195df3d3dbb071d83e646cccf8"
  license "MIT"
  head "https://github.com/noworrieseh/macdisp.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Test that the binary runs and shows help
    assert_match "macOS command line utility to configure display settings", shell_output("#{bin}/macdisp --help")

    # Test list command with JSON output
    assert_match "persistent_id", shell_output("#{bin}/macdisp list --json")
  end

  def caveats
    <<~EOS
      macdisp is a command-line utility for configuring macOS displays.

      Usage examples:
        macdisp list                    # List all displays
        macdisp list --json             # List displays as JSON
        macdisp modes 1                 # Show available modes for display 1
        macdisp modes 1 --json          # Show modes as JSON
        macdisp notch hide              # Hide the notch on MacBook Pro
        macdisp notch show              # Show the notch on MacBook Pro
        macdisp notch toggle            # Toggle notch visibility

      Configure displays:
        macdisp "id:1 res:1920x1080 hz:60 color_depth:8 scaling:on origin:(0,0)"

      For more information, visit: https://github.com/noworrieseh/macdisp
    EOS
  end
end
