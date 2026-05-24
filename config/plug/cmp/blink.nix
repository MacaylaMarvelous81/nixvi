{pkgs, ...} :
{
	extraPlugins = with pkgs.vimPlugins; [
		blink-ripgrep-nvim
	];

	plugins = {
		blink-cmp-dictionary.enable = true;
		blink-cmp-git.enable = true;
		blink-emoji.enable = true;
		blink-ripgrep.enable = true;
		blink-cmp = {
			enable = true;
			setupLspCapabilities = true;
			settings = {
				keymap = {
					preset = "none";
					"<C-space>" = [ "show" "show_documentation" "hide_documentation" ];
					"<C-e>" = [ "hide" "fallback" ];
					"<CR>" = [ "accept" "fallback" ];
					"<Tab>" = [ "accept" "snippet_forward" "fallback" ];
					"<S-Tab>" = [ "snippet_backward" "fallback" ];
					"<C-b>" = [ "scroll_documentation_up" "fallback" ];
					"<C-f>" = [ "scroll_documentation_down" "fallback" ];
					"<C-k>" = [ "show_signature" "hide_signature" "fallback" ];
					"<Up>" = [ "select_prev" "fallback" ];
					"<Down>" = [ "select_next" "fallback" ];
				};
				signature = {
					enabled = true;
				};

				sources = {
					default = [
						"lsp" "buffer" "path" "snippets"
						# Community
						"dictionary" "emoji" "git" "ripgrep"
					];
					providers = {
						lsp = {
							name = "lsp";
							enabled = true;
							module = "blink.cmp.sources.lsp";
							score_offset = 10000;
						};
						ripgrep = {
							name = "Ripgrep";
							enabled = true;
							module = "blink-ripgrep";
							score_offset = 2000;
						};
						path = {
							name = "Path";
							enabled = true;
							module = "blink.cmp.sources.path";
							score_offset = 1500;
						};
						snippets = {
							name = "Snippets";
							module = "blink.cmp.sources.snippets";
							score_offset = 1000;
						};
						dictionary = {
							name = "Dict";
							enabled = true;
							module = "blink-cmp-dictionary";
							min_keyword_length = 20;
						};
						git = {
							module = "blink-cmp-git";
							enabled = true;
							name = "git";
							score_offset = 10;
							opts = {
								commit = { };
								git_centers = {
									git_hub = { };
									git_lab = { };
								};
							};
						};
						emoji = {
							name = "Emoji";
							enabled = true;
							module = "blink-emoji";
							score_offset = 1;
						};
					};
				};

				appearance = {
					nerd_font_variant = "mono";
					kind_icons = {
						Text = "󰉿";
						Method = "";
						Function = "󰊕";
						Constructor = "󰒓";

						Field = "󰜢";
						Variable = "󰆦";
						Property = "󰖷";

						Class = "󱡠";
						Interface = "󱡠";
						Struct = "󱡠";
						Module = "󰅩";

						Unit = "󰪚";
						Value = "󰦨";
						Enum = "󰦨";
						EnumMember = "󰦨";

						Keyword = "󰻾";
						Constant = "󰏿";

						Snippet = "󱄽";
						Color = "󰏘";
						File = "󰈔";
						Reference = "󰬲";
						Folder = "󰉋";
						Event = "󱐋";
						Operator = "󰪚";
						TypeParameter = "󰬛";
						Error = "󰏭";
						Warning = "󰏯";
						Information = "󰏮";
						Hint = "󰏭";

						Emoji = "!";
					};
				};
				completion = {
					ghost_text.enabled = true;
					list.selection = {
						preselect = true; 
						auto_insert = false;
					};
					menu = {
						border = "none";
						draw = {
							gap = 1;
							treesitter = [ "lsp" ];
							columns = [
								{
									__unkeyed-1 = "label";
								}
								{
									__unkeyed-1 = "kind_icon";
									__unkeyed-2 = "kind";
									gap = 1;
								}
								{ __unkeyed-1 = "source_name"; }
							];
						};
					};
					trigger = {
						show_in_snippet = false;
					};
					documentation = {
						auto_show = true;
						window = {
							border = "rounded";
						};
						auto_show_delay_ms = 50;
					};
					accept = {
						auto_brackets = {
							enabled = true;
						};
					};
				};
			};
		};
	};
}
