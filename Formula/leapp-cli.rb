class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.9"
  url "https://noovolari-leapp-website-distribution-cli.s3.eu-west-1.amazonaws.com/0.1.9/leapp-v0.1.9-fe446a9-darwin-x64.tar.xz"
  sha256 "49f12ec7191f0d4251d010a04763c8ba9a6b50243619458ba5cd19a9917febb9"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end