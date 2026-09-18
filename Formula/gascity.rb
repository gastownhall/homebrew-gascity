# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.2/gascity_1.4.2_darwin_arm64.tar.gz"
      sha256 "13e73327547426edb89f3d5c73975b456ddc7c6f3336ae73b2cc17761af53b4c"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.2/gascity_1.4.2_darwin_amd64.tar.gz"
      sha256 "0ba2164e8935bc37cc756ef028f3f2dd8ab78b2da104b36372766b24f36e161e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.2/gascity_1.4.2_linux_arm64.tar.gz"
      sha256 "bdf31404ab00dbe14f8630e3864867bfe67ec06361e1ad7ee5268ad8a144d038"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.4.2/gascity_1.4.2_linux_amd64.tar.gz"
      sha256 "e67216ec7ea8a09677fd74f90286ef2069655994fac8a7681a7c43c62d08ede4"
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
