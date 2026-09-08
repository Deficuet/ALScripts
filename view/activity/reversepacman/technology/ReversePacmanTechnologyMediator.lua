local var_0_0 = class("ReversePacmanTechnologyMediator", import("view.base.ContextMediator"))

var_0_0.CMD_GIFT = "ReversePacmanTechnologyMediator::CMD_GIFT"
var_0_0.CMD_SELECTED_OPTIONAL = "ReversePacmanTechnologyMediator::CMD_SELECTED_OPTIONAL"
var_0_0.BUY_SHOP_ITEM = "ReversePacmanTechnologyMediator::BUY_SHOP_ITEM"

function var_0_0.register(arg_1_0)
	local var_1_0 = ReversePacmanTools.GetActivity().id

	arg_1_0:bind(var_0_0.CMD_GIFT, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.REVERSE_PACMAN_GIFT_ROLE, {
			activityID = var_1_0,
			roleID = arg_2_1.roleID,
			itemID = arg_2_1.itemID
		})
	end)
	arg_1_0:bind(var_0_0.CMD_SELECTED_OPTIONAL, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.REVERSE_PACMAN_ADD_FAVORABILITY, {
			activityID = var_1_0,
			roleID = arg_3_1.roleID
		})
	end)
	arg_1_0:bind(var_0_0.BUY_SHOP_ITEM, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			arg2 = 1,
			activity_id = arg_4_1.activityID,
			arg1 = arg_4_1.shopID
		})
	end)
end

function var_0_0.initNotificationHandleDic(arg_5_0)
	arg_5_0.handleDic = {
		[GAME.REVERSE_PACMAN_GIFT_ROLE_DONE] = function(arg_6_0, arg_6_1)
			local var_6_0 = ReversePacmanTools.GetActivity()

			if var_6_0:GetGiftTip() then
				var_6_0:SetGiftTip()
			end

			arg_6_0.viewComponent:RefreshTips()
			arg_6_0:sendNotification(GAME.REVERSE_PACMAN_REFRESH_TIP)
			arg_6_0.viewComponent:emit(ReversePacmanTechnologyHrView.GIFT_SUCCESS, arg_6_1:getBody())
		end,
		[STORY_EVENT.OPTION_SELECTED] = function(arg_7_0, arg_7_1)
			arg_7_0.viewComponent:emit(ReversePacmanTechnologyHrView.STORY_SELECTED_OPTIONAL, arg_7_1:getBody())
		end,
		[GAME.REVERSE_PACMAN_ADD_FAVORABILITY_DONE] = function(arg_8_0, arg_8_1)
			arg_8_0.viewComponent:emit(ReversePacmanTechnologyHrView.STORY_ADD_FAVORABILITY, arg_8_1:getBody())
		end,
		[ShopsProxy.ACTIVITY_SHOP_GOODS_UPDATED] = function(arg_9_0, arg_9_1)
			local var_9_0 = arg_9_1:getBody().goodsId
			local var_9_1 = ReversePacmanTools.GetActivity()

			if table.keyof(var_9_1:getConfig("config_client").technologyShopIDList, var_9_0) then
				if var_9_1:GetRoleSkillTip() then
					var_9_1:SetRoleSkillTip()
				end
			elseif var_9_1:GetPlayerSkillTip() then
				var_9_1:SetPlayerSkillTip()
			end

			arg_9_0.viewComponent:emit(ReversePacmanTechnologyRoleSkillView.BUY_SHOP_ITEM_SUCCESS, var_9_0)
		end,
		[ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS] = function(arg_10_0, arg_10_1)
			local var_10_0 = arg_10_1:getBody()

			arg_10_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_10_0.awards, var_10_0.callback)
		end,
		[PlayerProxy.UPDATED] = function(arg_11_0, arg_11_1)
			arg_11_0.viewComponent:RefreshTips()
			arg_11_0:sendNotification(GAME.REVERSE_PACMAN_REFRESH_TIP)
			arg_11_0.viewComponent:emit(ReversePacmanTechnologyRoleSkillView.REFRESH_ITEM_CNT)
		end
	}
end

function var_0_0.remove(arg_12_0)
	return
end

return var_0_0
