assets = {}
assets["sprites"] = {}

function assets.load(folder)
    --getting files from given directory
	local filesTable = love.filesystem.getDirectoryItems(folder)
    --iterating through received items
	for i,v in ipairs(filesTable) do
        --current element and info about it
		local file = folder.."/"..v
		local info = love.filesystem.getInfo(file)

		if info then
            --if it is a file then add to assets
			if info.type == "file" and file:match "[^.]+$" == "png" then
                assets.sprites[v] = love.graphics.newImage(file)
                assets.sprites[v] = love.graphics.newImage(file)
			elseif info.type == "directory" then
				assets.load(file)
			end
		end
	end
end

return assets