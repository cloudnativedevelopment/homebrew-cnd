class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    url "https://github.com/okteto/cnd/releases/download/0.1.1/cnd-darwin-amd64"
    sha256 "f3a8f3e705e734633c2c0c06bd09fc1628503d384868525313cec933460146bd"
    version "0.1.1"
    depends_on "syncthing"

    def install
        bin.install "cnd-darwin-amd64"
        mv bin/"cnd-darwin-amd64", bin/"cnd"
    end

    # Homebrew requires tests.
    test do
        assert_match "cnd version 0.1.1", shell_output("#{bin}/cnd version 2>&1", 0)
    end
end
