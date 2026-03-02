vim.cmd 'highlight clear'
vim.g.colors_name = 'monokai-pro-ristretto'

require('colorscheme.monokai-pro').apply {
  dark2 = '#191515',
  dark1 = '#211c1c',
  bg = '#2c2525',
  text = '#fff1f3',
  accent1 = '#fd6883', -- red/pink
  accent2 = '#f38d70', -- orange
  accent3 = '#f9cc6c', -- yellow
  accent4 = '#adda78', -- green
  accent5 = '#85dacc', -- cyan
  accent6 = '#a8a9eb', -- purple
  dimmed1 = '#c3b7b8',
  dimmed2 = '#948a8b',
  dimmed3 = '#72696a',
  dimmed4 = '#5b5353',
  dimmed5 = '#403838',
}
