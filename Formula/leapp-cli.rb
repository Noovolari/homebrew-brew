require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.54"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.54.tgz"
  sha256 "52f5590ff097ea27814c8eac762b5d30e447a560bed68ab75f95635079d7c1c9"

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