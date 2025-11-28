return {
	{
		"folke/snacks.nvim",
		opts = {
			bigfile = {
				enabled = true,
				notify = true,
				size = 1.5 * 1024 * 1024,
				line_length = 1000,
				setup = function(ctx)
					if vim.fn.exists(":NoMatchParen") ~= 0 then
						vim.cmd([[NoMatchParen]])
					end
					Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
					vim.b.minianimate_disable = true
					vim.schedule(function()
						if vim.api.nvim_buf_is_valid(ctx.buf) then
							vim.bo[ctx.buf].syntax = ctx.ft
						end
					end)
				end,
			},
			image = {
				enabled = true,
				formats = {
					"png",
					"jpg",
					"jpeg",
					"gif",
					"bmp",
					"webp",
					"tiff",
					"heic",
					"avif",
					"mp4",
					"mov",
					"avi",
					"mkv",
					"webm",
					"pdf",
				},
				force = false,
				doc = {
					enabled = true,
					inline = true,
					float = true,
					max_width = 80,
					max_height = 40,
					conceal = function(lang, type)
						return type == "math"
					end,
				},
				img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments" },
				wo = {
					wrap = false,
					number = false,
					relativenumber = false,
					cursorcolumn = false,
					signcolumn = "no",
					foldcolumn = "0",
					list = false,
					spell = false,
					statuscolumn = "",
				},
				cache = vim.fn.stdpath("cache") .. "/snacks/image",
				debug = { request = false, convert = false, placement = false },
				env = {},
				icons = { math = "󰪚 ", chart = "󰄧 ", image = " " },
				convert = {
					notify = true,
					mermaid = function()
						local theme = vim.o.background == "light" and "neutral" or "dark"
						return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}" }
					end,
					magick = {
						default = { "{src}[0]", "-scale", "1920x1080>" },
						vector = { "-density", 192, "{src}[0]" },
						math = { "-density", 192, "{src}[0]", "-trim" },
						pdf = { "-density", 192, "{src}[0]", "-background", "white", "-alpha", "remove", "-trim" },
					},
				},
				math = {
					enabled = true,
					typst = {
						tpl = [[
#set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
#set text(size: 12pt, fill: rgb("${color}"))
${header}
${content}]],
					},
					latex = {
						font_size = "Large",
						packages = { "amsmath", "amssymb", "amsfonts", "amscd", "mathtools" },
						tpl = [[
\documentclass[preview,border=0pt,varwidth,12pt]{standalone}
\usepackage{${packages}}
\begin{document}
${header}
{ \${font_size} \selectfont
  \color[HTML]{${color}}
${content}}
\end{document}]],
					},
				},
			},
			scroll = {
				animate = {
					duration = { step = 10, total = 100 },
					easing = "linear",
				},
				-- faster animation when repeating scroll after delay
				animate_repeat = {
					delay = 80, -- delay in ms before using the repeat animation
					duration = { step = 5, total = 50 },
					easing = "linear",
				},
			},

			toggle = {
				map = vim.keymap.set, -- keymap.set function to use
				which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
				notify = true, -- show a notification when toggling
				-- icons for enabled/disabled states
				icon = {
					enabled = " ",
					disabled = " ",
				},
				-- colors for enabled/disabled states
				color = {
					enabled = "green",
					disabled = "yellow",
				},
				wk_desc = {
					enabled = "Disable ",
					disabled = "Enable ",
				},
			},
			notifier = {},
			dashboard = {
				preset = {
					header = [[
				                                                                       
                                                                    
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
				                                                                       
				]],
				},

				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
			zen = {
				show = {
					statusline = true,
					tabline = true,
				},
			},
		},
	},
}
