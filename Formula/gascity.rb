# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.1.0/gascity_1.1.0_darwin_arm64.tar.gz"
      sha256 "768befb275a6aff4a83e9387261c6a2772d8c420f1c2ae6cd8b9d233ad3005ae"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.1.0/gascity_1.1.0_darwin_amd64.tar.gz"
      sha256 "7f44c3d781a1e681e32a87d5e12cbb8f005638f085eb307c67cb760b26444a77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.1.0/gascity_1.1.0_linux_arm64.tar.gz"
      sha256 "6be4259fce11bee757ed1fc17494031d960248b6cb5071aeb2ed5233e172c4dc"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.1.0/gascity_1.1.0_linux_amd64.tar.gz"
      sha256 "b6983ff515d3b7785c00ab1b53948fdae2cc6f6ee88bfc0b60a7c3bca72ab78b"
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
