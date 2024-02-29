require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.62"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.62.tgz"
  sha256 "2d0282269cda0f6d9b2ad7c149063a4b92c334275b179e8874440200ef8cc773"

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