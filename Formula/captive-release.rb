class CaptiveRelease < Formula
  desc "CLI de release semver pour les projets Captive"
  homepage "https://github.com/captive-studio/captive-release"
  url "https://rubygems.org/gems/captive-release-0.9.0.gem"
  sha256 "9870cca4df25490f68b8a576a3e81fbc02a2ed0ab9c321df13c83492458c68f3"
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
