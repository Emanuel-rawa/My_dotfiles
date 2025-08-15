local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node

ls.add_snippets("java", {
  s("class", {
    -- linha do package com base em src/main/java/
    f(function()
      local path = vim.fn.expand("%:p") -- caminho completo do arquivo
      local java_index = path:find("/src/main/java/")
      if not java_index then
        return ""
      end

      local relative = path:sub(java_index + #"/src/main/java/")
      local dir = relative:match("(.*/)")
      if not dir then
        return ""
      end

      local package_path = dir:gsub("/", "."):gsub("^%.", ""):gsub("%.$", "")
      return "package " .. package_path .. ";"
    end, {}),
    t({ "", "", "public class " }),
    f(function()
      return vim.fn.expand("%:t:r") -- nome do arquivo sem extensão
    end, {}),
    t({ " {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),
})

ls.add_snippets("java", {
  s("interface", {
    -- linha do package com base em src/main/java/
    f(function()
      local path = vim.fn.expand("%:p")
      local java_index = path:find("/src/main/java/")
      if not java_index then
        return ""
      end

      local relative = path:sub(java_index + #"/src/main/java/")
      local dir = relative:match("(.*/)")
      if not dir then
        return ""
      end

      local package_path = dir:gsub("/", "."):gsub("^%.", ""):gsub("%.$", "")
      return "package " .. package_path .. ";"
    end, {}),
    t({ "", "", "public interface " }),
    f(function()
      return vim.fn.expand("%:t:r")
    end, {}),
    t({ " {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),
})

ls.add_snippets("java", {
  s("record", {
    -- linha do package com base em src/main/java/
    f(function()
      local path = vim.fn.expand("%:p")
      local java_index = path:find("/src/main/java/")
      if not java_index then
        return ""
      end

      local relative = path:sub(java_index + #"/src/main/java/")
      local dir = relative:match("(.*/)")
      if not dir then
        return ""
      end

      local package_path = dir:gsub("/", "."):gsub("^%.", ""):gsub("%.$", "")
      return "package " .. package_path .. ";"
    end, {}),
    t({ "", "", "public record " }),
    f(function()
      return vim.fn.expand("%:t:r")
    end, {}),
    t({ " {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),
})
