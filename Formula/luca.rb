class Luca < Formula
  desc "Command line tool to construct LUCA for Xcode project."
  homepage "https://github.com/Kyome22/LUCA"
  url "https://github.com/Kyome22/LUCA/archive/refs/tags/1.0.0.tar.gz"
  sha256 "d0df02c78a4d406a4574feba074f3da886f6f05a1f77f14887233005457cf04b"
  license "MIT"
  head "https://github.com/Kyome22/LUCA.git", branch: "main"

  depends_on xcode: ["26.0", :build]
  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on :macos

  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/luca"
  end
end
