local var_0_0 = class("ChapterAutoTotalRewardLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ChapterAutoTotalRewardPanel"
end

local var_0_1 = 0.15

function var_0_0.init(arg_2_0)
	arg_2_0.window = arg_2_0._tf:Find("Window")
	arg_2_0.boxView = arg_2_0.window:Find("Layout/Box/ScrollView")
	arg_2_0.TextTF = arg_2_0.boxView:Find("Content/TextArea2/Text")
	arg_2_0.eventTF = arg_2_0.boxView:Find("Content/TextArea")

	setActive(arg_2_0.eventTF, false)

	arg_2_0.emptyTip = arg_2_0.window:Find("Layout/Box/EmptyTip")

	setText(arg_2_0.emptyTip, i18n("autofight_rewards_none"))
	setText(arg_2_0.window:Find("Fixed/top/bg/obtain/title"), i18n("autofight_rewards"))
	setText(arg_2_0.window:Find("Fixed/top/bg/obtain/title/title_en"), i18n("total_rewards_subtitle"))
	setText(arg_2_0.window:Find("Fixed/ButtonGO/pic"), i18n("text_confirm"))
	setText(arg_2_0.window:Find("Fixed/ButtonExit/pic"), i18n("autofight_leave"))

	arg_2_0.itemList = arg_2_0.boxView:Find("Content/ItemGrid2")
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("BG"), function()
		if arg_3_0.isRewardAnimating then
			arg_3_0:SkipAnim()

			return
		end

		existCall(arg_3_0.contextData.onClose)
		arg_3_0:closeView()
	end)
	onButton(arg_3_0, arg_3_0.window:Find("Fixed/ButtonGO"), function()
		existCall(arg_3_0.contextData.onClose)
		arg_3_0:closeView()
	end, SFX_CONFIRM)
	onButton(arg_3_0, arg_3_0.window:Find("Fixed/ButtonExit"), function()
		existCall(arg_3_0.contextData.onClose)
		arg_3_0:closeView()
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf, {
		lockGlobalBlur = true
	})
	getProxy(ChapterAutoProxy):SetSkipBatchBuildFlag(false)
	arg_3_0:UpdateView()
end

function var_0_0.UpdateView(arg_7_0)
	local var_7_0 = {}
	local var_7_1 = arg_7_0.contextData.rewards
	local var_7_2 = var_7_1 and #var_7_1 > 0
	local var_7_3 = CustomIndexLayer.Clone2Full(arg_7_0.itemList, #var_7_1)

	for iter_7_0, iter_7_1 in ipairs(var_7_3) do
		local var_7_4 = var_7_1[iter_7_0]
		local var_7_5 = var_7_3[iter_7_0]

		updateDrop(var_7_5:Find("Icon"), var_7_4)
		onButton(arg_7_0, var_7_5:Find("Icon"), function()
			arg_7_0:emit(BaseUI.ON_DROP, var_7_4)
		end, SFX_PANEL)
	end

	if var_7_2 then
		arg_7_0.isRewardAnimating = true

		for iter_7_2 = 1, #var_7_1 do
			local var_7_6 = var_7_3[iter_7_2]

			setActive(var_7_6, false)
			table.insert(var_7_0, function(arg_9_0)
				if not arg_7_0:isLoaded() then
					return
				end

				setActive(var_7_6, true)
				scrollTo(arg_7_0.boxView:Find("Content"), {
					y = 0
				})

				arg_7_0.LTid = LeanTween.delayedCall(var_0_1, System.Action(arg_9_0)).uniqueId
			end)
		end
	end

	local var_7_7 = {}

	if arg_7_0.contextData.isFinished then
		table.insert(var_7_7, i18n("auto_battle_finish"))
	else
		table.insert(var_7_7, i18n("auto_battle_stop"))
	end

	table.insert(var_7_7, i18n("auto_battle_end_exp", arg_7_0.contextData.proficiency))
	table.insert(var_7_7, i18n("auto_battle_end_status", arg_7_0.contextData.totalTimes, arg_7_0.contextData.finishTimes))

	if #var_7_7 > 0 then
		setText(arg_7_0.TextTF, table.concat(var_7_7, "\n"))
	end

	arg_7_0:ShowShips(var_7_1)
	seriesAsync(var_7_0, function()
		arg_7_0:SkipAnim()
		arg_7_0:UpdateEvent()
	end)
end

function var_0_0.ShowShips(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = #_.filter(arg_11_1, function(arg_12_0)
		return arg_12_0.type == DROP_TYPE_SHIP
	end)
	local var_11_1 = getProxy(BayProxy):getNewShip(true)
	local var_11_2 = {}

	for iter_11_0 = math.max(1, #var_11_1 - var_11_0 + 1), #var_11_1 do
		local var_11_3 = iter_11_0 == #var_11_1
		local var_11_4 = var_11_1[iter_11_0]

		if PlayerPrefs.GetInt(DISPLAY_SHIP_GET_EFFECT) == 1 or var_11_4.virgin or var_11_4:getRarity() >= ShipRarity.Purple then
			table.insert(var_11_2, function(arg_13_0)
				if getProxy(ChapterAutoProxy):GetSkipBatchBuildFlag() then
					arg_13_0()
				else
					arg_11_0:emit(ChapterAutoTotalRewardMediator.GET_NEW_SHIP, var_11_4, var_11_3, arg_13_0)
				end
			end)
		end
	end

	seriesAsync(var_11_2, arg_11_2)
end

function var_0_0.SkipAnim(arg_14_0)
	if not arg_14_0.isRewardAnimating then
		return
	end

	arg_14_0.isRewardAnimating = nil

	if arg_14_0.LTid then
		LeanTween.cancel(arg_14_0.LTid)

		arg_14_0.LTid = nil
	end

	eachChild(arg_14_0.itemList, function(arg_15_0)
		setActive(arg_15_0, true)
	end)
end

function var_0_0.UpdateEvent(arg_16_0)
	local var_16_0 = getProxy(ChapterAutoProxy):GetNewEventIds()

	arg_16_0.eventTF = arg_16_0.boxView:Find("Content/TextArea")

	setActive(arg_16_0.eventTF, #var_16_0 > 0)

	if #var_16_0 <= 0 then
		return
	end

	local var_16_1 = {}

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		local var_16_2 = pg.collection_template[iter_16_1] and pg.collection_template[iter_16_1].title or ""

		table.insert(var_16_1, i18n("autofight_entrust", var_16_2))
	end

	setText(arg_16_0.eventTF:Find("Text"), table.concat(var_16_1, "\n"))
end

function var_0_0.onBackPressed(arg_17_0)
	existCall(arg_17_0.contextData.onClose)
	arg_17_0:closeView()
end

function var_0_0.willExit(arg_18_0)
	getProxy(ChapterAutoProxy):ClearEventIds()

	arg_18_0.contextData.onClose = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_18_0._tf)
end

return var_0_0
