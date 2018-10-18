class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    url "https://github.com/okteto/cnd/releases/download/0.1.0/cnd-darwin-amd64"
    sha256 "e7808ef76afcba28e1a21142be83abf41935f24bf658c6176d6603ae82d27fe6"
    version "0.1.0"

    def install
        bin.install "cnd-darwin-amd64"
        mv bin/"cnd-darwin-amd64", bin/"cnd"
    end

    # Homebrew requires tests.
    test do
        assert_match "cnd version 0.1.0", shell_output("#{bin}/cnd version 2>&1", 0)
    end
end