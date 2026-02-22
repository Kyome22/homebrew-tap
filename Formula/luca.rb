class Luca < Formula
  desc "Command line tool to construct LUCA for Xcode project."
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/2.1.0.tar.gz"
  sha256 "3fe48263d591f8568f389d63ad5b07cbfbf90ea4ef485ee5f3eab4990a555300"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  bottle do
    root_url "https://github.com/Kyome22/LUCA/releases/download/2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "fa705682582b14ca893ecb1076594ca49b477b379f143a6e932392cbe2de332b"
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
    bin.install ".build/release/LUCA_LUCAKit.bundle"
  end

  test do
    system "false"
  end
end
