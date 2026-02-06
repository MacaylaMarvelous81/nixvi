{ pkgs, ... }:
{
	extraPlugins = [ pkgs.vimPlugins.vscode-diff-nvim ];
	extraConfigLua = ''
		require("codediff").setup({
			keymaps = {
				explorer = {
					hover = "K",
					refresh = "R",
					select = "<CR>",
					toggle_view_mode = "i",
				},
				view = {
					next_file = "]f",
					next_hunk = "]c",
					prev_file = "[f",
					prev_hunk = "[c",
					quit = "q",
					toggle_explorer = "<leader>b",
				},
				conflict = {
					accept_incoming = "<leader>gai",
					accept_current = "<leader>gac",
					accept_both = "<leader>gab",
					discard = "<leader>gax",
					next_conflict = "]x",
					prev_conflict = "[x",
					diffget_incoming = "2do",
					diffget_current = "3do",
				},
			},
		})
	'';
	keymaps = [
		{
			mode = [
				"n"
				"v"
			];
			key = "<leader>ga";
			action = "codediff";
			options = {
				silent = true;
				desc = "+accept";
			};
		}
		{
			mode = "n";
			key = "<leader>gai";
			action = ":lua require('codediff.ui.conflict.actions').accept_incoming()<CR>";
			options = { desc = "Accept Incoming (Left)"; silent = true; };
		}
		{
			mode = "n";
			key = "<leader>gac";
			action = ":lua require('codediff.ui.conflict.actions').accept_current()<CR>";
			options = { desc = "Accept Current (Right)"; silent = true; };
		}
		{
			mode = "n";
			key = "<leader>gab";
			action = ":lua require('codediff.ui.conflict.actions').accept_both()<CR>";
			options = { desc = "Accept Both"; silent = true; };
		}
		{
			mode = "n";
			key = "<leader>gax";
			action = ":lua require('codediff.ui.conflict.actions').discard()<CR>";
			options = { desc = "Discard Both"; silent = true; };
		}

		# --- Navigation ---
		{
			mode = "n";
			key = "]x";
			action = ":lua require('codediff.ui.conflict.navigation').next()<CR>";
			options = { desc = "Next Conflict"; silent = true; };
		}
		{
			mode = "n";
			key = "[x";
			action = ":lua require('codediff.ui.conflict.navigation').prev()<CR>";
			options = { desc = "Previous Conflict"; silent = true; };
		}

		# --- Standard Diff Get (Documented for WhichKey/Mini.Clue) ---
		{
			mode = "n";
			key = "2do";
			action = "2do";
			options = { desc = "DiffGet: Incoming (Buf 2)"; silent = true; };
		}
		{
			mode = "n";
			key = "3do";
			action = "3do";
			options = { desc = "DiffGet: Current (Buf 3)"; silent = true; };
		}
		{
			mode = "n"; key = "<leader>ghd";
			action = ":CodeDiff<CR>"; options = { silent = true; desc = "Diff This"; };
		}
	];
}
