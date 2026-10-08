local var_0_0 = class("NewEducateSelectScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateSelectUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/PerformUI",
		"cue/qe-ova-10.b",
		"painting/linghangyuan1_1",
		"storyicon/zhihuiguan",
		"ui/neweducatecommonui_atlas",
		"ui/neweducatescheduleui_atlas",
		"cue/story-richang-quiet.b"
	}

	local function var_2_1(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	for iter_2_0, iter_2_1 in ipairs(pg.secretary_special_ship.all) do
		local var_2_2 = pg.secretary_special_ship[iter_2_1].prefab

		if noEmptyStr(var_2_2) and not table.contains(var_2_0, "painting/" .. var_2_2) then
			var_2_1("painting/" .. var_2_2)
			var_2_1("paintingface/" .. var_2_2)
			var_2_1("squareicon/" .. var_2_2)
			var_2_1("qicon/" .. var_2_2)
		end
	end

	for iter_2_2, iter_2_3 in ipairs(pg.child2_benefit_list.all) do
		local var_2_3 = pg.child2_benefit_list[iter_2_3].item_icon
		local var_2_4 = pg.child2_benefit_list[iter_2_3].item_icon_little

		if noEmptyStr(var_2_3) and not table.contains(var_2_0, "neweducateicon/" .. var_2_3) then
			var_2_1("neweducateicon/" .. var_2_3)
		end

		if noEmptyStr(var_2_4) and not table.contains(var_2_0, "neweducateicon/" .. var_2_4) then
			var_2_1("neweducateicon/" .. var_2_4)
		end
	end

	for iter_2_4, iter_2_5 in ipairs(pg.child2_resource.all) do
		local var_2_5 = pg.child2_resource[iter_2_5].icon
		local var_2_6 = pg.child2_resource[iter_2_5].item_icon

		if noEmptyStr(var_2_5) and not table.contains(var_2_0, "neweducateicon/" .. var_2_5) then
			var_2_1("neweducateicon/" .. var_2_5)
		end

		if noEmptyStr(var_2_6) and not table.contains(var_2_0, "neweducateicon/" .. var_2_6) then
			var_2_1("neweducateicon/" .. var_2_6)
		end
	end

	for iter_2_6, iter_2_7 in ipairs(pg.child2_attr.all) do
		local var_2_7 = pg.child2_attr[iter_2_7].icon
		local var_2_8 = pg.child2_attr[iter_2_7].item_icon

		if noEmptyStr(var_2_7) and not table.contains(var_2_0, "neweducateicon/" .. var_2_7) then
			var_2_1("neweducateicon/" .. var_2_7)
		end

		if noEmptyStr(var_2_8) and not table.contains(var_2_0, "neweducateicon/" .. var_2_8) then
			var_2_1("neweducateicon/" .. var_2_8)
		end
	end

	for iter_2_8, iter_2_9 in ipairs(pg.child2_memory.all) do
		local var_2_9 = pg.child2_memory[iter_2_9].pic

		if noEmptyStr(var_2_9) and not table.contains(var_2_0, "neweducateicon/" .. var_2_9) then
			var_2_1("neweducateicon/" .. var_2_9)
		end
	end

	for iter_2_10, iter_2_11 in ipairs(pg.child2_plan.all) do
		local var_2_10 = pg.child2_plan[iter_2_11].icon_square
		local var_2_11 = pg.child2_plan[iter_2_11].plan_rectangle_2

		if noEmptyStr(var_2_10) and not table.contains(var_2_0, "neweducateicon/" .. var_2_10) then
			var_2_1("neweducateicon/" .. var_2_10)
		end

		if noEmptyStr(var_2_11) and not table.contains(var_2_0, "neweducateicon/" .. var_2_11) then
			var_2_1("neweducateicon/" .. var_2_11)
		end
	end

	for iter_2_12, iter_2_13 in ipairs(pg.child2_site_display.all) do
		local var_2_12 = pg.child2_site_display[iter_2_13].event_icon
		local var_2_13 = pg.child2_site_display[iter_2_13].event_title

		if noEmptyStr(var_2_12) and not table.contains(var_2_0, "neweducateicon/" .. var_2_12) then
			var_2_1("neweducateicon/" .. var_2_12)
		end

		if noEmptyStr(var_2_13) and not table.contains(var_2_0, "neweducateicon/" .. var_2_13) then
			var_2_1("neweducateicon/" .. var_2_13)
		end
	end

	local var_2_14 = getProxy(EducateProxy):GetSelectInfo()

	if var_2_14 and var_2_14.bg then
		var_2_1("bg/" .. var_2_14.bg)
	end

	local var_2_15 = getProxy(NewEducateProxy)

	for iter_2_14, iter_2_15 in ipairs(pg.child2_data.all) do
		local var_2_16 = var_2_15:GetChar(iter_2_15)

		if var_2_16 then
			local var_2_17 = var_2_16:GetSelectInfo()

			if var_2_17 and var_2_17.bg then
				var_2_1("bg/" .. var_2_17.bg)
			end
		end

		local var_2_18 = pg.child2_data[iter_2_15]

		if var_2_18 then
			if var_2_18.child2_data_personality_icon and #var_2_18.child2_data_personality_icon > 0 then
				for iter_2_16, iter_2_17 in ipairs(var_2_18.child2_data_personality_icon) do
					var_2_1("neweducateicon/" .. iter_2_17)
				end
			end

			if noEmptyStr(var_2_18.personality_bar_icon) then
				var_2_1("neweducateicon/" .. var_2_18.personality_bar_icon)
			end

			if var_2_18.personality_tag_icon and #var_2_18.personality_tag_icon > 0 then
				for iter_2_18, iter_2_19 in ipairs(var_2_18.personality_tag_icon) do
					for iter_2_20, iter_2_21 in ipairs(iter_2_19) do
						var_2_1("neweducateicon/" .. iter_2_21)
					end
				end
			end

			if var_2_18.spine_char then
				for iter_2_22, iter_2_23 in pairs(var_2_18.spine_char) do
					var_2_1("char/" .. iter_2_23)
				end
			end
		end
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.preload(arg_4_0, arg_4_1)
	pg.PerformMgr.GetInstance():CheckLoad(function()
		arg_4_1()
	end)
end

function var_0_0.init(arg_6_0)
	arg_6_0.rootTF = arg_6_0._tf:Find("root")
	arg_6_0.bgTF = arg_6_0.rootTF:Find("bg")
	arg_6_0.sureBtn = arg_6_0.rootTF:Find("window/sure_btn")

	setText(arg_6_0.sureBtn:Find("Text"), i18n("child2_enter"))

	arg_6_0.hardSureBtn = arg_6_0.rootTF:Find("window/hard_sure_btn")

	setText(arg_6_0.hardSureBtn:Find("Text"), i18n("child2_hard_enter"))

	local var_6_0 = arg_6_0.rootTF:Find("window/info")

	arg_6_0.hardTF = var_6_0:Find("hard")

	setText(arg_6_0.hardTF:Find("Text"), i18n("child2_hard"))

	arg_6_0.hardToggle = var_6_0:Find("hard/toggle")
	arg_6_0.nameTF = var_6_0:Find("name")
	arg_6_0.progressTF = var_6_0:Find("progress")
	arg_6_0.gameTF = var_6_0:Find("game")
	arg_6_0.topTF = arg_6_0.rootTF:Find("top")
	arg_6_0.contentTF = arg_6_0.rootTF:Find("window/view/content")
end

function var_0_0.InitData(arg_7_0)
	arg_7_0.infos = {}
	arg_7_0.infos[0] = getProxy(EducateProxy):GetSelectInfo()

	local var_7_0 = getProxy(NewEducateProxy)

	for iter_7_0, iter_7_1 in ipairs(pg.child2_data.all) do
		arg_7_0.infos[iter_7_1] = var_7_0:GetChar(iter_7_1):GetSelectInfo()
	end

	arg_7_0.playerID = getProxy(PlayerProxy):getRawData().id

	if NewEducateHelper.IsShowNewChildTip() then
		arg_7_0.newId = pg.child2_data.all[#pg.child2_data.all]

		NewEducateHelper.ClearShowNewChildTip()
	end
end

function var_0_0.didEnter(arg_8_0)
	onButton(arg_8_0, arg_8_0.topTF:Find("return_btn"), function()
		arg_8_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.topTF:Find("btns/collect"), function()
		arg_8_0:emit(NewEducateSelectMediator.GO_SUBLAYER, Context.New({
			mediator = NewEducateCollectEntranceMediator,
			viewComponent = NewEducateCollectEntranceLayer,
			data = {
				isSelect = true,
				id = arg_8_0.selectedId
			}
		}))
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.sureBtn, function()
		arg_8_0:EnterEasyMode()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.hardSureBtn, function()
		arg_8_0:EnterHardMode()
	end, SFX_PANEL)
	eachChild(arg_8_0.contentTF, function(arg_13_0)
		onToggle(arg_8_0, arg_13_0, function(arg_14_0)
			local var_14_0 = tonumber(arg_13_0.name)

			if arg_14_0 then
				PlayerPrefs.SetInt(arg_8_0:GetSelectedLocalKey(), var_14_0)

				arg_8_0.selectedId = var_14_0

				arg_8_0:UpdataInfo()
				arg_13_0:SetAsLastSibling()
			end
		end, SFX_PANEL)
	end)
	onToggle(arg_8_0, arg_8_0.hardToggle, function(arg_15_0)
		local var_15_0 = arg_15_0 and "anim_educate_select_chage" or "anim_educate_select_chage2"

		quickPlayAnimation(arg_8_0._tf:Find("root/window"), var_15_0)
		setActive(arg_8_0.hardSureBtn, arg_15_0)
		setActive(arg_8_0.sureBtn, not arg_15_0)

		local var_15_1 = arg_8_0.infos[arg_8_0.selectedId]

		setText(arg_8_0.gameTF, (arg_15_0 and i18n("child2_hard") or "") .. i18n("child2_game_cnt", var_15_1.gameCnt))
	end, SFX_PANEL)
	arg_8_0:InitData()

	local var_8_0 = arg_8_0.newId or PlayerPrefs.GetInt(arg_8_0:GetSelectedLocalKey()) or 0

	triggerToggle(arg_8_0.contentTF:Find(tostring(var_8_0)), true)
end

function var_0_0.GetSelectedLocalKey(arg_16_0)
	return NewEducateConst.NEW_EDUCATE_SELECT_ID .. "_" .. arg_16_0.playerID
end

function var_0_0.UpdataInfo(arg_17_0)
	local var_17_0 = arg_17_0.infos[arg_17_0.selectedId]

	setText(arg_17_0.nameTF, var_17_0.name)
	setText(arg_17_0.progressTF, var_17_0.progressStr)
	setImageSprite(arg_17_0.bgTF, LoadSprite("bg/" .. var_17_0.bg), false)

	local var_17_1 = arg_17_0.selectedId > 1 and var_17_0.gameCnt > 1

	setActive(arg_17_0.hardTF, var_17_1)
	triggerToggle(arg_17_0.hardToggle, var_17_1 and var_17_0.isHard)
	arg_17_0:CheckGuide(var_17_1)
end

function var_0_0.EnterEasyMode(arg_18_0)
	if arg_18_0.selectedId == 0 then
		arg_18_0:EnterScene()

		return
	end

	local var_18_0 = {}

	if arg_18_0.infos[arg_18_0.selectedId].isHard then
		table.insert(var_18_0, function(arg_19_0)
			pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_MSGBOX, {
				contentText = i18n("child2_switch_sure"),
				onConfirm = arg_19_0
			})
		end)
		table.insert(var_18_0, function(arg_20_0)
			arg_18_0:emit(NewEducateSelectMediator.SWITCH_DIFFICULTY, {
				id = arg_18_0.selectedId,
				difficulty = NewEducateChar.DIFFICULTY.EASY,
				callback = arg_20_0
			})
		end)
	end

	seriesAsync(var_18_0, function()
		arg_18_0:EnterScene()
	end)
end

function var_0_0.EnterHardMode(arg_22_0)
	if arg_22_0.selectedId == 0 then
		return
	end

	local var_22_0 = {}

	if not arg_22_0.infos[arg_22_0.selectedId].isHard then
		table.insert(var_22_0, function(arg_23_0)
			pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_MSGBOX, {
				contentText = i18n("child2_switch_sure"),
				onConfirm = arg_23_0
			})
		end)
		table.insert(var_22_0, function(arg_24_0)
			arg_22_0:emit(NewEducateSelectMediator.SWITCH_DIFFICULTY, {
				id = arg_22_0.selectedId,
				difficulty = NewEducateChar.DIFFICULTY.HARD,
				callback = arg_24_0
			})
		end)
	end

	seriesAsync(var_22_0, function()
		arg_22_0:EnterScene()
	end)
end

function var_0_0.EnterScene(arg_26_0)
	if arg_26_0.selectedId == 0 then
		arg_26_0:emit(NewEducateSelectMediator.GO_SCENE, SCENE.EDUCATE, {
			isMainEnter = true
		})
	else
		arg_26_0:emit(NewEducateSelectMediator.GO_SCENE, SCENE.NEW_EDUCATE, {
			isMainEnter = true,
			id = arg_26_0.selectedId
		})
	end
end

function var_0_0.CheckGuide(arg_27_0, arg_27_1)
	if arg_27_1 and not pg.NewStoryMgr.GetInstance():IsPlayed("tb2_19") then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = "tb2_19"
		})
		pg.NewGuideMgr.GetInstance():Play("tb2_19", {
			arg_27_0.selectedId
		})
	end
end

function var_0_0.onBackPressed(arg_28_0)
	if arg_28_0.contextData.isTb1 then
		arg_28_0:emit(NewEducateBaseUI.ON_HOME)
	else
		var_0_0.super.onBackPressed(arg_28_0)
	end
end

return var_0_0
