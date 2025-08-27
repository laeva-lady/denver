---@diagnostic disable: undefined-global

return {
    s({ trig = "mt", snippetType = "autosnippet" },
        fmta("$<>$", { i(1) })
    ),
    s({ trig = "=-", snippetType = "autosnippet" },
        fmta("plus.minus<>", { i(1) })
    ),
    -- s({ trig = "([^%s]+);deg", snippetType = "autosnippet", regTrig = true },
    --     fmta("<>° <>", {
    --         f(function(_, s) return s.captures[1] end),
    --         i(1)
    --     })
    -- ),
    s({ trig = "(%(.*%));d", snippetType = "autosnippet", regTrig = true },
        fmta("<>/(<>)", {
            f(function(_, s) return s.captures[1] end),
            i(1)
        })
    ),
    s({ trig = "([^%s]+);f", snippetType = "autosnippet", regTrig = true },
        fmta("<>_(<>)", {
            f(function(_, s) return s.captures[1] end),
            i(1)
        })
    ),
    s({ trig = "([^%s]+);t", snippetType = "autosnippet", regTrig = true },
        fmta("<>^(<>)", {
            f(function(_, s) return s.captures[1] end),
            i(1)
        })
    ),
    s({ trig = "mmt", snippetType = "autosnippet" },
        fmta([[$
  <>
$ ]], { i(1) })
    ),
}
