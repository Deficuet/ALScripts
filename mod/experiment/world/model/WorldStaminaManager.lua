local var_0_0 = class("WorldStaminaManager", import("...BaseEntity"))

var_0_0.Fields = {
	staminaExchangeTimes = "number",
	staminaLastRecoverTime = "number",
	staminaExtra = "number",
	transform = "userdata",
	preSelectIndex = "number",
	updateTimer = "table",
	stamina = "number",
	UIMain = "userdata"
}
var_0_0.EventUpdateStamina = "WorldStaminaManager.EventUpdateStamina"

function var_0_0.Build(arg_1_0)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.UIMain = pg.UIMgr.GetInstance().OverlayMain

	local var_1_0 = PoolMgr.GetInstance()

	var_1_0:GetUI("WorldStaminaRecoverUI", true, function(arg_2_0)
		if not arg_1_0.UIMain then
			var_1_0:ReturnUI("WorldStaminaRecoverUI", arg_2_0)
		else
			arg_1_0.transform = tf(arg_2_0)

			setParent(arg_1_0.transform, arg_1_0.UIMain, false)
			setActive(arg_1_0.transform, false)
			onButton(arg_1_0, arg_1_0.transform:Find("bg"), function()
				arg_1_0:Hide()
			end, SFX_CANCEL)
			onButton(arg_1_0, arg_1_0.transform:Find("window/top/btnBack"), function()
				arg_1_0:Hide()
			end, SFX_CANCEL)
			onButton(arg_1_0, arg_1_0.transform:Find("window/button_container/custom_button_2"), function()
				arg_1_0:Hide()
			end, SFX_CANCEL)
		end
	end)
end

function var_0_0.Setup(arg_6_0, arg_6_1)
	arg_6_0.stamina = arg_6_1[1]
	arg_6_0.staminaExtra = arg_6_1[2]
	arg_6_0.staminaLastRecoverTime = arg_6_1[3]
	arg_6_0.staminaExchangeTimes = arg_6_1[4]

	if not arg_6_0.updateTimer then
		arg_6_0.updateTimer = Timer.New(function()
			arg_6_0:UpdateStamina()
		end, 1, -1)

		arg_6_0.updateTimer:Start()
		arg_6_0.updateTimer.func()
	end
end

function var_0_0.Dispose(arg_8_0)
	pg.DelegateInfo.Dispose(arg_8_0)

	if arg_8_0.updateTimer then
		arg_8_0.updateTimer:Stop()
	end

	if arg_8_0.transform then
		PoolMgr.GetInstance():ReturnUI("WorldStaminaRecoverUI", go(arg_8_0.transform))
	end

	arg_8_0:Clear()
end

function var_0_0.Reset(arg_9_0)
	arg_9_0.stamina = arg_9_0:GetMaxStamina()
end

