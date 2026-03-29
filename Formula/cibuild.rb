class Cibuild < Formula
  desc "CI Build — local pipeline orchestration for Android/iOS"
  homepage "https://github.com/invarnhq/cibuild"
  version "1.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-arm64.tar.gz"
      sha256 "2cbc7070ca288704a24dd3b27bd9ad993780274b2b58ac3989e5473de926d574"
    else
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-x64.tar.gz"
      sha256 "11f69e156772d2c9603d6f82df7a787650f6a04dc4bcc1b1ab839daa80c90a14"
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
