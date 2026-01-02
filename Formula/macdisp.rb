class Macdisp < Formula
  desc "Display configuration tool for macOS"
  homepage "https://github.com/noworrieseh/macdisp"
  url "https://github.com/noworrieseh/macdisp/archive/refs/tags/v0.2.1.zip"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/macdisp"
  end
end

