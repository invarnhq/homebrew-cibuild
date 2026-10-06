class Cibuild < Formula
  desc "CI Build — local pipeline orchestration for Android/iOS"
  homepage "https://github.com/invarnhq/cibuild"
  version "3.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-arm64.tar.gz"
      sha256 "94b1bf37ccd074523106112150e4756da99f45e658bffeee8eb20563150601d3"
    else
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-x64.tar.gz"
      sha256 "27c95adca4677ddd6c20ccf5121d0df248e9f061732b3b25ffe64e632e5522b0"
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
