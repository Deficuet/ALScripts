local var_0_0 = class("WorldChapterAutoRewardLayer", BaseUI)

function var_0_0.getUIName(arg_1_0)
	return "WorldChapterAutoRewardUI"
end

local var_0_1 = 0.1

function var_0_0.init(arg_2_0)
	arg_2_0.window = arg_2_0._tf:Find("Window")
	arg_2_0.boxView = arg_2_0.window:Find("Layout/Box/ScrollView")

	setActive(arg_2_0.boxView, true)

	arg_2_0.emptyTip = arg_2_0.window:Find("Layout/Box/EmptyTip")
	arg_2_0.itemList = arg_2_0.boxView:Find("Content/ItemGrid")

	setText(arg_2_0.emptyTip, i18n("autofight_rewards_none"))
	setActive(arg_2_0.emptyTip, false)
	setText(arg_2_0.window:Find("Fixed/top/bg/obtain/title"), i18n("autofight_rewards"))
	setText(arg_2_0.boxView:Find("Content/Title/Text"), i18n("battle_end_subtitle1"))

	arg_2_0.buffTF = arg_2_0.boxView:Find("Content/TextArea")
	arg_2_0.eventTF = arg_2_0.boxView:Find("Content/TextArea_1")
	arg_2_0.proficiencyTF = arg_2_0.boxView:Find("Content/TextArea_2")
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
	arg_3_0:UpdateView()

	local var_3_0 = getProxy(MetaCharacterProxy):getMetaTacticsInfoOnEnd()

	if var_3_0 and #var_3_0 > 0 then
		arg_3_0.metaExpView = MetaExpView.New(arg_3_0.window:Find("Layout"), arg_3_0.event, arg_3_0.contextData)

		local var_3_1 = arg_3_0.metaExpView

		var_3_1:setData(var_3_0)
		var_3_1:Reset()
		var_3_1:Load()
		var_3_1:ActionInvoke("Show")
	end
end

function var_0_0.willExit(arg_4_0)
	arg_4_0:SkipAnim()

	if arg_4_0.metaExpView then
		arg_4_0.metaExpView:Destroy()
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)
end

function var_0_0.UpdateView(arg_5_0)
	local var_5_0 = arg_5_0.contextData

	onButton(arg_5_0, arg_5_0._tf:Find("BG"), function()
		if arg_5_0.isRewardAnimating then
			arg_5_0:SkipAnim()

			return
		end

		existCall(var_5_0.onClose)
		arg_5_0:closeView()
	end)
	setText(arg_5_0.window:Find("Fixed/ButtonExit/pic"), i18n("autofight_leave"))
	onButton(arg_5_0, arg_5_0.window:Find("Fixed/ButtonExit"), function()
		existCall(var_5_0.onClose)
		arg_5_0:closeView()
	end, SFX_CANCEL)

	local var_5_1 = {}

	setActive(arg_5_0.boxView:Find("Content/Title"), false)
	setActive(arg_5_0.itemList, false)
	setActive(arg_5_0.buffTF, false)
	setActive(arg_5_0.eventTF, false)
	setActive(arg_5_0.proficiencyTF, false)

	arg_5_0.hasRewards = #var_5_0.awards > 0

	if arg_5_0.hasRewards then
		isEmpty = false

		table.insert(var_5_1, function(arg_8_0)
			setActive(arg_5_0.boxView:Find("Content/Title"), true)
			setActive(arg_5_0.itemList, true)
			arg_8_0()
		end)

		local var_5_2 = CustomIndexLayer.Clone2Full(arg_5_0.itemList, #var_5_0.awards)

		for iter_5_0, iter_5_1 in ipairs(var_5_0.awards) do
			local var_5_3 = var_5_2[iter_5_0]

			updateDrop(var_5_3:Find("Shell/Icon"), iter_5_1)
			onButton(arg_5_0, var_5_3:Find("Shell/Icon"), function()
				arg_5_0:emit(BaseUI.ON_DROP, iter_5_1)
			end, SFX_PANEL)
		end

		arg_5_0.isRewardAnimating = true

		local var_5_4 = {}

		for iter_5_2 = 1, #var_5_0.awards do
			local var_5_5 = var_5_2[iter_5_2]

			setActive(var_5_5, false)
			table.insert(var_5_1, function(arg_10_0)
				if arg_5_0.exited then
					return
				end

				setActive(var_5_5, true)
				scrollTo(arg_5_0.boxView:Find("Content"), {
					y = 0
				})

				arg_5_0.LTid = LeanTween.delayedCall(var_0_1, System.Action(arg_10_0)).uniqueId
			end)
		end
	end

	arg_5_0.hasBuffMsg = false

	local var_5_6 = nowWorld()
	local var_5_7 = {}

	for iter_5_3, iter_5_4 in ipairs(var_5_0.buffInfos) do
		if var_5_7[iter_5_4.id] then
			-- block empty
		else
			var_5_7[iter_5_4.id] = iter_5_4.before
		end
	end

	local var_5_8 = pg.gameset.world_mapbuff_list.description
	local var_5_9 = underscore.map(var_5_8, function(arg_11_0)
		if not var_5_7[arg_11_0] then
			return 0
		else
			return var_5_6:GetGlobalBuff(arg_11_0):GetFloor() - var_5_7[arg_11_0]
		end
	end)

	if underscore.any(var_5_9, function(arg_12_0)
		return arg_12_0 ~= 0
	end) then
		arg_5_0.hasBuffMsg = true
		arg_5_0.buffMsg = i18n("autofight_effect", unpack(var_5_9))
	end

	if arg_5_0.hasBuffMsg then
		setText(arg_5_0.buffTF:Find("Text"), arg_5_0.buffMsg)
		table.insert(var_5_1, function(arg_13_0)
			setActive(arg_5_0.buffTF, true)
			arg_13_0()
		end)
	end

	seriesAsync(var_5_1, function()
		arg_5_0:SkipAnim()
	end)
end

function var_0_0.SkipAnim(arg_15_0)
	if not arg_15_0.isRewardAnimating then
		return
	end

	arg_15_0.isRewardAnimating = nil

	if arg_15_0.LTid then
		LeanTween.cancel(arg_15_0.LTid)

		arg_15_0.LTid = nil
	end

	eachChild(arg_15_0.itemList, function(arg_16_0)
		setActive(arg_16_0, true)
	end)
	setActive(arg_15_0.boxView:Find("Content/Title"), arg_15_0.hasRewards)
	setActive(arg_15_0.itemList, arg_15_0.hasRewards)
	setActive(arg_15_0.buffTF, arg_15_0.hasBuffMsg)
	arg_15_0:UpdateEvent()
	setActive(arg_15_0.proficiencyTF, arg_15_0.contextData.proficiency > 0)

	if arg_15_0.contextData.proficiency > 0 then
		setText(arg_15_0.proficiencyTF:Find("Text"), i18n("auto_battle_end_exp", arg_15_0.contextData.proficiency))
	end
end

function var_0_0.UpdateEvent(arg_17_0)
	local var_17_0 = getProxy(ChapterAutoProxy):GetNewEventIds()

	setActive(arg_17_0.eventTF, #var_17_0 > 0)

	if #var_17_0 <= 0 then
		return
	end

	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		local var_17_2 = pg.collection_template[iter_17_1] and pg.collection_template[iter_17_1].title or ""

		table.insert(var_17_1, i18n("autofight_entrust", var_17_2))
	end

	setText(arg_17_0.eventTF:Find("Text"), table.concat(var_17_1, "\n"))
end

return var_0_0
