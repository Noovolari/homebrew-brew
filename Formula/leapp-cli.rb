require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.39"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.39.tgz"
  sha256 "061a6db658a8fd3eb1a3b271db09543c3646718d0f5d2fee040e8eb363897ff5"

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