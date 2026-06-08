class Cibuild < Formula
  desc "CI Build — local pipeline orchestration for Android/iOS"
  homepage "https://github.com/invarnhq/cibuild"
  version "1.9.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-arm64.tar.gz"
      sha256 "62bbaee4cf4f994bda760567ea18a1f2f83d93e9e5a657fdf8186290664fde5c"
    else
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-x64.tar.gz"
      sha256 "bac7ba0a30c9dbe5bcb93e701dbe28bf30992b581f0384be3c275aa628c30176"
    end
  end

  def install
    bin.install "cibuild-macos-arm64" => "cibuild" if Hardware::CPU.arm?
    bin.install "cibuild-macos-x64" => "cibuild" unless Hardware::CPU.arm?
    bin.install_symlink "cibuild" => "ci"
  end

  test do
    system "#{bin}/cibuild", "--help"
  end
end
