class Luca < Formula
  desc "Command-line tool to construct LUCA for Xcode project"
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/3.0.0.tar.gz"
  sha256 "ce127a5fbb6cb1c505deb5386507566e1dce70ebb5a364ecf0840630a4201d7f"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  bottle do
    root_url "https://github.com/Kyome22/LUCA/releases/download/3.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8c653c088fa179f765366a7de8f4f26f82876fbbba53345ed70b6bdfbd4996fa"
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
