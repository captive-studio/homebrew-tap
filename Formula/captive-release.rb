class CaptiveRelease < Formula
  desc "CLI de release semver pour les projets Captive"
  homepage "https://github.com/captive-studio/captive-release"
  url "https://rubygems.org/gems/captive-release-0.3.2.gem"
  sha256 "ed980f16cb09456860a4ebd111a69fc12829fee4c9e0bba6d02ab0d22750373d"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", cached_download, "--ignore-dependencies",
           "--no-document", "--install-dir", libexec
    bin.env_script_all_files(libexec/"bin", GEM_HOME: libexec)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/captive-release --version")
  end
end
