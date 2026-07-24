# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.0/gascity_1.4.0_darwin_arm64.tar.gz"
      sha256 "560c5867dfb4066468f80ad649a56afcc3785c464efb44277c1a3a82b33dc071"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.0/gascity_1.4.0_darwin_amd64.tar.gz"
      sha256 "c4e6fea3d5a8aecd05ecaeb0038ab2ea8ca9d1da07e1b35ff8c43056f968632d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.0/gascity_1.4.0_linux_arm64.tar.gz"
      sha256 "672eb244613812332a6524a982e0c3455956f1813f4fa9a761e5f6103259a099"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.0/gascity_1.4.0_linux_amd64.tar.gz"
      sha256 "f6bd0bfaf2acc141642227629394dd3279761df4e1800235551af24d98b9cae0"
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
