local var_0_0 = class("MetaPTGetPreviewLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "MetaPTGetPreviewUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initUITextTips()
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.willExit(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)
end

function var_0_0.initUITextTips(arg_5_0)
	local var_5_0 = arg_5_0._tf:Find("Panel/BG/TitleText")

	setText(var_5_0, i18n("meta_pt_get_way"))
end

function var_0_0.initData(arg_6_0)
	return
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.bg = arg_7_0._tf:Find("BG")
	arg_7_0.panelTF = arg_7_0._tf:Find("Panel")
	arg_7_0.bossBtn = arg_7_0.panelTF:Find("BossTip")
	arg_7_0.taskBtn = arg_7_0.panelTF:Find("TaskTip")
	arg_7_0.resetBtn = arg_7_0.panelTF:Find("ResetTip")
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.bg, function()
		arg_8_0:closeView()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.panelTF, function()
		arg_8_0:closeView()
	end, SFX_PANEL)

	local function var_8_0()
		local var_11_0 = getProxy(ContextProxy):getContextByMediator(MetaCharacterMediator)
		local var_11_1 = pg.m02:retrieveMediator("MetaCharacterMediator")

		var_11_0.data.lastPageIndex = var_11_1.viewComponent.curPageIndex

		arg_8_0:closeView()
		arg_8_0:sendNotification(GAME.GO_SCENE, SCENE.WORLDBOSS)

		local var_11_2 = getProxy(ContextProxy):getContextByMediator(MetaCharacterSynMediator)

		if var_11_2 then
			var_11_0:removeChild(var_11_2)
		end
	end

	onButton(arg_8_0, arg_8_0.bossBtn, var_8_0, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.taskBtn, var_8_0, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.resetBtn, var_8_0, SFX_PANEL)
end

return var_0_0
