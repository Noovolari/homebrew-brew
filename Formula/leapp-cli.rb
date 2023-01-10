require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.28"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.28.tgz"
  sha256 "8621a801368d735d779d27580b5e0f251d1348e0de38b6c898ba402af2b02075"

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