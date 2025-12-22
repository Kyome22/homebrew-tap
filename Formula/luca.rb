class Luca < Formula
  desc "Command line tool to construct LUCA for Xcode project."
  homepage "https://github.com/Kyome22/LUCA.git"
  url "https://github.com/Kyome22/LUCA/releases/download/1.0.0/luca"
  sha256 "03796527ddf6e0a8006fbd41a53ce484dcdb2bbd99f3b55b18f0b89868fbaee7"
  license "MIT"

  depends_on xcode: ["26.0", :build]
  depends_on :macos

  def install
    system "./configure", "--disable-silent-rules", *std_configure_args
    bin.install "luca"
  end
end
