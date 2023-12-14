require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.53"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.53.tgz"
  sha256 "a48e7f0313934cfc7a9b82b8e3bc71d0cba894f11b2da8327f49b1d36c20a81e"

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