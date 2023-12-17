{
  description = "A nix flake to run Minecraft Bedrock on Nix/NixOS";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs"; };

  outputs = { self, nixpkgs }: 
  with import nixpkgs { system = "x86_64-linux"; };
  let 
    app = appimageTools.wrapType2 {
      name = "mcpelauncher";
    src = pkgs.fetchurl {
      url = "https://github.com/minecraft-linux/appimage-builder/releases/download/v0.12.1-763/Minecraft_Bedrock_Launcher-x86_64-v0.12.1.763.AppImage";
      sha256 = "sha256-FHC4+nzldBau0ViRmgdUk2nPIPJi8WI4IxQTtzpO1W4=";
    };
    extraPkgs = pkgs: with pkgs; [ ];
  };
  in
  {
    defaultPackage.x86_64-linux = app;
  };
}
