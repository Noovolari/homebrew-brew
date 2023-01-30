require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.29"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.29.tgz"
  sha256 "0bb30abc47b4f6e7f23629ee9dd79e8bf37f77212f54d2b4598a25f5853a302c"

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