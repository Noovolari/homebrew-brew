require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.40"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.40.tgz"
  sha256 "b45bc1e9fb91f5695313afa6eb87400d6865ffbbd5311e942dad1893cc4d7c9a"

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