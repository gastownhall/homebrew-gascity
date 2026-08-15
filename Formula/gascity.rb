# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.1/gascity_1.4.1_darwin_arm64.tar.gz"
      sha256 "019e5ae701531d5c080fdf99d2dc1e3c046ae76d2735918c4d94ecd5ed8ac7a0"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.1/gascity_1.4.1_darwin_amd64.tar.gz"
      sha256 "3dee149d1009fa9f4fb94a416c8cccdedfd21066e8faf5f6ac00949cc8c4e743"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.1/gascity_1.4.1_linux_arm64.tar.gz"
      sha256 "6620ef51c8ba620821e5ef8b208bb1b3de090fa86ec5e0327da1edd615407e29"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.1/gascity_1.4.1_linux_amd64.tar.gz"
      sha256 "8d8c8b511db3fc44931445aab5cb9f212509c0867105c880d6c3d0e6e5d33e42"
    end
  end

  depends_on "beads"
  depends_on "jq"
  depends_on "tmux"

  on_macos do
    depends_on "flock"
  end

  def install
    bin.install "gc"
  end

  def caveats
    <<~EOS
      Gas City depends on these runtime tools, installed as dependencies:
        beads (bd)  - issue tracker
        dolt        - beads storage (via beads)
        flock       - file locking
        jq          - JSON processing
        tmux        - session management

      Get started:
        gc init <city-path>      # create a new city
        gc start <city-path>     # start an existing city
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gc version")
  end
end
