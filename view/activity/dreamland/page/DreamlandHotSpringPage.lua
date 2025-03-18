local var_0_0 = class("DreamlandHotSpringPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "DreamlandHotSpringUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.slots = {}
	arg_2_0.uiItemList = UIItemList.New(arg_2_0:findTF("bg/list"), arg_2_0:findTF("bg/list/tpl"))
	arg_2_0.iconList = {
		"icon_1",
		"icon_2",
		"icon_3"
	}

	setText(arg_2_0:findTF("bg/list/tpl/lock/Text"), i18n("dreamland_spring_lock_tip"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0:bind(DreamlandScene.ON_SPRING_DATA_UPDATE, function(arg_5_0, arg_5_1)
		arg_3_0:UpdateSpringActUpdate(arg_5_1.data)
	end)
	arg_3_0:InitSlots()
end

function var_0_0.UpdateSpringActUpdate(arg_6_0, arg_6_1)
	if not arg_6_0:isShowing() then
		return
	end

	arg_6_0:Flush(arg_6_1)
end

function var_0_0.InitSlots(arg_7_0)
	arg_7_0.uiItemList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			arg_7_0:UpdateSlot(arg_8_2, arg_8_1)
		end
	end)
end

function var_0_0.Show(arg_9_0, arg_9_1)
	var_0_0.super.Show(arg_9_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_9_0._tf)
	arg_9_0:Flush(arg_9_1)
end

function var_0_0.Flush(arg_10_0, arg_10_1)
	arg_10_0.shipList = arg_10_1:GetHotSpringData()

	local var_10_0 = arg_10_1:GetHotSpringMaxCnt()
	local var_10_1 = arg_10_1:GetHotSpringAddition()

	setText(arg_10_0:findTF("bg/Text"), i18n("dreamland_spring_tip", var_10_1))

	arg_10_0.gameData = arg_10_1

	arg_10_0.uiItemList:align(var_10_0)
end

function var_0_0.UpdateSlot(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.shipList[arg_11_2 + 1]
	local var_11_1 = arg_11_0.gameData:IsLockSpringSlot(arg_11_2 + 1)
	local var_11_2 = var_11_0 and var_11_0 > 0

	setActive(arg_11_1:Find("add"), not var_11_1 and not var_11_2)
	setActive(arg_11_1:Find("ship"), not var_11_1 and var_11_2)
	setActive(arg_11_1:Find("lock"), var_11_1)
	onButton(arg_11_0, arg_11_1, function()
		if var_11_1 then
			return
		end

		local var_12_0

		if var_11_2 then
			var_12_0 = getProxy(BayProxy):getShipById(var_11_0)
		end

		arg_11_0:emit(DreamlandScene.ON_SPRING_OP)

		local var_12_1 = arg_11_0.gameData:GetUnlockSpringCnt()

		arg_11_0:emit(DreamlandMediator.HOT_SPRING_OP, arg_11_2 + 1, var_12_1, var_12_0)
	end, SFX_PANEL)

	if not var_11_2 then
		return
	end

	arg_11_0:UpdateShipSlot(arg_11_1, var_11_0)
end

function var_0_0.UpdateShipSlot(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = getProxy(BayProxy):RawGetShipById(arg_13_2)
	local var_13_1 = LoadSprite("qicon/" .. var_13_0:getPrefab())

	arg_13_1:Find("ship"):GetComponent(typeof(Image)).sprite = var_13_1

	local var_13_2 = math.random(1, #arg_13_0.iconList)
	local var_13_3 = arg_13_0.iconList[var_13_2]
	local var_13_4

	var_13_4.sprite, var_13_4 = GetSpriteFromAtlas("ui/DlHotSpringUI_atlas", var_13_3), arg_13_1:Find("ship/icon"):GetComponent(typeof(Image))

	var_13_4:SetNativeSize()
end

function var_0_0.Hide(arg_14_0)
	var_0_0.super.Hide(arg_14_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_14_0._tf, arg_14_0._parentTf)
end

function var_0_0.OnDestroy(arg_15_0)
	if arg_15_0:isShowing() then
		arg_15_0:Hide()
	end
end

return var_0_0
