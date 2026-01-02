class Macdisp < Formula
  desc "Display configuration tool for macOS"
  homepage "https://github.com/noworrieseh/macdisp"
  url "https://github.com/noworrieseh/macdisp/releases/download/v0.2.1/macdisp-universal-v0.2.1.tar.gz"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/macdisp"
  end
end

