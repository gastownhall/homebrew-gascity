# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.1/gascity_1.3.1_darwin_arm64.tar.gz"
      sha256 "c6aebdca4f93ef2d32ceae565b487d7942361adc5901936fe7724cfd336691d5"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.1/gascity_1.3.1_darwin_amd64.tar.gz"
      sha256 "66a59e05e8a181d1bfb5d7925b1d2a49b6e5399990cf8571d36da07eae23264d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.1/gascity_1.3.1_linux_arm64.tar.gz"
      sha256 "99a0243e56612da8ec9a891fbb69ede1a2051a71381403edaf42864fb697c538"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.1/gascity_1.3.1_linux_amd64.tar.gz"
      sha256 "b773b94d439085e78beb7983a3497f1f628d64feb049874ebedfa6a4c2aae21c"
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
