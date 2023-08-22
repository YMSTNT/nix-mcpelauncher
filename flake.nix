{
  description = "A nix flake to run Minecraft Bedrock on Nix/NixOS";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs"; };

  outputs = { self, nixpkgs }: 
  with import nixpkgs { system = "x86_64-linux"; };
  let 
    app = appimageTools.wrapType2 {
      name = "mcpelauncher";
    src = pkgs.fetchurl {
      url = "https://github.com/minecraft-linux/appimage-builder/releases/download/v0.11.2-718/Minecraft_Bedrock_Launcher-x86_64-v0.11.2.718.AppImage";
      sha256 = "049cl0x1xz1g33hls4qncpspvgdapfx3m5jd9dvzs0kcyipvamjs";
    };
    extraPkgs = pkgs: with pkgs; [ ];
  };
  in
  {
    defaultPackage.x86_64-linux = app;
  };
}
