class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    version "0.3.3"
    url "https://github.com/okteto/cnd/releases/download/#{version}/cnd-darwin-amd64"
    sha256 "c1c5d9f5ffa462c994d6f01e4bdae926fc524d6d5b21f8487c788eafd649bb24"
    
    depends_on "syncthing"

    def install
        bin.install "cnd-darwin-amd64"
        mv bin/"cnd-darwin-amd64", bin/"cnd"
    end

    # Homebrew requires tests.
    test do
        assert_match "cnd version #{version}", shell_output("#{bin}/cnd version 2>&1", 0)
    end
end
