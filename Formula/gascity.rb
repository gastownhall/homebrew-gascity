# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.5/gascity_1.3.5_darwin_arm64.tar.gz"
      sha256 "9468e28659c36a0c55d33e3426f932db5793fbb1abe7c922277295c457c45e44"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.5/gascity_1.3.5_darwin_amd64.tar.gz"
      sha256 "1349cd072f0ef4620dc46cfb1a163ae75fc2f50b2ae597261e8aba47fc3652dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.5/gascity_1.3.5_linux_arm64.tar.gz"
      sha256 "6f3d504a8f3e2f9d21e939d3e168e387c02bad91df526854e3ea4f2fed94df61"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.5/gascity_1.3.5_linux_amd64.tar.gz"
      sha256 "854fba2fd6c8cfa9d3f33b5262f95032d8036b08e8cdfe925bf4bc86e83b10a1"
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
