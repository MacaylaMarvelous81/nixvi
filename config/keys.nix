{
	globals.mapleader = " ";
	keymaps = [
		# General
		{
			mode = "n"; key = "gx"; action = ":lua OpenUnderCursor()<cr>";
			options = { desc = "Open URL under cursor"; noremap = true; silent = true; };
		}
		{
			mode = "n"; key = "<leader>cs"; action = ":ClangdSwitchSourceHeader<cr>";
			options = { noremap = true; desc = "Switch source/header"; };
		}
		{
			mode = "n"; key = "<leader>ct"; action = ":lua vim.cmd('tag ' .. vim.fn.expand('<cword>'))<cr>";
			options = { noremap = true; desc = "Search tag"; };
		}
		{
			mode = "n"; key = "<leader>cl"; action = ":lua CopyCursorLocation()<cr>";
			options = { silent = true; desc = "Copy permalink"; };
		}
		{
			mode = [ "n" "v" ]; key = "<leader>cv"; action = ":lua ShowConversions()<cr>";
			options = { silent = true; desc = "Show Conversions"; };
		}
		{
			mode = [ "n" "v" ]; key = "<leader>ch"; action = ":lua ToggleHex()<cr>";
			options = { silent = true; desc = "Toggle hex view"; };
		}
		{
			mode = "n"; key = "<leader>ul"; action = ":lua ToggleLineNumber()<cr>";
			options = { silent = true; desc = "Toggle Line Numbers"; };
		}
		{
			mode = "n"; key = "<leader>uL"; action = ":lua ToggleRelativeLineNumber()<cr>";
			options = { silent = true; desc = "Toggle Relative Line Numbers"; };
		}
		{
			mode = "n"; key = "<leader>uw"; action = ":lua ToggleWrap()<cr>";
			options = { silent = true; desc = "Toggle Line Wrap"; };
		}
		{
			mode = "n"; key = "<leader>uv";
			action.__raw = ''
				  function()
					  local config = vim.diagnostic.config()
					  -- If virtual text is currently enabled (it will be a table or true)
					  if config.virtual_text then
						  -- Cache the current custom config (so we don't lose the icons/prefix)
						  _G.diagnostic_vt_cache = config.virtual_text
						  vim.diagnostic.config({ virtual_text = false })
						  vim.notify("Virtual Text: OFF", vim.log.levels.INFO)
					  else
						  -- Restore the cached config, or default to true if nothing cached
						  vim.diagnostic.config({ virtual_text = _G.diagnostic_vt_cache or true })
						  vim.notify("Virtual Text: ON", vim.log.levels.INFO)
					  end
				  end
			'';
			options = { desc = "Toggle Virtual Text (Diagnostics)"; silent = true; };
		}

		{
			mode = "n"; key = "<leader>ci"; action = ":lua toggleInlayHints()<cr>";
			options = { silent = true; desc = "Toggle inlay hints"; };
		}
		{
			mode ="n"; key = "<leader>cz"; action = ":let &foldcolumn = (&foldcolumn == 0 ? 8 : 0)<CR>";
			options = { silent = true; desc = "Toggle zen-mode"; };
		}
		{
			mode = "v"; key = "J"; action = ":m '>+1<cr>gv=gv";
			options = { desc = "Use move command when line is highlighted "; };
		}
		{
			mode = "v"; key = "K"; action = ":m '>-2<cr>gv=gv";
			options = { desc = "Use move command when line is highlighted "; };
		}
		{
			mode = "n"; key = "J"; action = "mzJ`z";
			options = { desc = "Allow cursor to stay in the same place after appending to current line "; };
		}
		{
			mode = "n"; key = "<C-d>"; action = "<C-d>zz";
			options = { desc = "Allow C-d and C-u to keep the cursor in the middle"; };
		}
		{
			mode = "n"; key = "<C-u>"; action = "<C-u>zz";
			options = { desc = "Allow C-d and C-u to keep the cursor in the middle"; };
		}
		{
			mode = "n"; key = "n"; action = "nzzzv";
			options = { desc = "Allow search terms to stay in the middle "; };
		}
		{
			mode = "n"; key = "N"; action = "Nzzzv";
			options = { desc = "Allow search terms to stay in the middle "; };
		}
		{
			mode = "t"; key = "<Esc>"; action = "<C-\\><C-n>";
			options = { noremap = true; silent = true; };
		}
		{
			mode = "n"; key = "<leader>R"; action = ":%s/\<C-r><C-w>//g<Left><Left>";
			options = { desc = "Search and replace word under cursor"; };
		}
		# Paste stuff without saving the deleted word into the buffer
		{
			mode = "x"; key = "<leader>p"; action = ''"_dP'';
			options = { desc = "Deletes to void register and paste over"; };
		}
		# Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
		{
			mode = [ "n" "v" ]; key = "<leader>y"; action = ''"+y'';
			options = { desc = "Copy to system clipboard"; };
		}
		{
			mode = [ "n" "v" ]; key = "<leader>Y"; action = ''"+Y'';
			options = { desc = "Copy to system clipboard"; };
		}
		# Delete to void register
		{
			mode = [ "n" "v" ]; key = "<leader>D"; action = ''"_d'';
			options = { desc = "Delete to void register"; };
		}
		# Yank all matches to system clipboard
		{
			mode = "n"; key = "<leader>fy";
			action = ":let @+ = '''' | g//y A | call setreg('+', @a)<CR>";
			options = { desc = "Yank all matches to +"; };
		}
		# <C-c> instead of pressing esc just because
		{
			mode = "i"; key = "<C-c>"; action = "<Esc>";
		}

		# Tabs
		{
			mode = "n"; key = "<leader><tab>m";
			action = ":tabnew %<cr>";
			options = { silent = true; desc = "Maximize pane"; };
		}
		{
			mode = "n"; key = "<leader><tab><tab>"; action = "<cmd>tabnew<cr>";
			options = { silent = true; desc = "New Tab"; };
		}
		{
			mode = "n"; key = "<leader><tab>d"; action = "<cmd>tabclose<cr>";
			options = { silent = true; desc = "Close tab"; };
		}

		# Windows
		{
			mode = "n"; key = "<leader>ww"; action = "<C-W>p";
			options = { silent = true; desc = "Other window"; };
		}
		{
			mode = "n"; key = "<leader>wd"; action = "<C-W>c";
			options = { silent = true; desc = "Delete window"; };
		}
		{
			mode = "n"; key = "<leader>w-"; action = "<C-W>s";
			options = { silent = true; desc = "Split window below"; };
		}
		{
			mode = "n"; key = "<leader>w|"; action = "<C-W>v";
			options = { silent = true; desc = "Split window right"; };
		}
		{
			mode = "n"; key = "<C-h>"; action = "<C-W>h";
			options = { silent = true; desc = "Move to window left"; };
		}
		{
			mode = "n"; key = "<C-l>"; action = "<C-W>l";
			options = { silent = true; desc = "Move to window right"; };
		}
		{
			mode = "n"; key = "<C-k>"; action = "<C-W>k";
			options = { silent = true; desc = "Move to window over"; };
		}
		{
			mode = "n"; key = "<C-j>"; action = "<C-W>j";
			options = { silent = true; desc = "Move to window bellow"; };
		}
		{
			mode = "n"; key = "<C-s>"; action = "<cmd>w<cr><esc>";
			options = { silent = true; desc = "Save file"; };
		}

		# Quit/Session
		{
			mode = "n"; key = "<leader>qq"; action = "<cmd>quitall<cr><esc>";
			options = { silent = true; desc = "Quit all"; };
		}
	];

	extraConfigLua = ''
	function toggleInlayHints()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
		vim.notify("Inlay hints: " .. (vim.lsp.inlay_hint.is_enabled({}) and "on" or "off"))
	end

	function ToggleLineNumber()
		if vim.wo.number then
			vim.wo.number = false
		else
			vim.wo.number = true
			vim.wo.relativenumber = false
		end
	end

	function ToggleRelativeLineNumber()
		if vim.wo.relativenumber then
			vim.wo.relativenumber = false
		else
			vim.wo.relativenumber = true
			vim.wo.number = false
		end
	end

	function ToggleWrap()
		vim.wo.wrap = not vim.wo.wrap
	end

	function CopyCursorLocation()
		local full_path = vim.fn.expand("%:p")
		local line = vim.fn.line(".")

		local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
		if git_root == nil or git_root == "" then
			print("Not in a git repo.")
			return
		end

		local rel_path = full_path:gsub("^" .. git_root .. "/", "")
		local location = rel_path .. " +" .. line

		vim.fn.setreg("+", location)
		print("Copied: " .. location)
	end

	function searchTag()
		vim.cmd("tag " .. vim.fn.expand("<cword>"))
	end

	local function get_selected_text()
		local mode = vim.api.nvim_get_mode().mode
		local text = ""
		if mode:match("[vV]") then
			local _, ls, cs = unpack(vim.fn.getpos("'<"))
			local _, le, ce = unpack(vim.fn.getpos("'>"))
			local lines = vim.fn.getline(ls, le)
			if #lines == 0 then
				return
			end
			lines[1] = string.sub(lines[1], cs)
			lines[#lines] = string.sub(lines[#lines], 1, ce)
			local text = table.concat(lines, "\n")
		else
			text = vim.fn.expand('<cword>')
		end
		return text ~= "" and text or nil
	end

	function ShowConversions()
		local text = get_selected_text()
		if not text then
			vim.notify("No text selected", vim.log.levels.WARN)
			return
		end

		local lines = {
			"Conversions for: "..text,
			""
		}

		local num = tonumber(text)
		if num then
			local function to_binary(n)
				if n == 0 then return "0" end
				local bits = {}
				while n > 0 do
					table.insert(bits, 1, n % 2)
					n = math.floor(n / 2)
				end
				return table.concat(bits)
			end
			table.insert(lines, string.format("Hex:    %-15s", "0x"..string.format("%X", num)))
			table.insert(lines, string.format("Bin:    %-15s", "0b"..to_binary(num)))
			table.insert(lines, string.format("Dec:    %-15s", tostring(num)))
			table.insert(lines, string.format("Oct:    %-15s", "0"..string.format("%o", num)))
			table.insert(lines, string.format("ASCII:  %-15s", num >= 0 and num <= 127 and string.char(num) or "N/A"))
		end

		table.insert(lines, "b64enc: "..(vim.base64.encode(text:gsub("%z", "")) or "N/A"))
		table.insert(lines, "b64dec: "..(function()
			local t = text:gsub("%z", ""):gsub("=+$", "")
			local pad = (4 - (#t % 4)) % 4
			t = t .. ('='):rep(pad)
			local ok, decoded = pcall(vim.base64.decode, t)
			return ok and decoded:gsub("%z", "") or "N/A"
		end)())
		table.insert(lines, "")

		local bufnr, winid = vim.lsp.util.open_floating_preview(lines, "markdown", {
			border = "rounded",
			focusable = true,
			close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
			relative = "cursor",
			row = 1,
			col = 0,
		})

		vim.keymap.set('n', 'y', function()
			local line = vim.api.nvim_get_current_line()
			local value = line:match(":%s*(.+)%s*$")
			if value then
				vim.fn.setreg('+', value)
				vim.notify("Copied: "..value, vim.log.levels.INFO)
				vim.api.nvim_win_close(winid, true)
			end
		end, {buffer = bufnr})

		vim.keymap.set('n', 'p', function()
			local line = vim.api.nvim_get_current_line()
			local value = line:match(":%s*(.+)%s*$")
			if value then
				vim.api.nvim_paste(value, true, -1)
				vim.api.nvim_win_close(winid, true)
			end
		end, {buffer = bufnr})
	end

	function OpenUnderCursor()
		local url = vim.fn.expand("<cfile>")
		if url == "" then
			vim.notify("No URL/file found under cursor", vim.log.levels.WARN)
			return
		end

		local opener = "xdg-open"

		vim.notify("Opened URL in browser", vim.log.levels.INFO)
		vim.system({opener, url}, { detach = true })
	end

	function ToggleHex()
		-- Save state (modified, readonly, modifiable)
		local modified = vim.bo.modified
		local old_readonly = vim.bo.readonly
		local old_modifiable = vim.bo.modifiable
		-- Prepare buffer for operations
		vim.bo.readonly = false
		vim.bo.modifiable = true

		if not vim.b.editHex then
		-- === ENTER HEX MODE ===
		-- Save old options to buffer variables
		vim.b.old_ft = vim.bo.filetype
		vim.b.old_bin = vim.bo.binary
		-- Set binary to ensure no newline conversion happens
		vim.opt_local.binary = true
		-- Reload the file to read raw bytes from disk (prevents EOL corruption)
		-- We wrap this in pcall to catch "No write since last change" errors
		local status, _ = pcall(vim.cmd, "silent e")
		if not status then
			print("❌ Error: Save changes before toggling Hex Mode!")
			-- Restore settings on failure
			vim.bo.readonly = old_readonly
			vim.bo.modifiable = old_modifiable
			if not vim.b.old_bin then vim.opt_local.binary = false end
			return
			end
			-- Configure buffer for Hex editing
			vim.bo.filetype = "xxd"
			vim.b.editHex = true
			-- Filter the buffer through xxd
			vim.cmd("%!xxd")
		else
			-- === EXIT HEX MODE ===
			-- Restore filetype
			if vim.b.old_ft then 
			vim.bo.filetype = vim.b.old_ft 
			end
			-- Restore binary setting
			if not vim.b.old_bin then
			vim.opt_local.binary = false
			end
			vim.b.editHex = false
			-- Filter the buffer back through xxd reverse
			vim.cmd("%!xxd -r")
			end
			-- Restore state
			vim.bo.modified = modified
			vim.bo.readonly = old_readonly
			vim.bo.modifiable = old_modifiable
			end
	'';
}
