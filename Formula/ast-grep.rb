class AstGrep < Formula
  desc "A tool to search and rewrite code at large scale using precise AST pattern"
  homepage "https://ast-grep.github.io/"
  url "https://github.com/ast-grep/ast-grep/archive/refs/tags/0.3.1.tar.gz"
  sha256 "6b916d20a20bfb64dc70799c3fa83e23e4b5df9178a3d5618da7c72c5dca5acd"
  license "MIT"
  head "https://github.com/ast-grep/ast-grep.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cli")
  end

  test do
    (testpath/"Hello.js").write("console.log('123')")
    system "#{bin}/sg", "-p console.log", testpath
  end

end
