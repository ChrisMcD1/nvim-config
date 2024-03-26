local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
    return args[1]
end

ls.config.set_config {
    updateevents = "TextChanged,TextChangedI"
}

ls.add_snippets("scala", {
    s("sealt", {
        t("sealed trait "),
        i(1),
        t(" extends Product with Serializable"),
        t({ "", "object " }),
        f(copy, 1),
        t({ " {" }),
        t({ "", "\t" }),
        t({ "case object " }),
        i(2, "ObjectName"),
        t(" extends "),
        f(copy, 1),
        t({ "", "\t" }),
        t({ "case class " }),
        i(3, "ClassName"),
        t("("),
        i(4, "properties"),
        t(") extends "),
        f(copy, 1),
        i(0),
        t({ "", "}" })
    }),
})
