class Luca < Formula
  desc "Command line tool to construct LUCA for Xcode project."
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/2.2.0.tar.gz"
  sha256 "0360df1fe4fdc27fbec00918e7c8a7d3570c2d4e0c9bc3eeffa00738bc3f2450"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  bottle do
    root_url "https://github.com/Kyome22/LUCA/releases/download/2.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3592c0b3765c63caef8d70f25720cad6b8a8c3bc4d8e33a6fdc8b53b31bbbb33"
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
