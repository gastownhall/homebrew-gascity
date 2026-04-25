# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.0.0/gascity_1.0.0_darwin_arm64.tar.gz"
      sha256 "4b6cdbffd528b4b2985108fcd8e212d26deceeecc78e4b28f95a09c7e3091459"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.0.0/gascity_1.0.0_darwin_amd64.tar.gz"
      sha256 "d74e75863ed169c0b5dbf6b65f9332f7cd016db13211cc8a438f80e7b825319c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.0.0/gascity_1.0.0_linux_arm64.tar.gz"
      sha256 "0d3107b83ca4e3ad33cc6e145844079d1f4027304c621e071f2f085c64d9a67a"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.0.0/gascity_1.0.0_linux_amd64.tar.gz"
      sha256 "cc45e6be54c6bb00fe6915829f8beabb25a585b604a47846845aa7b9a70370d3"
    end
  end

  depends_on "beads"
  depends_on "jq"
  depends_on "tmux"

  # flock: ships with util-linux on Linux, needs brew on macOS.
  on_macos do
    depends_on "flock"
  end

  def install
    bin.install "gc"
  end

  def caveats
    <<~EOS
      Gas City depends on these runtime tools, installed as dependencies:
        beads (bd)  — issue tracker
        dolt        — beads storage (via beads)
        flock       — file locking
        jq          — JSON processing
        tmux        — session management

      Get started:
        gc init <city-path>      # create a new city
        gc start <city-path>     # start an existing city
    EOS
  end

  test do
    # Binary is installed and reports the tagged version.
    assert_match version.to_s, shell_output("#{bin}/gc version")
  end
end
