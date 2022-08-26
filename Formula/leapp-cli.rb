require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.20"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.20.tgz"
  sha256 "902e29c77e7d8a837b6704489be5c157ebfd494b7ec80968447951cb87579c3b"

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