# typed: false
# frozen_string_literal: true

class Sage < Formula
  desc "CLI for Sage Protocol - wallets, IPFS, libraries, governance, and MCP"
  homepage "https://github.com/sage-protocol/sage"
  license "GPL-3.0-or-later"
  version "0.9.21"

  on_macos do
    on_arm do
      url "https://github.com/sage-protocol/sage/releases/download/v0.9.21/sage-aarch64-apple-darwin.tar.gz"
      sha256 "b5a064326402c764bd425e05cea15bc04ef081a9a0f2851e7e8a2e0c352be913"
    end
    on_intel do
      url "https://github.com/sage-protocol/sage/releases/download/v0.9.21/sage-x86_64-apple-darwin.tar.gz"
      sha256 "3a314eca915fc7328aaabb1dde8b18d627f6d9750a3b3b702a7f61424e4cdf3d"
    end
  end

  on_linux do
    depends_on "gtk+3"
    depends_on "libayatana-appindicator"
    on_intel do
      url "https://github.com/sage-protocol/sage/releases/download/v0.9.21/sage-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89797ed20f829f39bb4b42f08555bd7426da8c25611779ffd16067bfd0366d35"
    end
  end

  def install
    bin.install "sage"
    bin.install "saged"
    bin.install "sage-app" if File.exist?("sage-app")
  end

  service do
    run [opt_bin/"saged"]
    keep_alive true
    log_path var/"log/saged.log"
    error_log_path var/"log/saged.log"
  end

  test do
    assert_match "sage", shell_output("#{bin}/sage --version")
  end
end
