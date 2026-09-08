local var_0_0 = class("ReversePacmanTechnologyHrItem", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiGiftBtn, function()
		if not ReversePacmanTools.IsUnlockRole(arg_2_0.roleID) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("reverse_pacman_unlock_role"))

			return
		end

		if not ReversePacmanTools.IsHireRole(arg_2_0.roleID) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("reverse_pacman_unhire_role"))

			return
		end

		if arg_2_0.maxFavorabilityValue <= arg_2_0.curFavorabilityValue then
			print("满级", arg_2_0.maxFavorabilityValue, arg_2_0.curFavorabilityValue)

			return
		end

		local var_3_0 = ReversePacmanTools.GetGiftItemID()

		if ReversePacmanTools.GetItemCnt(var_3_0) < 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("reverse_pacman_ not_enough_gifts"))

			return
		end

		arg_2_0:emit(ReversePacmanTechnologyMediator.CMD_GIFT, {
			roleID = arg_2_0.roleID,
			itemID = var_3_0
		})
	end, SFX_PANEL)
	setText(arg_2_0.uiGiftText, i18n("reverse_pacman_send_gift"))
end

function var_0_0.didEnter(arg_4_0, arg_4_1)
	arg_4_0.roleID = arg_4_1

	local var_4_0 = pg.activity_chasing_character[arg_4_1]
	local var_4_1 = ShipGroup.getDefaultShipConfig(pg.ship_skin_template[var_4_0.skin_id].ship_group).id
	local var_4_2 = Ship.New({
		id = var_4_1,
		configId = var_4_1,
		skin_id = var_4_0.skin_id
	})

	GetImageSpriteFromAtlasAsync("shipYardIcon/" .. var_4_2:getPainting(), var_4_2:getPainting(), arg_4_0.uiIconImage)

	if not ReversePacmanTools.IsUnlockRole(arg_4_1) then
		setImageColor(arg_4_0.uiIconImage, Color.NewHex("#00000096"))
	elseif ReversePacmanTools.IsHireRole(arg_4_1) then
		setImageColor(arg_4_0.uiIconImage, Color.NewHex("#ffffffff"))
	else
		setImageColor(arg_4_0.uiIconImage, Color.NewHex("#5E5D5Dff"))
	end

	arg_4_0.maxFavorabilityValue = ReversePacmanTools.GetMaxFavorabilityValue(arg_4_1)
	arg_4_0.curFavorabilityValue = ReversePacmanTools.GetFavorabilityValue(arg_4_1)

	arg_4_0:RefreshFavorability()
	arg_4_0:RefreshTip()
	arg_4_0:RefreshBtn()
end

function var_0_0.RefreshFavorability(arg_5_0)
	local var_5_0 = pg.activity_chasing_character[arg_5_0.roleID]
	local var_5_1 = 0

	for iter_5_0, iter_5_1 in ipairs(var_5_0.love_level) do
		if arg_5_0.curFavorabilityValue >= iter_5_1[2] then
			setFillAmount(arg_5_0[string.format("uiHeartImage%s", iter_5_0)], 1)
		else
			local var_5_2 = arg_5_0.curFavorabilityValue - var_5_1

			if var_5_2 < 0 then
				var_5_2 = 0
			end

			setFillAmount(arg_5_0[string.format("uiHeartImage%s", iter_5_0)], var_5_2 / (iter_5_1[2] - var_5_1))
		end

		var_5_1 = iter_5_1[2]
	end
end

function var_0_0.RefreshBtn(arg_6_0)
	if not ReversePacmanTools.IsHireRole(arg_6_0.roleID) then
		setGray(arg_6_0.uiGiftBtn, true)

		return
	end

	if arg_6_0.maxFavorabilityValue <= arg_6_0.curFavorabilityValue then
		setGray(arg_6_0.uiGiftBtn, true)

		return
	end

	setGray(arg_6_0.uiGiftBtn, false)
end

function var_0_0.RefreshTip(arg_7_0)
	setActive(arg_7_0.uiGiftTipGo, arg_7_0:HasTip())
end

function var_0_0.HasTip(arg_8_0)
	if not ReversePacmanTools.IsHireRole(arg_8_0.roleID) then
		return false
	end

	if arg_8_0.maxFavorabilityValue <= arg_8_0.curFavorabilityValue then
		return false
	end

	return ReversePacmanTools.GetActivity():GetGiftTip()
end

function var_0_0.willExit(arg_9_0)
	arg_9_0:detach()
end

return var_0_0
