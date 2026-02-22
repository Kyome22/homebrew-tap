class Luca < Formula
  desc "Command line tool to construct LUCA for Xcode project."
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/2.1.0.tar.gz"
  sha256 "352abe745140efbd2b48c5eb28dc0da5d7051a64cfbbdca4dcb4122331ac77c1"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  bottle do
    root_url "https://github.com/Kyome22/LUCA/releases/download/2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "79cb2e872fda468dfdc3bbb0693d037a857d5dfa0c709a622f96629770f4ac1a"
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
