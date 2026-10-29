class CaptiveCli < Formula
  desc "CLI développeur de la plateforme Captive"
  homepage "https://github.com/captive-studio/captive-platform"
  url "https://rubygems.org/gems/captive-cli-1.10.0.gem"
  sha256 "c87b95527dca15235c04e953668cadfc433408ae4994f2b860401cfff719808a"
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
