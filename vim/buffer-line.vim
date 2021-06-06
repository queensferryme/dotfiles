highlight default link BufferVisible       BufferInactive
highlight default link BufferVisibleIndex  BufferInactiveIndex
highlight default link BufferVisibleMod    BufferInactiveMod
highlight default link BufferVisibleSign   BufferInactiveSign
highlight default link BufferVisibleTarget BufferInactiveTarget

let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_custom_colors = v:false
let bufferline.no_name_title = "[No Name]"

set termguicolors

