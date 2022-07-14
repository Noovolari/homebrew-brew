require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.15"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.15.tgz"
  sha256 "408d06dfbf5291f6eda330dcfb6ab6c1f5e4f069f46a22aa3f5bab5808b4daea"

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