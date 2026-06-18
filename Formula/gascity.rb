# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.0/gascity_1.3.0_darwin_arm64.tar.gz"
      sha256 "16fe6dc71dce8a36bbf756986589f554619051bad630e7abecac493177691d17"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.0/gascity_1.3.0_darwin_amd64.tar.gz"
      sha256 "e5664287258be2eb20bdcc79c4c3db6b56796978c3bb8e41dced62aeab809875"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.0/gascity_1.3.0_linux_arm64.tar.gz"
      sha256 "0c0d4c158ab7d0765940517023c64520ecc16480ba50dec4893387f6f4fa1b38"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.0/gascity_1.3.0_linux_amd64.tar.gz"
      sha256 "c993dcc59c5b58253e757dc33898250a7c6596d2a0e3454a41336895ee65137a"
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
