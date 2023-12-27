require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.55"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.55.tgz"
  sha256 "5f22f1a097c7bd9caa56ed0c4340de699f267ea158ccab4775cb26725e4d81c3"

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