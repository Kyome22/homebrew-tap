class Luca < Formula
  desc "Command line tool to construct LUCA for Xcode project."
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/1.1.0.tar.gz"
  sha256 "7d4f1981d5cb490498f7c59bb1de04c02b048bdc80decdbb3f257849aa2a6659"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  bottle do
    root_url "https://github.com/Kyome22/LUCA/releases/download/1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "75fdb6953eba4301eb98fd03fc48dafc455afd992df42ef8f3fbe8be62c7d073"
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
