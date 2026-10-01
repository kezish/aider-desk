{
  description = "AiderDesk development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs_22
          git
          python3
          pkg-config
          gcc
          gnumake

          gtk3
          glib
          nss
          nspr
          atk
          at-spi2-atk
          cups
          dbus
          libdrm
          mesa
          libxkbcommon

          libx11
          libxcomposite
          libxdamage
          libxext
          libxfixes
          libxrandr

          alsa-lib
          pango
          cairo
          libGL
        ];

        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
          gtk3
          glib
          nss
          nspr
          atk
          at-spi2-atk
          cups
          dbus
          libdrm
          mesa
          libxkbcommon

          libx11
          libxcomposite
          libxdamage
          libxext
          libxfixes
          libxrandr

          alsa-lib
          pango
          cairo
          libGL
        ]);

        shellHook = ''
          echo "AiderDesk development shell"
          echo "Node: $(node --version)"
          echo "npm:  $(npm --version)"
        '';
      };
    };
}
