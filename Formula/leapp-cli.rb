require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.23"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.23.tgz"
  sha256 "ce054ac44c4fabefef0713db5fcd25888e556ce8031bad4c188134b0fc46607d"

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