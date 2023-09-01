require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.43"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.43.tgz"
  sha256 "61dfd04842146cc0109a2ab7e22fd86873aa7a7889e64f1a063e05a7c817054b"

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