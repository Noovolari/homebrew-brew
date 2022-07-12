require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.14"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.14.tgz"
  sha256 "df15db24f3d2c29d6df81cd44f7358061e8699fda0c190e781b5e5b7fec51a3b"

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