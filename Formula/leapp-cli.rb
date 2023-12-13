require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.52"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.52.tgz"
  sha256 "071043bd671778421ba4dd1ff06b663757b942e5cd908865518514c0996ba767"

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