# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.2/gascity_1.3.2_darwin_arm64.tar.gz"
      sha256 "be4718c7781a83e4f8e88ef29bd31d40a15d7ac5f32b0d44257551e3b3f752bf"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.2/gascity_1.3.2_darwin_amd64.tar.gz"
      sha256 "85bf12b9f4db8fe8c5cff98cb79804d4fbe418a01e381d7c09e6002ec4c986b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.2/gascity_1.3.2_linux_arm64.tar.gz"
      sha256 "a6240bf8bb81c1ff00b604d02f96ddcc466a2fa1b4fffe8f9e94963bd99be8ae"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.2/gascity_1.3.2_linux_amd64.tar.gz"
      sha256 "09f2a357b6260dbb56817cc8a173f5e94bd51fcee1c1ea3f106301026a4439f3"
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
