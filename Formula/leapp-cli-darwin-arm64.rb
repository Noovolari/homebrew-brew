class LeappCliDarwinArm64 < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.21"
  url "https://noovolari-leapp-website-distribution-cli.s3.eu-west-1.amazonaws.com/0.1.21/leapp-v0.1.21-02174da-darwin-x64.tar.xz"
  sha256 "4167b41dc6bbaad705088dda0c7dd70bc959e400216e111337f1c2b38fc2d97a"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end