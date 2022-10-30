local ok, illuminate = pcall(require, "illuminate")

if not ok then
	return
end

-- default configuration
illuminate.configure({
	-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
	filetypes_denylist = {
		"dirvish",
		"fugitive",
		"mason",
		"NvimTree",
		"packer",
	},
})
