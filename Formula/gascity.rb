# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.5.1/gascity_1.5.1_darwin_arm64.tar.gz"
      sha256 "26c56827bf1606f19720bd26b52f910700ff2d7fb7e1801da12ed7679d2e02a2"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.5.1/gascity_1.5.1_darwin_amd64.tar.gz"
      sha256 "6aac6aa31c5fab4552ed2b3ef44909ebd5474d3424e0550116a9aa846d0ae2a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.5.1/gascity_1.5.1_linux_arm64.tar.gz"
      sha256 "e75083c01562b1a66cb1931c336139693f51effa0e48dc91c402556bddf50e72"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.5.1/gascity_1.5.1_linux_amd64.tar.gz"
      sha256 "3a405a5455eb6216f7f65d4516a614e4913d83bc8964df8800e0533ab2d40044"
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
