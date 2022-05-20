local ls = require('luasnip')
local s = ls.s
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = require('luasnip.extras').rep
local types = require('luasnip.util.types')

local snippets = {
  ls.parser.parse_snippet("saluto", "Ciao $1, sono $0, come va? spero tutto bene."),
  ls.parser.parse_snippet("email", "$1,\n\n$2\n\nCordiali saluti,\n\nNicolò Traini"),
}

local autosnippets = {}

return snippets, autosnippets
