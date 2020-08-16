--[[
I just made this command so I can use my trusty old 'ls' command.
It works like nalquas' 'tree' command just for the current directory
It's a bit different than dir cause it also lists the complete file tree

To use just put into your system_drive/cmd/
]]--

-- Initalize (gets called on start)
function _init(args)
	-- Print out files in current directory
	list_file_tree(fs.cd());
end

-- Print out every file and directory in a specific directory
function list_file_tree(filename)
	-- Print current file
	print(filename)

	-- Traverse
	if fs.isdir(filename) then
		fs.cd(filename)
		folder = fs.list()
		if #folder > 0 then
			for i=1,#folder do
				folder = fs.list()
				if not (folder[i] == nil) then
					list_file_tree(filename .. folder[i]) 
				end
			end
		end
	
		--Return
		fs.cd("..")
	end
end
