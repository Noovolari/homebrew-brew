class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.23"
  url "https://registry.npmjs.org/@lerna-test-forge/leapp-cli/-/leapp-cli-0.1.23.tgz
"
  sha256 "6f50e9374dfc2b50bdaa19c548da8c3339ec8a8e720646ff36befb7c5f0b7d9a"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end