local var_0_0 = class("NewEducateSelectScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateSelectUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.rootTF = arg_2_0._tf:Find("root")
	arg_2_0.bgTF = arg_2_0.rootTF:Find("bg")
	arg_2_0.sureBtn = arg_2_0.rootTF:Find("window/sure_btn")

	setText(arg_2_0.sureBtn:Find("Text"), i18n("child2_enter"))

	arg_2_0.hardSureBtn = arg_2_0.rootTF:Find("window/hard_sure_btn")

	setText(arg_2_0.hardSureBtn:Find("Text"), i18n("child2_hard_enter"))

	local var_2_0 = arg_2_0.rootTF:Find("window/info")

	arg_2_0.hardTF = var_2_0:Find("hard")

	setText(arg_2_0.hardTF:Find("Text"), i18n("child2_hard"))

	arg_2_0.hardToggle = var_2_0:Find("hard/toggle")
	arg_2_0.nameTF = var_2_0:Find("name")
	arg_2_0.progressTF = var_2_0:Find("progress")
	arg_2_0.gameTF = var_2_0:Find("game")
	arg_2_0.topTF = arg_2_0.rootTF:Find("top")
	arg_2_0.contentTF = arg_2_0.rootTF:Find("window/view/content")
end

function var_0_0.InitData(arg_3_0)
	arg_3_0.infos = {}
	arg_3_0.infos[0] = getProxy(EducateProxy):GetSelectInfo()

	local var_3_0 = getProxy(NewEducateProxy)

	for iter_3_0, iter_3_1 in ipairs(pg.child2_data.all) do
		arg_3_0.infos[iter_3_1] = var_3_0:GetChar(iter_3_1):GetSelectInfo()
	end

	arg_3_0.playerID = getProxy(PlayerProxy):getRawData().id

	if NewEducateHelper.IsShowNewChildTip() then
		arg_3_0.newId = pg.child2_data.all[#pg.child2_data.all]

		NewEducateHelper.ClearShowNewChildTip()
	end
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0.topTF:Find("return_btn"), function()
		arg_4_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.topTF:Find("btns/collect"), function()
		arg_4_0:emit(NewEducateSelectMediator.GO_SUBLAYER, Context.New({
			mediator = NewEducateCollectEntranceMediator,
			viewComponent = NewEducateCollectEntranceLayer,
			data = {
				isSelect = true,
				id = arg_4_0.selectedId
			}
		}))
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.sureBtn, function()
		arg_4_0:EnterEasyMode()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.hardSureBtn, function()
		arg_4_0:EnterHardMode()
	end, SFX_PANEL)
	eachChild(arg_4_0.contentTF, function(arg_9_0)
		onToggle(arg_4_0, arg_9_0, function(arg_10_0)
			local var_10_0 = tonumber(arg_9_0.name)

			if arg_10_0 then
				PlayerPrefs.SetInt(arg_4_0:GetSelectedLocalKey(), var_10_0)

				arg_4_0.selectedId = var_10_0

				arg_4_0:UpdataInfo()
				arg_9_0:SetAsLastSibling()
			end
		end, SFX_PANEL)
	end)
	onToggle(arg_4_0, arg_4_0.hardToggle, function(arg_11_0)
		local var_11_0 = arg_11_0 and "anim_educate_select_chage" or "anim_educate_select_chage2"

		quickPlayAnimation(arg_4_0._tf:Find("root/window"), var_11_0)
		setActive(arg_4_0.hardSureBtn, arg_11_0)
		setActive(arg_4_0.sureBtn, not arg_11_0)

		local var_11_1 = arg_4_0.infos[arg_4_0.selectedId]

		setText(arg_4_0.gameTF, (arg_11_0 and i18n("child2_hard") or "") .. i18n("child2_game_cnt", var_11_1.gameCnt))
	end, SFX_PANEL)
	arg_4_0:InitData()

	local var_4_0 = arg_4_0.newId or PlayerPrefs.GetInt(arg_4_0:GetSelectedLocalKey()) or 0

	triggerToggle(arg_4_0.contentTF:Find(tostring(var_4_0)), true)
end

function var_0_0.GetSelectedLocalKey(arg_12_0)
	return NewEducateConst.NEW_EDUCATE_SELECT_ID .. "_" .. arg_12_0.playerID
end

function var_0_0.UpdataInfo(arg_13_0)
	local var_13_0 = arg_13_0.infos[arg_13_0.selectedId]

	setText(arg_13_0.nameTF, var_13_0.name)
	setText(arg_13_0.progressTF, var_13_0.progressStr)
	setImageSprite(arg_13_0.bgTF, LoadSprite("bg/" .. var_13_0.bg), false)

	local var_13_1 = arg_13_0.selectedId > 1 and var_13_0.gameCnt > 1

	setActive(arg_13_0.hardTF, var_13_1)
	triggerToggle(arg_13_0.hardToggle, var_13_1 and var_13_0.isHard)
	arg_13_0:CheckGuide(var_13_1)
end

function var_0_0.EnterEasyMode(arg_14_0)
	if arg_14_0.selectedId == 0 then
		arg_14_0:EnterScene()

		return
	end

	local var_14_0 = {}

	if arg_14_0.infos[arg_14_0.selectedId].isHard then
		table.insert(var_14_0, function(arg_15_0)
			pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_MSGBOX, {
				contentText = i18n("child2_switch_sure"),
				onConfirm = arg_15_0
			})
		end)
		table.insert(var_14_0, function(arg_16_0)
			arg_14_0:emit(NewEducateSelectMediator.SWITCH_DIFFICULTY, {
				id = arg_14_0.selectedId,
				difficulty = NewEducateChar.DIFFICULTY.EASY,
				callback = arg_16_0
			})
		end)
	end

	seriesAsync(var_14_0, function()
		arg_14_0:EnterScene()
	end)
