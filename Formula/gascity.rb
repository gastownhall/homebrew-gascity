# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  url "https://github.com/gastownhall/gascity/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3c9be7b651b777475ec233aba8f6dcebf62a85da641726898c82ab41c0a30f57"
  license "MIT"
  head "https://github.com/gastownhall/gascity.git", branch: "main"

  depends_on "go" => :build
  depends_on "beads"
  depends_on "jq"
  depends_on "tmux"

  # flock: ships with util-linux on Linux, needs brew on macOS.
  on_macos do
    depends_on "flock"
  end

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:, output: bin/"gc"), "./cmd/gc"

    generate_completions_from_executable(bin/"gc", shell_parameter_format: :cobra)
  end

  def caveats
    <<~EOS
      Gas City depends on these runtime tools, installed as dependencies:
        beads (bd)  — issue tracker
        dolt        — beads storage (via beads)
        flock       — file locking
        jq          — JSON processing
        tmux        — session management

      Get started:
        gc init <city-path>      # create a new city
        gc start <city-path>     # start an existing city
    EOS
  end

  test do
    # Binary is installed and reports the tagged version.
    assert_match version.to_s, shell_output("#{bin}/gc version")

    # Cobra completion generation works (verifies the command tree is wired
    # correctly).
    assert_match "bash completion", shell_output("#{bin}/gc completion bash")
    assert_match "#compdef gc", shell_output("#{bin}/gc completion zsh")
  end
end