function var_0_0.ChangeStamina(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.stamina = arg_10_1
	arg_10_0.staminaExtra = arg_10_2

	arg_10_0:DispatchEvent(var_0_0.EventUpdateStamina)
end

function var_0_0.UpdateStamina(arg_11_0)
	local var_11_0 = pg.gameset.world_movepower_recovery_interval.key_value
	local var_11_1 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_11_2 = math.floor((var_11_1 - arg_11_0.staminaLastRecoverTime) / var_11_0)

	if var_11_2 > 0 then
		arg_11_0.staminaLastRecoverTime = arg_11_0.staminaLastRecoverTime + var_11_2 * var_11_0

		if arg_11_0.stamina < arg_11_0:GetMaxStamina() then
			arg_11_0.stamina = math.min(arg_11_0.stamina + var_11_2, arg_11_0:GetMaxStamina())

			arg_11_0:DispatchEvent(var_0_0.EventUpdateStamina)
		end
	end
end

function var_0_0.CheckUpdateShow(arg_12_0)
	if arg_12_0:IsShowing() then
		arg_12_0:Show()
	end
end

function var_0_0.Show(arg_13_0)
	local var_13_0 = arg_13_0.transform:Find("window/world_stamina_panel")
	local var_13_1 = pg.gameset.world_movepower_recovery_interval.key_value
	local var_13_2 = string.format("%.2d:%.2d:%.2d", math.floor(var_13_1 / 3600), math.floor(var_13_1 % 3600 / 60), var_13_1 % 60)

	setText(var_13_0:Find("content/tip_bg/tip"), i18n("world_stamina_recover", var_13_2))
	setText(var_13_0:Find("content/tip_bg/stamina/value"), arg_13_0:GetTotalStamina())

	local var_13_3 = var_13_0:Find("content/item_list")
	local var_13_4 = var_13_0:Find("item")

	setActive(var_13_4, false)

	local var_13_5 = arg_13_0.transform:Find("window/button_container/custom_button_1")

	removeAllChildren(var_13_3)

	local var_13_6 = arg_13_0:GetExchangeItems()

	for iter_13_0, iter_13_1 in ipairs(var_13_6) do
		local var_13_7 = cloneTplTo(var_13_4, var_13_3)

		updateDrop(var_13_7:Find("IconTpl"), iter_13_1.drop)
		setText(var_13_7:Find("IconTpl/icon_bg/count"), iter_13_1.drop.count and iter_13_1.drop.count or "")
		setText(var_13_7:Find("name/Text"), shortenString(getText(var_13_7:Find("IconTpl/name")), 6))
		onToggle(arg_13_0, var_13_7, function(arg_14_0)
			if arg_14_0 then
				arg_13_0.preSelectIndex = iter_13_0

				if iter_13_0 > 1 then
					setText(var_13_0:Find("content/Text"), i18n("world_stamina_text2", iter_13_1.name, iter_13_1.stamina))
					onButton(arg_13_0, var_13_5, function()
						if iter_13_1.drop.count == 0 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))
						else
							local var_15_0 = nowWorld()
							local var_15_1 = {}
							local var_15_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

							if var_15_0:CheckResetProgress() and PlayerPrefs.GetString("world_stamina_reset_tip", "") ~= var_15_2 and var_15_0:GetResetWaitingTime() < 259200 and arg_13_0:GetTotalStamina() + iter_13_1.stamina > arg_13_0:GetMaxStamina() then
								PlayerPrefs.SetString("world_stamina_reset_tip", var_15_2)
								table.insert(var_15_1, function(arg_16_0)
									pg.MsgboxMgr.GetInstance():ShowMsgBox({
										content = i18n("world_stamina_resetwarning", arg_13_0:GetMaxStamina()),
										onYes = arg_16_0
									})
								end)
							end

							seriesAsync(var_15_1, function()
								pg.m02:sendNotification(GAME.WORLD_ITEM_USE, {
									count = 1,
									itemID = iter_13_1.drop.id,
									args = {}
								})
							end)
						end
					end, SFX_CONFIRM)
				elseif iter_13_0 == 1 then
					setText(var_13_0:Find("content/Text"), i18n("world_stamina_text", iter_13_1.cost, iter_13_1.stamina, iter_13_1.times, iter_13_1.limit))
					onButton(arg_13_0, var_13_5, function()
						if iter_13_1.drop.count < iter_13_1.cost then
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_oil"))
						elseif iter_13_1.times == 0 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))
						else
							local var_18_0 = nowWorld()
							local var_18_1 = {}
							local var_18_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

							if var_18_0:CheckResetProgress() and PlayerPrefs.GetString("world_stamina_reset_tip", "") ~= var_18_2 and var_18_0:GetResetWaitingTime() < 259200 and arg_13_0:GetTotalStamina() + iter_13_1.stamina > arg_13_0:GetMaxStamina() then
								PlayerPrefs.SetString("world_stamina_reset_tip", var_18_2)
								table.insert(var_18_1, function(arg_19_0)
									pg.MsgboxMgr.GetInstance():ShowMsgBox({
										content = i18n("world_stamina_resetwarning", arg_13_0:GetMaxStamina()),
										onYes = arg_19_0
									})
								end)
							end

							seriesAsync(var_18_1, function()
								pg.m02:sendNotification(GAME.WORLD_STAMINA_EXCHANGE)
							end)
						end
					end, SFX_CONFIRM)
				end
			end
		end, SFX_PANEL)
	end

	if arg_13_0.preSelectIndex then
		triggerToggle(var_13_3:GetChild(arg_13_0.preSelectIndex - 1), true)
	else
		local var_13_8 = 1

		for iter_13_2 = 2, #var_13_6 do
			if var_13_6[iter_13_2].drop.count > 0 then
				var_13_8 = iter_13_2

				break
			end
		end

		triggerToggle(var_13_3:GetChild(var_13_8 - 1), true)
	end

	setActive(arg_13_0.transform, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_13_0.transform)
