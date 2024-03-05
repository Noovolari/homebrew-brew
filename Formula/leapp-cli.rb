require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.63"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.63.tgz"
  sha256 "ab2f51613f53430bd6e87d693dedd5dc301811ddba9d90567033411afdf7f090"

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