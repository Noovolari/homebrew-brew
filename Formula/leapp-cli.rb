class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.8"
  url "https://noovolari-leapp-website-distribution-cli.s3.eu-west-1.amazonaws.com/versions/leapp-v0.1.8-8d1cce9-darwin-x64.tar.xz"
  sha256 "89dafe21d9e545d0e58ae6eef771a226c5b5a73d403474eea39bf05b8ea3eec1"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end