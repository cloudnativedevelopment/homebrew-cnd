class Cnd < Formula
    desc "CLI for cloud native development"
    homepage "https://github.com/cloudnativedevelopment/cnd"
    url "https://github.com/cloudnativedevelopment/cnd.git",
      :tag      => "0.4.6",
      :revision => "fe93a3ef3a13979a99e46d6a758ba70053ea6352"
    head "https://github.com/cloudnativedevelopment/cnd.git"

    depends_on "go" => :build

    def install
      ENV["GOPATH"] = buildpath
      ENV["VERSION_STRING"] = "0.4.6"
      contents = Dir["{*,.git,.gitignore}"]
      (buildpath/"src/github.com/cloudnativedevelopment/cnd").install contents
      cd "src/github.com/cloudnativedevelopment/cnd" do
        system "make"
        bin.install "bin/cnd"
      end
    end

    # Homebrew requires tests.
    test do
        assert_match "cnd version #{version}", shell_output("#{bin}/cnd version 2>&1", 0)
    end
end
