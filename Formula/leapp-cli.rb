require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.30"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.30.tgz"
  sha256 "8089e23076b997de3199243c2fa4bc55f9c1bf16edefb62f959b02955d5b2857"

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