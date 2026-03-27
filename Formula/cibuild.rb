class Cibuild < Formula
  desc "CI Build — local pipeline orchestration for Android/iOS"
  homepage "https://github.com/invarnhq/cibuild"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-arm64.tar.gz"
      sha256 "a7b364a5281ce92f2ca1b208b66a987d572230773348698ab9c0de5f4426fc17"
    else
      url "https://github.com/invarnhq/cibuild/releases/download/v#{version}/cibuild-macos-x64.tar.gz"
      sha256 "1e1cddbed6f8942f64d1b785bce4048ba0402a99b9454b3ffaf00c341bc0c265"
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
