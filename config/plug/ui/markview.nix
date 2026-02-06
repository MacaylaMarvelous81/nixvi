{ pkgs, ... }:
{
	extraPlugins = with pkgs.vimUtils; [
		(buildVimPlugin {
			pname = "markview.nvim";
			version = "unstable";
			src = pkgs.fetchFromGitHub {
				owner = "OXY2DEV";
				repo = "markview.nvim";
				rev = "main";
				hash = "sha256-aArWqxqbBHDyTaMY6hXwxXoFf8l/j7yOJYKunxO7kis=";
			};
		})
	];

	extraConfigLua = ''
		local presets = require("markview.presets");
		require('markview').setup({
				markdown = {
					 headings = presets.headings.glow,
					 horizontal_rules = presets.horizontal_rules.dashed,
					 tables = presets.single
				}
			});
		'';
}
