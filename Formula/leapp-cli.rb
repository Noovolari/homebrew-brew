require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.44"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.44.tgz"
  sha256 "9e1315f9a8204073555bead50443be0c3d0c8b3c4cbcde1ab9c81dd54bde34f3"

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