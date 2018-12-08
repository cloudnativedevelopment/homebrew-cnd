class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    version "0.3.2"
    url "https://github.com/okteto/cnd/releases/download/#{version}/cnd-darwin-amd64"
    sha256 "d054a2f923f6256e4e07103e5f36dc03dd161eb352979115ac409b8e7b70483b"
    
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
