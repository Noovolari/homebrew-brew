require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.16"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.16.tgz"
  sha256 "10f23f18a1eee148b28122b2196bc80ecb875b4f47f35d6dfc9b71e688a9567b"

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