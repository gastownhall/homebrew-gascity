# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.3/gascity_1.3.3_darwin_arm64.tar.gz"
      sha256 "fc9d694182540232c439b0d79dd7cefe577a8f006efc4f58755235e04713a271"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.3/gascity_1.3.3_darwin_amd64.tar.gz"
      sha256 "b84dc221db28b54fe99797a974ea68e4348542c43710f3997aecb51b3eceb5e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.3/gascity_1.3.3_linux_arm64.tar.gz"
      sha256 "3708cabda6a2566907a4e5b924b213b957cf96b6b8f18c0e35ad4db8da7d0543"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.3/gascity_1.3.3_linux_amd64.tar.gz"
      sha256 "0922a6d3a57877119d9d42ed95e18bfb009f2450f60fd2a6994918d4004cce32"
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
