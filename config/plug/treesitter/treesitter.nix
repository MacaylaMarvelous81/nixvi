{ pkgs, ... }:
{
	plugins.treesitter = {
		enable = true;
		folding.enable = true;
		settings = {
			indent = {
				enable = true;
			};
			highlight = {
				enable = true;
			};
			ensureInstalled = [
				"c"
				"rust"
				"make"
				"bash"
				"diff"
				"kconfig"
				"cpp"
				"cmake"
				"lua"
				"nix"
				"markdown"
				"markdown_inline"
				"doxygen"
				"regex"
			];
		};

		grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
			c
			rust
			make
			bash
			diff
			kconfig
			cpp
			cmake
			lua
			nix
			markdown
			markdown_inline
			doxygen
			regex
		];
	};

}
