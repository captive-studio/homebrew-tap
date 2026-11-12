class CaptiveRelease < Formula
  desc "CLI de release semver pour les projets Captive"
  homepage "https://github.com/captive-studio/captive-release"
  url "https://rubygems.org/gems/captive-release-0.16.4.gem"
  sha256 "877fdd762f1f5643f2c01290b18a680c776d323835ef7e437bb441bd318cf8d4"
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
