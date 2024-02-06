require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.61"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.61.tgz"
  sha256 "9ec53e8a74cd14240d8a22f1eb5db6ef6b971d2f419712a0534da79bb252aa84"

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