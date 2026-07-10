# typed: false
# frozen_string_literal: true

class Gascity < Formula
  desc "Orchestration-builder SDK for multi-agent coding workflows"
  homepage "https://github.com/gastownhall/gascity"
  version "1.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.4/gascity_1.3.4_darwin_arm64.tar.gz"
      sha256 "3b9c668c60ad9fa525c6df631d31efead9ee412dc3af2754b4eafe83aff8006a"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.4/gascity_1.3.4_darwin_amd64.tar.gz"
      sha256 "c344bacd0a9d40b66ae7362ca199d976e91841a74519b18ea4fb90b93c246aae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.4/gascity_1.3.4_linux_arm64.tar.gz"
      sha256 "1a8a45d02240ab7ffec970892491a7ec92aadc86be7b598d2ce95a53320eb1af"
    else
      url "https://github.com/gastownhall/gascity/releases/download/v1.3.4/gascity_1.3.4_linux_amd64.tar.gz"
      sha256 "36cf122a434ac1efc42b88b27a9720a97e2178603b6bb2ca25a040c20b25965c"
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
