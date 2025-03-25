-- 自动格式化保存时触发
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	command = "set nohlsearch",
})

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set hlsearch",
})

function CloseBufferWithSwitch()
	local current_buf = vim.api.nvim_get_current_buf()
	local other_bufs = vim.tbl_filter(function(buf)
		return buf ~= current_buf
			and vim.api.nvim_buf_is_valid(buf)
			and vim.bo[buf].buflisted
			and vim.bo[buf].buftype == ""
	end, vim.api.nvim_list_bufs())

	-- 关闭当前buffer
	vim.cmd("bdelete " .. current_buf)

	-- 如果没有其他buffer，退出Neovim
	if #other_bufs ~= 0 then
		vim.cmd("buffer " .. other_bufs[#other_bufs])
	end
end

-- 创建一个命令来调用这个函数
vim.api.nvim_create_user_command("BClose", function()
	CloseBufferWithSwitch()
end, {})
