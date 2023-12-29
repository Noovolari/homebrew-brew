class LeappCliDarwinArm64 < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.56"
  url "https://noovolari-leapp-website-distribution-cli.s3.eu-west-1.amazonaws.com/0.1.56/leapp-v0.1.56-1d42dae-darwin-x64.tar.xz"
  sha256 "5081d2bdac3486259fbc1a3ed1722a726d174464ad760f13b88bf5293e6bd8db"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end