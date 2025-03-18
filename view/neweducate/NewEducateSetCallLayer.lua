local var_0_0 = class("NewEducateSetCallLayer", import("view.newEducate.base.NewEducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateSetCallUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.initData(arg_3_0)
	arg_3_0.defaultName = i18n("child_default_callname")
	arg_3_0.lockNamed = PLATFORM_CODE == PLATFORM_CH and LOCK_NAMED
end

function var_0_0.findUI(arg_4_0)
	arg_4_0.bgTF = arg_4_0:findTF("Image")
	arg_4_0.blurPanel = arg_4_0:findTF("bg")
	arg_4_0.callInput = arg_4_0:findTF("bg/panel/input/nickname")
	arg_4_0.sureBtn = arg_4_0:findTF("bg/panel/sure_button")

	setText(arg_4_0:findTF("Image", arg_4_0.sureBtn), i18n("word_ok"))
	setText(arg_4_0:findTF("Placeholder", arg_4_0.callInput), i18n("child_callname_tip"))

	arg_4_0.callInput:GetComponent(typeof(InputField)).interactable = not arg_4_0.lockNamed

	setActive(arg_4_0:findTF("bg/panel/input/pan"), not arg_4_0.lockNamed)
end

function var_0_0.addListener(arg_5_0)
	onButton(arg_5_0, arg_5_0.sureBtn, function()
		local var_6_0 = getInputText(arg_5_0.callInput)

		if var_6_0 == "" then
			return
		end

		if not nameValidityCheck(var_6_0, 4, 14, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"login_newPlayerScene_invalideName"
		}) then
			return
		end

		arg_5_0:emit(NewEducateSetCallediator.ON_SET_CALL, var_6_0)
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_7_0)
	local var_7_0 = arg_7_0.contextData.char:getConfig("name_background")

	setImageSprite(arg_7_0.bgTF, LoadSprite("bg/" .. var_7_0), false)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_7_0.blurPanel, {
		pbList = {
			arg_7_0.blurPanel
		},
		groupName = LayerWeightConst.GROUP_EDUCATE,
		weight = arg_7_0:getWeightFromData() + 1
	})
	setInputText(arg_7_0.callInput, arg_7_0.defaultName)
end

function var_0_0.onBackPressed(arg_8_0)
	return
end

function var_0_0.willExit(arg_9_0)
	local var_9_0 = arg_9_0.contextData.callback

	if var_9_0 then
		var_9_0()
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_9_0.blurPanel, arg_9_0._tf)
end

return var_0_0
