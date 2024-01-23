require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.58"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.58.tgz"
  sha256 "6c6baea16a1cf3f084fb58fd044d2fdbaa763ea47242a6ca7492a84e90645923"

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