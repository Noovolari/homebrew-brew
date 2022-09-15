require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.21"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.21.tgz"
  sha256 "2d0a1ed5e48fcb486c43f5a42bda4df886d2c8e80bc29ec76798075ed848194f"

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