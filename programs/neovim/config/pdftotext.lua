-- Function to convert PDF to text using pdftotext
local function pdf_to_text()
  local pdf_file_path = vim.fn.expand('%:p') -- Get the full path of the current file
  if not string.match(pdf_file_path, '.pdf') then return end

  -- Open a new buffer to hold the PDF text content, if needed
  if vim.bo.buftype ~= 'nofile' then
    vim.cmd('enew') -- Use 'enew' to avoid affecting other buffers
    vim.bo.buftype = 'nofile'
    vim.bo.bufhidden = 'hide'
    vim.bo.swapfile = false
  end

  -- Run pdftotext and put the output into the buffer
  local pdftotext_cmd = string.format('pdftotext "%s" -', pdf_file_path)
  local pdf_text = vim.fn.system(pdftotext_cmd)

  -- Check for errors in the system call
  if vim.v.shell_error == 0 then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(pdf_text, '\n'))
  else
    print("Failed to load PDF file.")
  end
  
  vim.bo.modified = false -- Mark buffer as unmodified
end

-- Autocommand to automatically convert PDF files when opened with Neovim
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = {'*.pdf'},
  callback = pdf_to_text,
})
