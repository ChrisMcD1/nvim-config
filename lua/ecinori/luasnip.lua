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

local same = function(index)
    return f(copy, { index })
end

ls.config.set_config {
    updateevents = "TextChanged,TextChangedI"
}

ls.add_snippets("all", {
    -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
    s("sealt", {
        -- Simple static text.
        t("sealed trait "),
        -- function, first parameter is the function, second the Placeholders
        -- whose text it gets as input.
        -- Placeholder/Insert.
        i(1),
        t(" extends Product with Serializable"),
        t({ "", "object " }),
        same(1),
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
        -- -- Placeholder with initial text.
        -- i(2, "we placeholder"),
        -- -- Linebreak
        -- t({ ") {", "\t" }),
        -- -- Last Placeholder, exit Point of the snippet.
        -- i(0),
        -- t({ "", "}" }),
    }),
})
