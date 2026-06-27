class Gfy < Formula
  desc "Terminal UI client for gfy.com (the GFY Webmaster Board vBulletin forum)"
  homepage "https://github.com/drfarang/gfy"
  url "https://github.com/drfarang/gfy/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d30ac90ee4403384869b5bf8887aa9fc842e7485d470ebdd20154cf8eb7778c8"
  license "MIT"

  depends_on "bun"

  def install
    # Fetch runtime dependencies (platform-native sharp/opentui resolve here,
    # which is why this works where a single compiled binary cannot).
    system "bun", "install", "--production"

    # Ship the app (with its node_modules) into libexec, then expose a launcher.
    libexec.install Dir["*"]
    (bin/"gfy").write <<~EOS
      #!/bin/bash
      exec "#{formula_opt_bin("bun")}/bun" "#{libexec}/src/index.tsx" "$@"
    EOS
    chmod 0755, bin/"gfy"
  end

  test do
    assert_path_exists libexec/"src/index.tsx"
  end
end
