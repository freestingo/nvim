local ls = require('luasnip')
local s = ls.s
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = require('luasnip.extras').rep
local types = require('luasnip.util.types')

local snippets = {
  s("req", fmt("local {} = require('{}')", { i(1), rep(1) })),
}

local autosnippets = {}

return snippets, autosnippets
