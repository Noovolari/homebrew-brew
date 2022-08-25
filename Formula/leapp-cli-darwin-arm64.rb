class LeappCliDarwinArm64 < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.19"
  url "https://noovolari-leapp-website-distribution-cli.s3.eu-west-1.amazonaws.com/0.1.19/leapp-v0.1.19-6deb4b0-darwin-x64.tar.xz"
  sha256 "84e07e073e9c19e1eec0e32f9c7304784d7d04774107b8c81d49ceec0f9d7323"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end