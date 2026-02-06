{
	plugins.persistence = {
		enable = true;
		settings = {
			# Minimum number of file buffers that need to be open to save a session
			need = 1;
			branch = true; # Use separate sessions for different git branches
		};
	};

	keymaps = [
		{
			mode = "n";
			key = "<leader>qs";
			action.__raw = ''function() require("persistence").load() end'';
			options = { desc = "Restore Session"; };
		}
		{
			mode = "n";
			key = "<leader>ql";
			action.__raw = ''function() require("persistence").load({ last = true }) end'';
			options = { desc = "Restore Last Session"; };
		}
		{
			mode = "n";
			key = "<leader>qd";
			action.__raw = ''function() require("persistence").stop() end'';
			options = { desc = "Don't Save Current Session"; };
		}
	];
}
