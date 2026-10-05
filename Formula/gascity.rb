# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.5.0/gascity_1.5.0_darwin_arm64.tar.gz"
      sha256 "e276f0a20a5e196d6bb9ab205824b1290e1ea5d929c907afa072bc704952861b"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.5.0/gascity_1.5.0_darwin_amd64.tar.gz"
      sha256 "7ee60580a23fc3afeed83bcd149106cb921120dbeebd85922da3112b357ca185"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.5.0/gascity_1.5.0_linux_arm64.tar.gz"
      sha256 "dcd841f38d0f7c4a4294c9a6df6fac6b108a96ebae8e2ee6488386420659d1b5"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.5.0/gascity_1.5.0_linux_amd64.tar.gz"
      sha256 "0ff5cfc3f1cb2e4260d3d93fcce7a4e40bb5675b74eb9de185156757d4f7fa9c"
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