end

function var_0_0.EnterHardMode(arg_18_0)
	if arg_18_0.selectedId == 0 then
		return
	end

	local var_18_0 = {}

	if not arg_18_0.infos[arg_18_0.selectedId].isHard then
		table.insert(var_18_0, function(arg_19_0)
			pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_MSGBOX, {
				contentText = i18n("child2_switch_sure"),
				onConfirm = arg_19_0
			})
		end)
		table.insert(var_18_0, function(arg_20_0)
			arg_18_0:emit(NewEducateSelectMediator.SWITCH_DIFFICULTY, {
				id = arg_18_0.selectedId,
				difficulty = NewEducateChar.DIFFICULTY.HARD,
				callback = arg_20_0
			})
		end)
	end

	seriesAsync(var_18_0, function()
		arg_18_0:EnterScene()
	end)
end

function var_0_0.EnterScene(arg_22_0)
	if arg_22_0.selectedId == 0 then
		arg_22_0:emit(NewEducateSelectMediator.GO_SCENE, SCENE.EDUCATE, {
			isMainEnter = true
		})
	else
		arg_22_0:emit(NewEducateSelectMediator.GO_SCENE, SCENE.NEW_EDUCATE, {
			isMainEnter = true,
			id = arg_22_0.selectedId
		})
	end
end

function var_0_0.CheckGuide(arg_23_0, arg_23_1)
	if arg_23_1 and not pg.NewStoryMgr.GetInstance():IsPlayed("tb2_19") then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = "tb2_19"
		})
		pg.NewGuideMgr.GetInstance():Play("tb2_19", {
			arg_23_0.selectedId
		})
	end
end

function var_0_0.onBackPressed(arg_24_0)
	if arg_24_0.contextData.isTb1 then
		arg_24_0:emit(NewEducateBaseUI.ON_HOME)
	else
		var_0_0.super.onBackPressed(arg_24_0)
	end
end

return var_0_0
