class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    version "0.1.0"
    url "https://github.com/okteto/cnd/archive/#{version}.tar.gz"
    sha256 "edb31ebac68d15541d15bc8fa0b1307b5f3e5c5cfd2a54f1c69ca45f1d880339"
    head "https://github.com/okteto/cnd.git"

    depends_on "go" => :build

    def install
        ENV["GOPATH"] = buildpath

        bin_path = buildpath/"src/github.com/okteto/cnd"
        bin_path.install Dir["*"]
        cd bin_path do
            system "go", "build", "-ldflags", "-X github.com/okteto/cnd/cmd.VersionString=#{version}", "-o", bin/"cnd", "."
        end
    end

    # Homebrew requires tests.
    test do
        assert_match "cnd version #{version}", shell_output("#{bin}/cnd version 2>&1", 0)
    end
end