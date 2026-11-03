class CaptiveCli < Formula
  desc "CLI développeur de la plateforme Captive"
  homepage "https://github.com/captive-studio/captive-platform"
  url "https://rubygems.org/gems/captive-cli-1.12.0.gem"
  sha256 "137a53bbf672ecb90a874c75cb0ba6ea3aa376347d679eea1d07f837680ddcfd"
  license "MIT"

  depends_on "kubernetes-cli"
  depends_on "ruby"

  # Contrairement à captive-release, le gem a des dépendances (thor, tty-prompt…) : gem
  # install les résout dans libexec au lieu de --ignore-dependencies.
  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", cached_download, "--no-document", "--install-dir", libexec
    (bin/"captive").write_env_script(libexec/"bin/captive",
                                     GEM_HOME: libexec,
                                     GEM_PATH: libexec)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/captive version")
  end
end
