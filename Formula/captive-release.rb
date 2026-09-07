class CaptiveRelease < Formula
  desc "CLI de release semver pour les projets Captive"
  homepage "https://github.com/captive-studio/captive-release"
  url "https://rubygems.org/gems/captive-release-0.3.0.gem"
  sha256 "c2f89c9d30885e14ae5ccb489bc4244e4f37a4ceb667611e4b7858f2180335a2"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", cached_download, "--ignore-dependencies",
           "--no-document", "--install-dir", libexec
    bin.install libexec/"bin/captive-release"
    bin.each_child { |f| wrappers.install f }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/captive-release --version")
  end
end
