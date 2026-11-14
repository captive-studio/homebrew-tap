class CaptiveRelease < Formula
  desc "CLI de release semver pour les projets Captive"
  homepage "https://github.com/captive-studio/captive-release"
  url "https://rubygems.org/gems/captive-release-0.17.1.gem"
  sha256 "f6a24f25ccc587e73c4df1b62b2cb116904e542a9853197802a59104a189b047"
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
