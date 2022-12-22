require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.27"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.27.tgz"
  sha256 "94291cf5dc98dad11a23eb91ed94df708a1b72e711d4a789c2535d355b49b46b"

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