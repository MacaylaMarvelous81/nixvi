{ self, ... }:
{
	plugins.snacks = {
		enable = true;
		settings = {
			bufdelete.enabled = true;
			input.enabled = true;
			scroll.enabled = true;
			animate.enabled = true;
			rename.enabled = true;
			statuscolumn.enabled = true;
			words.enabled = true;
			image.enabled = true;
		};
	};

	imports = [
		./dashboard.nix
		./indent.nix
		./lazygit.nix
		./picker.nix
		./terminal.nix
	];

	keymaps = [
		{
			mode = "n"; key = "<leader>bs"; action = ":lua Snacks.scratch()<cr>";
			options = { noremap = true; desc = "Scratch buffer"; };
		}
		{
			mode = "n"; key = "<leader>bs"; action = ":lua Snacks.scratch().select()<cr>";
			options = { noremap = true; desc = "Scratch buffer"; };
		}
		{
			mode = "n"; key = "<leader>qp"; action = ":lua Snacks.picker.projects()<cr>";
			options = { desc = "Open projects"; silent = true; };
		}
	];
}
