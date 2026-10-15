class CaptiveRelease < Formula
  desc "CLI de release semver pour les projets Captive"
  homepage "https://github.com/captive-studio/captive-release"
  url "https://rubygems.org/gems/captive-release-0.13.1.gem"
  sha256 "9231049333e12b2822e425ded7bc21ff3892e3ce5829664138ec75f39b16d272"
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
