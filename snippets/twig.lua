local ls = require('luasnip')
local s = ls.s
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = require('luasnip.extras').rep
local types = require('luasnip.util.types')

local snippets = {
  ls.parser.parse_snippet("for", "{% for $1 in $2 %}\n  $0\n{% endfor %}"),
  ls.parser.parse_snippet("if", "{% if $1 %}\n  $0\n{% endif %}"),
}

local autosnippets = {}

return snippets, autosnippets
