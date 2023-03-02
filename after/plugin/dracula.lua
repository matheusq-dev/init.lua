local my_colors = {
  sumiInk1 = "#15141b",
  crystalBlue = "#ffca85",
  springGreen = "#61ffca",
  waveAqua2 = "#82e2ff",
  carpYellow = "#f694ff",
  boatYellow2 = "#a277ff",
  surimiOrange = "#FFFFFF",
  fujiWhite= "#FFFFFF",
  oniViolet= "#a277ff",
  springBlue= "#a277ff"
}
require'kanagawa'.setup({ colors = my_colors })
vim.cmd("colorscheme kanagawa")
