# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.2.0/gascity_1.2.0_darwin_arm64.tar.gz"
      sha256 "eaf0d1fe664daa4dc9175c6c9bd4ed822182b06b4a6eef43c43a24330daaa898"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.2.0/gascity_1.2.0_darwin_amd64.tar.gz"
      sha256 "5e5acd0c62d03e674c4013a98e05788e76765f60f752f30d4c69431ecc11a896"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.2.0/gascity_1.2.0_linux_arm64.tar.gz"
      sha256 "e9ddb739160a59b6ee2040d872c58de4a986b67d2a87ef7b288b1e6707d97e85"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.2.0/gascity_1.2.0_linux_amd64.tar.gz"
      sha256 "be5f2dba99b0fb0143578f03ed510cf85b1b630fe12b7e846026995d4009d85b"
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
