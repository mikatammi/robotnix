# SPDX-FileCopyrightText: 2020 Daniel Fullmer and robotnix contributors
# SPDX-License-Identifier: MIT

{ lib, buildGoModule, fetchgit }:

let
  version = "2.6.18"; # 2024-11-27
  rev = "9c318e62acc48563e0ee01bdf00bc32ed922337d";
in
buildGoModule {
  inherit version rev;
  name = "cipd-${version}";

  subPackages = [ "cipd/client/cmd/cipd" ];

  src = fetchgit {
    inherit rev;
    url = "https://chromium.googlesource.com/infra/luci/luci-go";
    hash = "sha256-VIruv1/vZw5gaxz4nDFQTq6Nyxi1/CBNBg0mbS75rz4=";
  };

  vendorHash = "sha256-lLaRFjRgte08Pio2pK3fRy1L+7Sil6RE+RnCKjQjJoU=";

  meta = with lib; {
    description = "Chrome Infrastructure Package Deployment";
    longDescription = ''
      CIPD is package deployment infrastructure. It consists of a package
      registry and a CLI client to create, upload, download, and install
      packages.
    '';
    homepage = "https://chromium.googlesource.com/infra/luci/luci-go/+/refs/heads/master/cipd/";
    license = licenses.asl20;
    maintainers = with maintainers; [ danielfullmer ];
    platforms = with platforms; linux;
  };
}
