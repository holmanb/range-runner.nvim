local function define_range_runner(c_opts)
	vim.api.nvim_create_user_command(
		c_opts.name,
		function(opts)
			local lines = vim.api.nvim_buf_get_lines(
				0,               -- current buffer
				opts.line1 - 1,  -- 0-based index
				opts.line2,
				true
			)
			if (c_opts.stdin) then
				local out = ' ' .. table.concat(lines, '\n')
				print(vim.fn.system(c_opts.command, out))
			else
				local out = ' "' .. table.concat(lines, '\n') .. '"'
				print(vim.fn.system(c_opts.command .. out))
			end
			print('return code: [' .. vim.v.shell_error .. ']')
		end,
		{
			desc = 'Run the highlighted snippet with ' .. string.lower(c_opts.name),
			nargs = 0,
			range = '%'
		}
	)
end
for _, runner in ipairs(
	{
		{
			name = 'Sh',
			command = 'sh -c'
		}, {
			name = 'Bash',
			command = 'bash -c',
		}, {
			name = 'Python',
			command = 'python3 -c',
		}, {
			name = 'Node',
			command = 'node -e',
		}, {
			name = 'Perl',
			command = 'perl -E',
		}, {
			name = 'Php',
			command = 'php -r',
		}, {
			name = 'Lua',
			command = 'lua -',
			stdin = true
		}, {
			name = 'Wgetpaste',
			command = 'wgetpaste',
			stdin = true
		}
	}
) do
	define_range_runner(runner)
end
