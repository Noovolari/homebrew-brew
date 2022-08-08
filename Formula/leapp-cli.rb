require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.17"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.17.tgz"
  sha256 "7ba69db4b1d16194fa3f7bdaff61f9fc0facad6644eef96b5dc18382714879d0"

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