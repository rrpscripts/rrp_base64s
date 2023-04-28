local resourceName = GetCurrentResourceName()
local LoadResourceFile = LoadResourceFile
local SaveResourceFile = SaveResourceFile

base64Reader = function(mugshotId, folder)
    folder = folder or "general"
    return LoadResourceFile(resourceName,  ("mugshot-handler/images/%s/%s.txt"):format(folder, mugshotId))
end

base64Writer = function(mugshotId, base64string, folder)
    folder = folder or "general"
    print(mugshotId, base64string, folder)
    SaveResourceFile(resourceName, ("mugshot-handler/images/%s/%s.txt"):format(folder, mugshotId), base64string, -1)
end

lib.callback.register("rrp_base64s:getBase64String", function(playerId, id, folder)
    print(playerId, id, folder)
    return base64Reader(id, folder)
end)

exports("base64Reader", base64Reader)
exports("base64Writer", base64Writer)

-- TODO: add a command for delete unused images
