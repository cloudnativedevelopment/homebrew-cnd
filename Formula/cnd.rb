class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    url "https://github.com/okteto/cnd/releases/download/0.2.0/cnd-darwin-amd64"
    sha256 "ad078f0b19c4d5ac48269559c14372c9f8643ccc7604a5502308d839d7259785"
    version "0.2.0"
    depends_on "syncthing"

    def install
        bin.install "cnd-darwin-amd64"
        mv bin/"cnd-darwin-amd64", bin/"cnd"
    end

    # Homebrew requires tests.
    test do
        assert_match "cnd version 0.2.0", shell_output("#{bin}/cnd version 2>&1", 0)
    end
end
