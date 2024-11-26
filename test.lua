require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "luasnip" },
	},
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if require("luasnip").expand_or_jumpable() then
				require("luasnip").expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})
