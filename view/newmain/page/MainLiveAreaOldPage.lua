local var_0_0 = class("MainLiveAreaOldPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "MainLiveAreaOldUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0._academyBtn = arg_2_0:findTF("school_btn")
	arg_2_0._haremBtn = arg_2_0:findTF("backyard_btn")
	arg_2_0._commanderBtn = arg_2_0:findTF("commander_btn")

	pg.redDotHelper:AddNode(RedDotNode.New(arg_2_0._haremBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.COURTYARD
	}))
	pg.redDotHelper:AddNode(SelfRefreshRedDotNode.New(arg_2_0._academyBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.SCHOOL
	}))
	pg.redDotHelper:AddNode(SelfRefreshRedDotNode.New(arg_2_0._commanderBtn:Find("tip"), {
		pg.RedDotMgr.TYPES.COMMANDER
	}))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._commanderBtn, function()
		arg_3_0:emit(NewMainMediator.GO_SCENE, SCENE.COMMANDERCAT, {
			fromMain = true,
			fleetType = CommanderCatScene.FLEET_TYPE_COMMON
		})
		arg_3_0:Hide()
	end, SFX_MAIN)
	onButton(arg_3_0, arg_3_0._haremBtn, function()
		arg_3_0:emit(NewMainMediator.GO_SCENE, SCENE.COURTYARD)
		arg_3_0:Hide()
	end, SFX_MAIN)
	onButton(arg_3_0, arg_3_0._academyBtn, function()
		arg_3_0:emit(NewMainMediator.GO_SCENE, SCENE.NAVALACADEMYSCENE)
		arg_3_0:Hide()
	end, SFX_MAIN)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_8_0)
	var_0_0.super.Show(arg_8_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_8_0._tf, {
		staticBlur = true
	})

	local var_8_0 = getProxy(PlayerProxy):getRawData()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_8_0.level, "CommanderCatMediator") then
		arg_8_0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		arg_8_0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_8_0.level, "CourtYardMediator") then
		arg_8_0._haremBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		arg_8_0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end
end

function var_0_0.Hide(arg_9_0)
	if arg_9_0:isShowing() then
		var_0_0.super.Hide(arg_9_0)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_9_0._tf, arg_9_0._parentTf)
	end
end

function var_0_0.OnDestroy(arg_10_0)
	arg_10_0:Hide()
end

return var_0_0
