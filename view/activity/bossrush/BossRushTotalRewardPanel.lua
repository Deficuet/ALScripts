local var_0_0 = class("BossRushTotalRewardPanel", import("view.activity.worldboss.ActivityBossTotalRewardPanel"))

function var_0_0.getUIName(arg_1_0)
	return "BossRushTotalRewardPanel"
end

local var_0_1 = 0.15

function var_0_0.init(arg_2_0)
	var_0_0.super.init(arg_2_0)
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf, {
		lockGlobalBlur = true
	})
	arg_3_0:UpdateView()

	local var_3_0 = arg_3_0.contextData.isAutoFight
	local var_3_1 = PlayerPrefs.GetInt(AUTO_BATTLE_LABEL, 0) > 0

	if var_3_0 and var_3_1 then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_AUTO_BATTLE)
		LuaHelper.Vibrate()
	end
end

function var_0_0.UpdateView(arg_4_0)
	local var_4_0 = arg_4_0.contextData

	onButton(arg_4_0, arg_4_0._tf:Find("BG"), function()
		if arg_4_0.isRewardAnimating then
			arg_4_0:SkipAnim()

			return
		end

		existCall(var_4_0.onClose)
		arg_4_0:closeView()
	end)
	setText(arg_4_0.window:Find("Fixed/ButtonGO/pic"), i18n("text_confirm"))
	onButton(arg_4_0, arg_4_0.window:Find("Fixed/ButtonGO"), function()
		existCall(var_4_0.onClose)
		arg_4_0:closeView()
	end, SFX_CONFIRM)
	setText(arg_4_0.window:Find("Fixed/ButtonExit/pic"), i18n("autofight_leave"))
	onButton(arg_4_0, arg_4_0.window:Find("Fixed/ButtonExit"), function()
		existCall(var_4_0.onClose)
		arg_4_0:closeView()
	end, SFX_CANCEL)

	local var_4_1 = var_4_0.rewards
	local var_4_2 = {}

	setActive(arg_4_0.boxView:Find("Content/TextArea2"), arg_4_0.contextData.totalBattleTimes)

	local var_4_3 = var_4_1 and #var_4_1 > 0
	local var_4_4 = CustomIndexLayer.Clone2Full(arg_4_0.itemList, #var_4_1)

	for iter_4_0, iter_4_1 in ipairs(var_4_4) do
		local var_4_5 = var_4_1[iter_4_0]
		local var_4_6 = var_4_4[iter_4_0]

		updateDrop(var_4_6:Find("Icon"), var_4_5)
		onButton(arg_4_0, var_4_6:Find("Icon"), function()
			arg_4_0:emit(BaseUI.ON_DROP, var_4_5)
		end, SFX_PANEL)
	end

	if var_4_3 then
		arg_4_0.isRewardAnimating = true

		for iter_4_2 = 1, #var_4_1 do
			local var_4_7 = var_4_4[iter_4_2]

			setActive(var_4_7, false)
			table.insert(var_4_2, function(arg_9_0)
				if arg_4_0.exited then
					return
				end

				setActive(var_4_7, true)
				scrollTo(arg_4_0.boxView:Find("Content"), {
					y = 0
				})

				arg_4_0.LTid = LeanTween.delayedCall(var_0_1, System.Action(arg_9_0)).uniqueId
			end)
		end
	end

	local var_4_8 = {}
	local var_4_9 = arg_4_0.contextData.stopReason

	if not var_4_9 then
		if arg_4_0.contextData.isAutoFight then
			table.insert(var_4_8, i18n("multiple_sorties_finish"))
		else
			table.insert(var_4_8, i18n("multiple_sorties_stop"))
		end
	else
		table.insert(var_4_8, var_4_9 .. i18n("multiple_sorties_stop_tip_end"))
	end

	if arg_4_0.contextData.totalBattleTimes then
		table.insert(var_4_8, i18n("multiple_sorties_end_status", arg_4_0.contextData.totalBattleTimes, arg_4_0.contextData.totalBattleTimes - arg_4_0.contextData.continuousBattleTimes))

		if #var_4_8 > 0 then
			setText(arg_4_0.boxView:Find("Content/TextArea2/Text"), table.concat(var_4_8, "\n"))
		end
	end

	arg_4_0:ShowShips(var_4_1)
	seriesAsync(var_4_2, function()
		arg_4_0:SkipAnim()
	end)
end

function var_0_0.ShowShips(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = #_.filter(arg_11_1, function(arg_12_0)
		return arg_12_0.type == DROP_TYPE_SHIP
	end)
	local var_11_1 = getProxy(BayProxy):getNewShip(true)
	local var_11_2 = {}

	for iter_11_0 = math.max(1, #var_11_1 - var_11_0 + 1), #var_11_1 do
		local var_11_3 = var_11_1[iter_11_0]
		local var_11_4 = PlayerPrefs.GetInt(DISPLAY_SHIP_GET_EFFECT) == 1 or var_11_3.virgin or var_11_3:getRarity() >= ShipRarity.Purple

		print(var_11_4)

		if var_11_4 then
			table.insert(var_11_2, function(arg_13_0)
				arg_11_0:emit(BossRushTotalRewardPanelMediator.GET_NEW_SHIP, var_11_3, arg_13_0)
			end)
		end
	end

	seriesAsync(var_11_2, arg_11_2)
end

function var_0_0.willExit(arg_14_0)
	pg.m02:sendNotification(BossRushTotalRewardPanelMediator.ON_WILL_EXIT)
end

return var_0_0
