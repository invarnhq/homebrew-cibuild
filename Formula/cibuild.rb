class Cibuild < Formula
  desc "CI Build — local pipeline orchestration for Android/iOS"
  homepage "https://github.com/invarnhq/cibuild"
  version "1.0.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-arm64.tar.gz"
      sha256 "374e75dc16ff4e4db8bc9dbd685284c92b568749b524d79ec5e5ac5ead047d91"
    else
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-x64.tar.gz"
      sha256 "e84cb895057bde050eaeacac091ceef3f3766ec11ace249b07eff9433ceb5697"
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
