local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
ls.add_snippets("rust", {
  s("hi", {
    t("hello, world"),
  }),
  s(
    { trig = "ktv(%w)(%w)", regTrig = true },
    f(function(args, snip)
      local first_char = snip.captures[1]  -- 捕获第一个字符（数字或字母）
      local second_char = snip.captures[2] -- 捕获第二个字符（数字或字母）
      return '"' .. first_char .. '" => Some(0x' .. second_char .. ')'
    end, {})
  )
})
