require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.26"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.26.tgz"
  sha256 "79a91a7b03a1d775363a5e7f087c5b7e1739e5615059010980584558bed9c00f"

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