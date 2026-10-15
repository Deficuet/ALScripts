local var_0_0 = class("AttireScene", import("..base.BaseUI"))

var_0_0.PAGE_ICONFRAME = 1
var_0_0.PAGE_CHATFRAME = 2
var_0_0.PAGE_ACHIEVEMENT = 3

function var_0_0.getUIName(arg_1_0)
	return "AttireUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/attireui",
		"ui/attireiconframeui",
		"ui/attirechatframeui",
		"ui/attireachievementui",
		"ui/attirecombatuiui",
		"ui/attireloadingpicui"
	}

	local function var_2_1(arg_3_0, arg_3_1)
		if noEmptyStr(arg_3_1) and not table.contains(arg_3_0, arg_3_1) then
			table.insert(arg_3_0, arg_3_1)
		end
	end

	local function var_2_2()
		local var_4_0 = getProxy(AttireProxy):getAllData()
		local var_4_1 = {}

		for iter_4_0, iter_4_1 in ipairs(pg.item_data_frame.all) do
			local var_4_2 = var_4_0.iconFrames[iter_4_1]

			if var_4_2 then
				var_2_1(var_4_1, var_4_2:getIcon())
			end
		end

		for iter_4_2, iter_4_3 in ipairs(pg.item_data_chat.all) do
			local var_4_3 = var_4_0.chatFrames[iter_4_3]

			if var_4_3 then
				var_2_1(var_4_1, var_4_3:getIcon())
			end
		end

		for iter_4_4, iter_4_5 in ipairs(pg.item_data_battleui.all) do
			local var_4_4 = var_4_0.combatUIStyles[iter_4_5]

			if var_4_4 then
				local var_4_5 = var_4_4:getConfig("icon")

				if noEmptyStr(var_4_5) then
					var_2_1(var_4_1, "combatuistyle/" .. var_4_5)
				end
			end
		end

		return var_4_1
	end

	local var_2_3 = (function()
		local var_5_0 = {}

		local function var_5_1(arg_6_0)
			if not arg_6_0 then
				return
			end

			if arg_6_0:isLoverLetter() then
				var_2_1(var_5_0, string.lower(arg_6_0:GetPrefabName()))
				table.insertto(var_5_0, ResPathSupport.GetPaintingSquareIconListByPaintingName(arg_6_0:GetPainting()))
			else
				local var_6_0 = arg_6_0:getConfig("icon")

				var_2_1(var_5_0, "medal/" .. var_6_0)
				var_2_1(var_5_0, "medal/s_" .. var_6_0)
			end
		end

		local var_5_2 = getProxy(AttireProxy):getDataAndTrophys()

		for iter_5_0, iter_5_1 in pairs(var_5_2.trophys or {}) do
			if iter_5_1:isClaimed() and not iter_5_1:isHide() then
				var_5_1(iter_5_1)
			end
		end

		for iter_5_2, iter_5_3 in ipairs(var_5_2.loveTrophys or {}) do
			if iter_5_3:isClaimed() and not iter_5_3:isHide() then
				var_5_1(iter_5_3)
			end
		end

		local var_5_3 = getProxy(PlayerProxy):getData()

		for iter_5_4, iter_5_5 in ipairs(var_5_3.displayTrophyList or {}) do
			local var_5_4 = iter_5_5 > 1000000000 and LoveLetterTrophy.New({
				id = iter_5_5
			}) or Trophy.New({
				id = iter_5_5
			})

			var_5_1(var_5_4)
		end

		return var_5_0
	end)()
	local var_2_4 = var_2_2()
	local var_2_5 = CombatPreviewLayer.PushAllResource()

	return ResPathSupport.MergeLuaArr(var_2_0, var_2_4, var_2_3, var_2_5)
end

function var_0_0.setAttires(arg_7_0, arg_7_1)
	arg_7_0.rawAttireVOs = arg_7_1

	arg_7_0:updateTips(getProxy(AttireProxy):needTip(arg_7_1))
end

function var_0_0.setPlayer(arg_8_0, arg_8_1)
	arg_8_0.playerVO = arg_8_1
end

function var_0_0.init(arg_9_0)
	arg_9_0.backBtn = arg_9_0._tf:Find("blur_panel/adapt/top/back_btn")
	arg_9_0.blurPanel = arg_9_0._tf:Find("blur_panel")
	arg_9_0.toggles = {
		arg_9_0.blurPanel:Find("adapt/left_length/frame/tagRoot/iconframe"),
		arg_9_0.blurPanel:Find("adapt/left_length/frame/tagRoot/chatframe"),
		arg_9_0.blurPanel:Find("adapt/left_length/frame/tagRoot/achievement"),
		arg_9_0.blurPanel:Find("adapt/left_length/frame/tagRoot/combatUI"),
		arg_9_0.blurPanel:Find("adapt/left_length/frame/tagRoot/loadingpic")
	}
	arg_9_0.panels = {
		AttireIconFramePanel.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData),
		AttireChatFramePanel.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData),
		AttireAchievementPanel.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData),
		AttireCombatUIPanel.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData),
		AttireLoadingPicPanel.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)
	}
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0.backBtn, function()
		arg_10_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.toggles) do
		onToggle(arg_10_0, iter_10_1, function(arg_12_0)
			if arg_12_0 then
				arg_10_0:switchPage(iter_10_0)
			end
		end, SFX_PANEL)
	end

	local var_10_0 = arg_10_0.contextData.index or var_0_0.PAGE_ICONFRAME

	triggerToggle(arg_10_0.toggles[var_10_0], true)
end

function var_0_0.switchPage(arg_13_0, arg_13_1)
	if arg_13_0.page then
		arg_13_0.panels[arg_13_0.page]:ActionInvoke("Hide")
	end

	arg_13_0.page = arg_13_1

	arg_13_0.panels[arg_13_0.page]:Load()
	arg_13_0.panels[arg_13_0.page]:ActionInvoke("Show")
	arg_13_0:updateCurrPage()
end

function var_0_0.updateCurrPage(arg_14_0)
	assert(arg_14_0.page)
	arg_14_0.panels[arg_14_0.page]:ActionInvoke("Update", arg_14_0.rawAttireVOs, arg_14_0.playerVO)
end

function var_0_0.updateTips(arg_15_0, arg_15_1)
	for iter_15_0, iter_15_1 in ipairs(arg_15_1) do
		setActive(arg_15_0.toggles[iter_15_0]:Find("tip"), iter_15_1)
	end
end

function var_0_0.onBackPressed(arg_16_0)
	if arg_16_0.panels[arg_16_0.page].onBackPressed and arg_16_0.panels[arg_16_0.page]:onBackPressed() then
		-- block empty
	else
		var_0_0.super.onBackPressed(arg_16_0)
	end
end

function var_0_0.willExit(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.panels) do
		iter_17_1:Destroy()
	end
end

return var_0_0
