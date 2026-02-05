-- Map callout types to LaTeX environments
local callout_env_map = {
    idea = "ideabox",
    proposed = "proposedbox",
    established = "establishedbox",
    speculative = "speculativebox",
    caution = "cautionbox",
    warning = "warningbox",
    danger = "dangerbox"
  }
  

function BlockQuote(el)
  if #el.content > 0 and el.content[1].t == "Para" then
    local firstPara = el.content[1]
    if #firstPara.content > 0 and firstPara.content[1].t == "Str" then
      local firstWord = firstPara.content[1].text
      local calloutType = firstWord:match("^%[%!(%w+)%]$")
      if calloutType and callout_env_map[calloutType] then
        -- remove the [!type] marker
        table.remove(firstPara.content, 1)
        -- remove one following space if present
        if #firstPara.content > 0 and firstPara.content[1].t == "Space" then
          table.remove(firstPara.content, 1)
        end

        -- gather optional custom title (may contain spaces)
        local titleInlines = {}
        while #firstPara.content > 0 do
          local t = firstPara.content[1].t
          if t == "SoftBreak" then
            table.remove(firstPara.content, 1)
            break
          elseif t == "Space" or t == "Str" or t == "Emph" or t == "Strong" or t == "Code" then
            table.insert(titleInlines, table.remove(firstPara.content, 1))
          else
            break
          end
        end
        local customTitle = pandoc.utils.stringify(pandoc.Span(titleInlines))
        customTitle = customTitle:gsub("^%s+", ""):gsub("%s+$", "")
        if customTitle == "" then customTitle = nil end

        local env = callout_env_map[calloutType]
        local titleOption = customTitle and ("[" .. customTitle .. "]") or "[]"

        local latex = "\\begin{" .. env .. "}" .. titleOption .. "\n"
          .. pandoc.write(pandoc.Pandoc(el.content), "latex")
          .. "\n\\end{" .. env .. "}"

        return pandoc.RawBlock("latex", latex)
      end
    end
  end
end
