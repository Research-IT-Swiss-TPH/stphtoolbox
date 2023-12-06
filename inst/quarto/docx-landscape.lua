local ooxml = function (s)
  return pandoc.RawBlock('openxml', s)
end

local end_portrait_section = ooxml
  '<w:p><w:pPr><w:sectPr></w:sectPr></w:pPr></w:p>'

local end_landscape_section = ooxml [[
<w:p>
  <w:pPr>
    <w:sectPr>
      <w:pgSz w:h="11906" w:w="16838" w:orient="landscape" />
      <w:pgMar w:top="722" w:right="722" w:bottom="722" w:left="722" w:header="567" w:footer="510" w:gutter="0"/>
    </w:sectPr>
  </w:pPr>
</w:p>
]]

function Div (div)
  if div.classes:includes 'landscape' then
    div.content:insert(1, end_portrait_section)
    div.content:insert(end_landscape_section)
    return div
  end
end
