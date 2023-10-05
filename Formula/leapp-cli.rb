require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.45"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.45.tgz"
  sha256 "8f9430f08a7a4969d4ec7caf0b3b6b4140788684b6d141651a3f04913f45def1"

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