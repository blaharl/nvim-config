local cmp = require("cmp")
local config = cmp.get_config()
table.insert(config.sources, {
	name = "neorg",
	option = {
		-- ...
	},
})
cmp.setup(config)
