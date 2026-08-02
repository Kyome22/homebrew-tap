class Luca < Formula
  desc "Command-line tool to construct LUCA for Xcode project"
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/3.1.0.tar.gz"
  sha256 "4e79a39a4cbe9d3d8ac7b9275012e5e2910c4cc87776769209e3503d819f77e6"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  bottle do
    root_url "https://github.com/Kyome22/LUCA/releases/download/3.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e591e631970fb19ecd4e7dcd938c258518c4a757ef0f5a4aef3849f87da3947d"
  end

  depends_on xcode: ["26.0", :build]

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end
    system "swift", "build", *args, "--configuration", "release"
    libexec.install ".build/release/luca"
    libexec.install ".build/release/LUCA_LUCAKit.bundle"
    bin.install_symlink libexec/"luca"
  end

  test do
    system "false"
  end
end
