require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.42"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.42.tgz"
  sha256 "5c70a574d25f131c37f208aa43715de3f56f21a87eb8f12b403d79267a95a06a"

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