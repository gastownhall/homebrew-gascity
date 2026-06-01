# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.2.1/gascity_1.2.1_darwin_arm64.tar.gz"
      sha256 "c49f36a30d4f755d1549123fb9fc7934dc00a5fec179f7d4048d14176a5f0fab"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.2.1/gascity_1.2.1_darwin_amd64.tar.gz"
      sha256 "03786aaadb119a3f8bb68fd8a300d92b8a651d478ac6f122e59fa363fa9e8e15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.2.1/gascity_1.2.1_linux_arm64.tar.gz"
      sha256 "305c55fe2832383264b4fb70a66af3d6af6255990c586760f8b21f01e6f043d4"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.2.1/gascity_1.2.1_linux_amd64.tar.gz"
      sha256 "7abc26d826881d38219600e25e78a0a36802eddf9e6ed77046275f5ec9e72172"
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
