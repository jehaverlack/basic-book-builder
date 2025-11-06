-- HTML/EPUB Obsidian callouts with correct title/body split

function BlockQuote(el)
  if #el.content == 0 then return nil end
  local first = el.content[1]

  -- Only process if first block is Para and starts with [!tag]
  if first.t ~= "Para" or #first.content == 0 or first.content[1].t ~= "Str" then
    return nil
  end

  local tag = first.content[1].text:match("^%[!(.-)%]$")
  if not tag then return nil end
  tag = tag:lower()

  -- Remove [!tag]
  table.remove(first.content, 1)
  if #first.content > 0 and first.content[1].t == "Space" then
    table.remove(first.content, 1)
  end

  -- Now first.content = title words + the rest of that line
  local title_inlines = {}
  local body_inlines = {}
  local in_title = true

  for _, inline in ipairs(first.content) do
    if in_title and (inline.t == "Space" or inline.t == "Str") then
      table.insert(title_inlines, inline)
    else
      in_title = false
      table.insert(body_inlines, inline)
    end
  end

  -- Remove the processed first block
  table.remove(el.content, 1)

  local blocks = {}

  -- Title paragraph
  table.insert(blocks, pandoc.Para({ pandoc.Strong(title_inlines) }))

  -- Body first-line paragraph if exists
  if #body_inlines > 0 then
    table.insert(blocks, pandoc.Para(body_inlines))
  end

  -- Append remaining content normally
  for _, blk in ipairs(el.content) do
    table.insert(blocks, blk)
  end

  return pandoc.Div(blocks, { class = "callout-" .. tag })
end
