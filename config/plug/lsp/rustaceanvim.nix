{ pkgs, lib, ... }:
{
	plugins.rustaceanvim = {
		enable = true;
		settings = {
			server = {
				cmd = [
					"rustup"
					"run"
					"nightly"
					"rust-analyzer"
				];
				default_settings = {
					rust-analyzer = {
						imports = {
							granularity = {
								group = "module"; # Merge imports: use std::{fs, io};
							};
							prefix = "self"; # standard style
						};
						check = {
							command = "clippy";
						};
						inlayHints = {
							maxLength = 25;
							bindingModeHints.enable = true;
							implicitDrops.enable = true;
							closureStyle = "rust_analyzer";
							closureReturnTypeHints.enable = "always";
							discriminantHints.enable = "always";
							expressionAdjustmentHints.enable = "always";
							lifetimeElisionHints.enable = "always";
							rangeExclusiveHints.enable = true;
						};
					};
				};
				standalone = false;
				on_attach = ''
					function(client, bufnr)
						vim.lsp.inlay_hint.enable(true)
						vim.keymap.set(
							"n",
							"<leader>ca",
							function()
							  vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
							end,
							{ silent = true, buffer = bufnr, desc = "Code Action" }
						  )
						vim.keymap.set(
							"n",
							"K",
							function()
							  vim.cmd.RustLsp({'hover', 'actions'})
							end,
							{ silent = true, buffer = bufnr, desc = "Hover Actions" }
						  )
						vim.keymap.set(
							  "n",
							  "<leader>cc",
							  function ()
								  vim.cmd.RustLsp('runnables')
							  end,
							  { silent = true, buffer = bufnr, desc = "Runnables" }
						  )
						vim.keymap.set(
							  "n",
							  "<leader>ce",
							  function ()
								  vim.cmd.RustLsp('explainError')
							  end,
							  { silent = true, buffer = bufnr, desc = "Explain Error" }
						  )
						vim.keymap.set(
							  "n",
							  "<leader>cd",
							  function ()
								  vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
							  end,
							  { silent = true, buffer = bufnr, desc = "Render Diagnostic" }
						)
					end
				'';
			};
			tools = {
				enable_clippy = true;
				float_win_config = {
					auto_focus = true;
					relative = "cursor";
					border = "rounded";
					max_width = 80;
					zindex = 100;
				};
			};
			dap = {
				adapter = {
					command = lib.getExe' pkgs.lldb "lldb-dap";
					type = "executable";
				};
				autoloadConfigurations = true;
			};
			cargo = {
				buildScripts.enable = true;
				features = "all";
			};
			check = {
				command = "clippy";
				features = "all";
			};
		};
	};
}
