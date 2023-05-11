require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.35"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.35.tgz"
  sha256 "7b233de08f4693c713ab1b3a2d840895ad750df17778b212bd91c74a87236f2d"

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