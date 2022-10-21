require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.24"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.24.tgz"
  sha256 "d7aea722fb9c3c809f00828010a49706e61e9aa56647f2696eb8bdcb9a145210"

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