local var_0_0 = class("DreamlandFullPreviewScene", import(".FullPreviewSceneTemplate"))

var_0_0.MINIGAME_ID = 66

function var_0_0.getUIName(arg_1_0)
	return "DreamlandFullPreviewUI"
end

function var_0_0.init(arg_2_0)
	local var_2_0 = arg_2_0:findTF("btns")

	arg_2_0.dreamlandBtn = arg_2_0:findTF("dreamland", var_2_0)
	arg_2_0.skinBtn = arg_2_0:findTF("skin", var_2_0)
	arg_2_0.buildBtn = arg_2_0:findTF("build", var_2_0)
	arg_2_0.battleBtn = arg_2_0:findTF("battle", var_2_0)
	arg_2_0.minigameBtn = arg_2_0:findTF("minigame", var_2_0)

	setText(arg_2_0:findTF("top/info/Text"), i18n("dreamland_main_desc"))

	arg_2_0.preActId = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_DREAMLAND):getConfig("config_client").preActID

	local var_2_1 = underscore.flatten(pg.activity_template[arg_2_0.preActId].config_data)

	arg_2_0.taskId = var_2_1[#var_2_1]
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0:findTF("top/back"), function()
		arg_3_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0:findTF("top/home"), function()
		arg_3_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0:findTF("top/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.dreamland_main_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.dreamlandBtn, function()
		if arg_3_0.isFinishPre then
			arg_3_0:emit(FullPreviewMediatorTemplate.GO_SCENE, SCENE.DREAMLAND)
		else
			arg_3_0:emit(FullPreviewMediatorTemplate.GO_SCENE, SCENE.ACTIVITY, {
				id = arg_3_0.preActId
			})
		end
	end, SFX_PANEL)
	arg_3_0:BindSkinShop(arg_3_0.skinBtn)
	arg_3_0:BindBuildShip(arg_3_0.buildBtn)
	arg_3_0:BindBattle(arg_3_0.battleBtn)
	arg_3_0:BindMiniGame(arg_3_0.minigameBtn, var_0_0.MINIGAME_ID)
	arg_3_0:UpdateView()
end

function var_0_0.IsFinishPreAct(arg_8_0)
	local var_8_0 = getProxy(TaskProxy)
	local var_8_1 = var_8_0:getTaskById(arg_8_0.taskId) or var_8_0:getFinishTaskById(arg_8_0.taskId)

	return var_8_1 and var_8_1:getTaskStatus() == 2
end

function var_0_0.UpdateView(arg_9_0)
	setActive(arg_9_0:findTF("tip", arg_9_0.minigameBtn), var_0_0.MiniGameTip())
	setActive(arg_9_0:findTF("dreamland/tip", arg_9_0.dreamlandBtn), var_0_0.DreamlandTip())

	arg_9_0.isFinishPre = arg_9_0:IsFinishPreAct()

	setActive(arg_9_0:findTF("dreamland", arg_9_0.dreamlandBtn), arg_9_0.isFinishPre)
	setActive(arg_9_0:findTF("pre_act", arg_9_0.dreamlandBtn), not arg_9_0.isFinishPre)

	local var_9_0 = getProxy(ActivityProxy):getActivityById(arg_9_0.preActId)

	setActive(arg_9_0:findTF("pre_act/tip", arg_9_0.dreamlandBtn), var_0_0.ActivityTip(var_9_0))
end

function var_0_0.MiniGameTip()
	return var_0_0.IsMiniGameTip(var_0_0.MINIGAME_ID)
end

function var_0_0.DreamlandTip()
	local var_11_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_DREAMLAND)
	local var_11_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_HOTSPRING_2)

	return DreamlandData.New(var_11_0, var_11_1):ExistAnyMapOrExploreAward()
end

function var_0_0.ActivityTip(arg_12_0)
	if not arg_12_0 or arg_12_0:isEnd() then
		return false
	end

	local var_12_0 = getProxy(TaskProxy)
	local var_12_1 = underscore.flatten(arg_12_0:getConfig("config_data"))
	local var_12_2 = arg_12_0.data3
	local var_12_3 = var_12_1[var_12_2]
	local var_12_4 = var_12_0:getTaskById(var_12_3) or var_12_0:getFinishTaskById(var_12_3)
	local var_12_5 = math.min(arg_12_0:getDayIndex(), #var_12_1) - var_12_2

	if var_12_4:getTaskStatus() == 1 then
		var_12_5 = var_12_5 + 1
	end

	return var_12_5 > 0
end

function var_0_0.IsShowMainTip(arg_13_0)
	return var_0_0.MiniGameTip() or var_0_0.DreamlandTip()
end

return var_0_0
