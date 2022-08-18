require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.18"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.18.tgz"
  sha256 "4c1fa2c76846b8e58785123211f89bdbca7916753a383dfbcac28fcc99cf086a"

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