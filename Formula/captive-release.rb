class CaptiveRelease < Formula
  desc "CLI de release semver pour les projets Captive"
  homepage "https://github.com/captive-studio/captive-release"
  url "https://rubygems.org/gems/captive-release-0.11.0.gem"
  sha256 "52438a9f936b862187bf34681324d53247d62c04f4cc5a29ebeaa600374a46d0"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", cached_download, "--ignore-dependencies",
           "--no-document", "--install-dir", libexec
    (bin/"captive-release").write_env_script(libexec/"bin/captive-release",
                                              GEM_HOME: libexec,
                                              GEM_PATH: libexec)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/captive-release --version")
  end
end
