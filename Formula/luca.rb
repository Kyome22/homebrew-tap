class Luca < Formula
  desc "Command line tool to construct LUCA for Xcode project."
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/1.0.0.tar.gz"
  sha256 "d0df02c78a4d406a4574feba074f3da886f6f05a1f77f14887233005457cf04b"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4a237e30a4c8463d36d6aa766b00dbb87e69ccd731102ba2fc0a0e3a87690a91"
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
    bin.install ".build/release/luca"
  end

  test do
    system "false"
  end
end
