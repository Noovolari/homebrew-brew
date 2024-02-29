class LeappCliDarwinArm64 < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.62"
  url "https://noovolari-leapp-website-distribution-cli.s3.eu-west-1.amazonaws.com/0.1.62/leapp-v0.1.62-a94668c-darwin-x64.tar.xz"
  sha256 "98bd356369fd61d85147d5033bc96daf6899615c77110b89c58819727833ac4e"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end