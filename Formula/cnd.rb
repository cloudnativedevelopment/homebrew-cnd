class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/okteto/cnd"
    url "https://github.com/okteto/cnd.git",
      :tag      => "0.4.4",
      :revision => "3a511be575b17dbd1c3093b23d492d351c4e17d9"
    head "https://github.com/okteto/cnd.git"

    depends_on "syncthing"
    depends_on "go" => :build

    def install
      ENV["GOPATH"] = buildpath
      ENV["VERSION_STRING"] = "0.4.4"
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
