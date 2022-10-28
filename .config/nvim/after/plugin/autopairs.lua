local ok, autopairs = pcall(require, "nvim-autopairs")

if not ok then return end

autopairs.setup({
  check_ts = true,
  enable_check_bracket_line = false,
  ignored_next_char = "[%w%.]",
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey='Comment'
  },
})
