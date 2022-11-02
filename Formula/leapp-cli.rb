require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.25"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.25.tgz"
  sha256 "88c469d6c0952b8d4816f7278e524746b30240cb8d43db67574ea00512cc7b19"

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