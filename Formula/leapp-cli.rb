require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.22"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.22.tgz"
  sha256 "31e9c6be302f0a718dbb37c4017a5c3a22b29c799639cfd130549866e025dd2d"

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