class LeappCliDarwinArm64 < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.22"
  url "https://noovolari-leapp-website-distribution-cli.s3.eu-west-1.amazonaws.com/0.1.22/leapp-v0.1.22-b048cef-darwin-x64.tar.xz"
  sha256 "d8544509089337d703f4d772187bc5234e18a3f666039b229d75babcd2c5f01b"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end