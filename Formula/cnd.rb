class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    url "https://github.com/okteto/cnd.git",
      :tag      => "0.4.1",
      :revision => "87033896f6c8ba9bb521a4dc591320de190f05ec"
    head "https://github.com/okteto/cnd.git"

    depends_on "syncthing"
    depends_on "go" => :build

    def install
      ENV["GOPATH"] = buildpath
      ENV["VERSION_STRING"] = "0.4.1"
      contents = Dir["{*,.git,.gitignore}"]
      (buildpath/"src/github.com/okteto/cnd").install contents
      cd "src/github.com/okteto/cnd" do
        system "make"
        bin.install "bin/cnd"
      end
    end

    # Homebrew requires tests.
    test do
        assert_match "cnd version #{version}", shell_output("#{bin}/cnd version 2>&1", 0)
    end
end
