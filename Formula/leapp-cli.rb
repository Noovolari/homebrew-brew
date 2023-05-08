require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.33"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.33.tgz"
  sha256 "311023b57f5f9d751f61bd3af9c95b182d368b8dffc36fa77f12d40a0184fbfc"

  depends_on "node"
  depends_on "libsecret"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec).reject { |a| a == "--build-from-source" }
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end