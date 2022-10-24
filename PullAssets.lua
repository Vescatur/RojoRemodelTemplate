function splitstring(inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end

local function GetInstanceFromDatamodel(Datamodel,StringPath)
	local CurrentObjectReference = Datamodel

	for _, ObjectName in pairs(splitstring(StringPath,".")) do
		if CurrentObjectReference:FindFirstChild(ObjectName) ~= nil then
			CurrentObjectReference = CurrentObjectReference[ObjectName]
		else
			error(ObjectName.." was not found.")
			return nil
		end
	end

	return CurrentObjectReference
end

local function SaveAssetToFilesystem(Asset,Path)
    for _,Instance in pairs(Asset:GetChildren()) do
		remodel.writeModelFile(Path.."/"..Instance.Name..".rbxmx",Instance)
    end
end

function wait()
	local handle = io.popen("Cscript Sleep.vbs 1000")
	handle:close()
end

function lastWriteTime(inputFile)
	local handle = io.popen("powershell.exe \"dir "..inputFile.." | Select-Object LastWriteTime\"")
	local result = handle:read("*a")
	handle:close()
	return result
end

previousWriteTime = ""
inputFile = "assets/Models.rbxl"
Saveto = "assets/models"

while(true) do
	wait()
	writeTime = lastWriteTime(inputFile)
	if writeTime ~= previousWriteTime then
		local Datamodel = remodel.readPlaceFile(inputFile)
		local Pullfrom = GetInstanceFromDatamodel(Datamodel,"Workspace.Models")
		SaveAssetToFilesystem(Pullfrom,Saveto)
		previousWriteTime = writeTime
	end
end