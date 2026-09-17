-- Pandoc assigns the Compact paragraph style to all DOCX table cells.
-- In the Swiss TPH reference document that style inherits a black font,
-- which overrides the Table style's white first-row text. Apply a dedicated
-- character style to header-cell contents so the intended white wins, and
-- apply bold directly so it cannot be cancelled by paragraph-style precedence.
-- This leaves body-cell text unchanged and avoids emitting raw table OOXML.

local header_style = pandoc.Attr(
  "",
  {},
  { ["custom-style"] = "Table Header White" }
)

local function style_header_block(block)
  if block.t == "Para" or block.t == "Plain" then
    local bold_content = pandoc.Inlines({ pandoc.Strong(block.content) })
    block.content = pandoc.Inlines({ pandoc.Span(bold_content, header_style) })
  end
  return block
end

function Table(table)
  if FORMAT ~= "docx" then
    return nil
  end

  for _, row in ipairs(table.head.rows) do
    for _, cell in ipairs(row.cells) do
      cell.contents = cell.contents:map(style_header_block)
    end
  end

  return table
end
