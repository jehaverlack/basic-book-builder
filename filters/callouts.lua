-- Map callout types to LaTeX environments
local callout_env_map = {
    idea = "ideabox",
    proposed = "proposedbox",
    established = "establishedbox",
    speculative = "speculativebox"
  }
  
  function BlockQuote(el)
    if #el.content > 0 and el.content[1].t == "Para" then
      local firstPara = el.content[1]
      if #firstPara.content > 0 and firstPara.content[1].t == "Str" then
        local firstWord = firstPara.content[1].text
        local calloutType = firstWord:match("^%[%!(%w+)%]$")
        if calloutType and callout_env_map[calloutType] then
          -- Remove the [!type] marker and leading space
          table.remove(firstPara.content, 1)
          if #firstPara.content > 0 and firstPara.content[1].t == "Space" then
            table.remove(firstPara.content, 1)
          end
  
          -- Wrap the content in the appropriate LaTeX box
          local env = callout_env_map[calloutType]
          local latex = "\\begin{"..env.."}\n" ..
            pandoc.write(pandoc.Pandoc(el.content), "latex") ..
            "\n\\end{"..env.."}"
          return pandoc.RawBlock("latex", latex)
        end
      end
    end
  end
  