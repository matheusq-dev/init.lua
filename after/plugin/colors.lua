function ColorMyPencils(color) 

    vim.g.airline_theme = "ouo"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.cmd([[
        let g:airline_detect_whitespace=0
        let g:airline#extensions#whitespace#enabled=0
        let g:airline#extensions#tabline#enabled = 0 "the thing on top 
    ]])

    vim.g.airline_detect_whitespace=false
end

ColorMyPencils()
