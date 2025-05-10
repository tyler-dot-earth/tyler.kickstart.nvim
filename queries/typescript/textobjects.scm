; outer = whole export block
(export_statement) @export.outer

; inner = just the thing being exported (e.g. function/class/variable)
(export_statement
  (function_declaration) @export.inner)
