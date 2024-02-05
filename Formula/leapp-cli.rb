require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.60"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.60.tgz"
  sha256 "d0b2336636d8f1fd2fee5f5261e696973947f27117910e50ff04d1c1b36710b2"

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