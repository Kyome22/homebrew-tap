class Luca < Formula
  desc "Command line tool to construct LUCA for Xcode project."
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/2.0.0.tar.gz"
  sha256 "6bc04084c8d98e935e21c15e32f1b282babeaed9a3ae8f8752d66a95d2ee5dab"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  bottle do
    root_url "https://github.com/Kyome22/LUCA/releases/download/1.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3d30e71077683dd9a62781d5121201a5ddb21ade1fcb9492af94fb372f609944"
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
