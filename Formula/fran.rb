class Fran < Formula
  desc "a cli for simple tasks in your localhost, franferri.io apis wrapper"
  homepage "https://github.com/franferri/homebrew-cli"
  
  on_macos do
    if Hardware::CPU.arm? # macOS ARM64 (Apple Silicon)
      url "https://github.com/franferri/homebrew-cli/releases/download/latest/fran-macos-arm64"
      sha256 "496baa8b1f36c5a46e8e61997de9edd587d31651dd75e88fe0cdd827a701d238"
    elsif Hardware::CPU.intel?
      odie "This formula is only supported on macOS ARM64 (Apple Silicon)."
    end
  end

  def install
    bin.install "fran-macos-arm64" => "fran"
  end

  def caveats
    <<~EOS
      This CLI is currently only supported on macOS ARM64 (Apple Silicon) platforms.
    EOS
  end

  test do
    system "#{bin}/fran", "--version"
  rescue StandardError
    opoo "Unable to run version check"
    false
  end
end