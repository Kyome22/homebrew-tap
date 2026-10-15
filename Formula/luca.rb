class Luca < Formula
  desc "Command-line tool to construct LUCA for Xcode project"
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/3.2.0.tar.gz"
  sha256 "689d54eff5094ff232682f3beee984f0f752bcce3302b90a8851756eefe6ef72"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  bottle do
    root_url "https://github.com/Kyome22/LUCA/releases/download/3.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "712d1493ded57c729b8edb4a2aa897a41fc76032923264d0a5f27241c1edbc28"
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
    libexec.install ".build/release/XcodeGen_XcodeGenKit.bundle"
    bin.install_symlink libexec/"luca"
  end

  test do
    system "false"
  end
end
