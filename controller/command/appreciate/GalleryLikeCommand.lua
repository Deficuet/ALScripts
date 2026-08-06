local var_0_0 = class("GalleryLikeCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.picID
	local var_1_2 = var_1_0.isAdd
	local var_1_3 = var_1_0.likeCBFunc
	local var_1_4 = getProxy(AppreciateProxy)

	pg.ConnectionMgr.GetInstance():Send(17505, {
		id = var_1_1,
		action = var_1_2
	}, 17506, function(arg_2_0)
		if arg_2_0.result == 0 then
			if var_1_2 == 0 then
				var_1_4:addPicIDToLikeList(var_1_1)
			elseif var_1_2 == 1 then
				var_1_4:removePicIDFromLikeList(var_1_1)
			end

			if var_1_3 then
				var_1_3()
			end

			arg_1_0:sendNotification(GAME.APPRECIATE_GALLERY_LIKE_DONE, {
				picID = var_1_1,
				action = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("Like Fail" .. tostring(arg_2_0.result))
		end
	end)
end

return var_0_0
