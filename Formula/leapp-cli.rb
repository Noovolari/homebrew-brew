require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.37"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.37.tgz"
  sha256 "2a5ec83eac5538ee05abd78a18a77d940e96d51cffc842c164ab5f7b97ab6a20"

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