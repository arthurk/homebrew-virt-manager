class OsinfoDb < Formula
  desc "Libosinfo database files"
  homepage "https://libosinfo.org/"
  url "https://releases.pagure.org/libosinfo/osinfo-db-tools-1.10.0.tar.xz"
  sha256 "802cdd53b416706ea5844f046ddcfb658c1b4906b9f940c79ac7abc50981ca68"

  depends_on "osinfo-db-tools" => :build

  def install
    system "osinfo-db-import", "--local", cached_download

    # Copy the archive into the prefix to avoid empty installation error
    cp_r "./", prefix
  end

  test do
    system "osinfo-db-validate", "--local"
  end
end
