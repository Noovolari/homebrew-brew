require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.32"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.32.tgz"
  sha256 "a4ffe8aa2a3368f468a9996ad0f59b454d25eacdf5dc7935f45ada64fffd5082"

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