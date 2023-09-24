-- server starter to spawn a ped
lib.callback.register('mifh:sever:spawn:ped', function(source, ped, model, coords)
    ped = CreatePed(1, model, coords.x, coords.y, coords.z-1, coords.w, true, false)
end)