class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    url "https://github.com/okteto/cnd/archive/0.1.0.tar.gz"
    sha256 "edb31ebac68d15541d15bc8fa0b1307b5f3e5c5cfd2a54f1c69ca45f1d880339"
    head "https://github.com/okteto/cnd.git"

    depends_on "go" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/okteto/cnd"
        bin_path.install Dir["*"]
        cd bin_path do
            system "go", "build", "-ldflags", "-X github.com/okteto/cnd/cmd.VersionString=0.1.0", "-o", bin/"cnd", "."
        end
    end

    # Homebrew requires tests.
    test do
        assert_match "cnd version 0.1.0", shell_output("#{bin}/cnd version 2>&1", 0)
    end
end