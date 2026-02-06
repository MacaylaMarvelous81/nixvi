{
	description = "neovim configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixvim.url = "github:nix-community/nixvim";
		nixvim.inputs.nixpkgs.follows = "nixpkgs";
		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
	};

	outputs = { nixpkgs, nixvim, neovim-nightly-overlay, ... }:
		let
		system = "x86_64-linux";
	pkgs = import nixpkgs {
		inherit system;
		overlays = [
			neovim-nightly-overlay.overlays.default
			(import ./overlays/codediff/overlay.nix)
		];
	};
	nixvim' = nixvim.legacyPackages.${system};
	nvim = nixvim'.makeNixvimWithModule {
		inherit pkgs;
		module = ./config;
	};
	in {
		packages.${system}.default = nvim;
	};
}
