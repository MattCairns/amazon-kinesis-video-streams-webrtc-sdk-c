{
  description = "Devshell for Hydromanteia";

  inputs = {
    oorpkgs.url = "git+ssh://gitlab.com/open-ocean-robotics/xplorer-vessel/libs/oorpkgs.git";
    pklcli.url = "github:MattCairns/pkl-flake";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    pklcli,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        formatter = pkgs.alejandra;
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
    elfutils
    gst_all_1.gst-devtools
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-ugly
    gst_all_1.gstreamer
    libunwind
    libwebsockets
    om4
    openssl
    pcre2
    srtp
    usrsctp
    zstd
    cmake
    pkg-config

              (inputs.oorpkgs.legacyPackages.${system}.amazon-kinesis-video-streams-webrtc-sdk-c)
            ];
          };
      }
    );
}
