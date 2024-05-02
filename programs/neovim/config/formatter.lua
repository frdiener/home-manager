local home = os.getenv("HOME")
require("formatter").setup({
	logging = false,
	filetype = {

		lua = {
			function()
				return {
					exe = "stylua",
					args = { "-" },
					stdin = true,
				}
			end,
		},
		java = {
			function()
				return {
					exe = "java",
            		-- Formatter uses '-' as stdin
					args = { "-jar", home .. "/.local/jars/google-java-format.jar", "-a", "-" },
					stdin = true,
				}
			end,
		},
	},
})

-- vim.api.nvim_exec(
-- 	[[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.lua,*.java FormatWrite
-- augroup END
-- ]],
-- 	true
-- )
