class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    version "0.3.1"
    url "https://github.com/okteto/cnd/releases/download/#{version}/cnd-darwin-amd64"
    sha256 "70bdde6ffca613bc60aa2ebac29ca3c5eb8c07c4a0cf63c829c2c31a62196ed5"
    
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
