require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.47"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.47.tgz"
  sha256 "ed0dafacdbf47c986dfaefdeea77579104b57960309e9a85935354fc8d4bdd00"

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