end

function var_0_0.Hide(arg_21_0)
	arg_21_0.preSelectIndex = nil

	setActive(arg_21_0.transform, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_21_0.transform, arg_21_0.UIMain)
end

function var_0_0.IsShowing(arg_22_0)
	return arg_22_0.transform and isActive(arg_22_0.transform) or false
end

function var_0_0.GetStamina(arg_23_0)
	return arg_23_0.stamina
end

function var_0_0.GetMaxStamina(arg_24_0)
	return pg.gameset.world_movepower_maxvalue.key_value
end

function var_0_0.GetExtraStamina(arg_25_0)
	return arg_25_0.staminaExtra
end

function var_0_0.GetTotalStamina(arg_26_0)
	return arg_26_0:GetStamina() + arg_26_0:GetExtraStamina()
end

function var_0_0.GetStepStaminaCost(arg_27_0)
	return pg.gameset.world_cell_cost_movepower.key_value
end

function var_0_0.GetMaxMoveStep(arg_28_0)
	return math.floor(arg_28_0:GetTotalStamina() / arg_28_0:GetStepStaminaCost())
end

function var_0_0.ConsumeStamina(arg_29_0, arg_29_1)
	arg_29_0.staminaExtra = arg_29_0.staminaExtra - arg_29_1

	if arg_29_0.staminaExtra < 0 then
		arg_29_0.stamina = arg_29_0.stamina + arg_29_0.staminaExtra
		arg_29_0.staminaExtra = 0
	end

	assert(arg_29_0.stamina >= 0, "out of stamina.")
	arg_29_0:DispatchEvent(var_0_0.EventUpdateStamina)
end

function var_0_0.GetExchangeData(arg_30_0)
	local var_30_0 = pg.gameset.world_supply_value.description
	local var_30_1 = pg.gameset.world_supply_price.description
	local var_30_2 = var_30_0[math.min(#var_30_0, arg_30_0.staminaExchangeTimes + 1)]
	local var_30_3 = var_30_1[math.min(#var_30_1, arg_30_0.staminaExchangeTimes + 1)]

	return var_30_2[1], var_30_3[3], #var_30_1 - arg_30_0.staminaExchangeTimes, #var_30_1
end

function var_0_0.GetExchangeItems(arg_31_0)
	local var_31_0 = nowWorld():GetInventoryProxy()
	local var_31_1, var_31_2, var_31_3, var_31_4 = arg_31_0:GetExchangeData()
	local var_31_5 = {
		{
			drop = Drop.New({
				id = PlayerConst.ResOil,
				type = DROP_TYPE_RESOURCE,
				count = getProxy(PlayerProxy):getRawData().oil
			}),
			cost = var_31_2,
			stamina = var_31_1,
			times = var_31_3,
			limit = var_31_4
		}
	}

	for iter_31_0, iter_31_1 in ipairs(pg.gameset.world_supply_itemlist.description) do
		local var_31_6 = Drop.New({
			type = DROP_TYPE_WORLD_ITEM,
			id = iter_31_1,
			count = var_31_0:GetItemCount(iter_31_1)
		})

		table.insert(var_31_5, {
			cost = 1,
			drop = var_31_6,
			name = var_31_6:getConfig("name"),
			stamina = var_31_6:getSubClass():getItemStaminaRecover()
		})
	end

	return var_31_5
end

function var_0_0.ExchangeStamina(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0.stamina = arg_32_0.stamina + arg_32_1

	if arg_32_2 then
		arg_32_0.staminaExchangeTimes = arg_32_0.staminaExchangeTimes + 1
	end

	arg_32_0:DispatchEvent(var_0_0.EventUpdateStamina)
	arg_32_0:CheckUpdateShow()
end

function var_0_0.GetDisplayStanima(arg_33_0)
	return arg_33_0:GetTotalStamina()
end

return var_0_0
