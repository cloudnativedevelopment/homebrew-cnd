class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    version "0.3.0"
    url "https://github.com/okteto/cnd/releases/download/#{version}/cnd-darwin-amd64"
    sha256 "37386cee7f1236e82abe22c6a60ba3fded157f9d8dbec5646fb7dbcd72557bbc"
    
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
