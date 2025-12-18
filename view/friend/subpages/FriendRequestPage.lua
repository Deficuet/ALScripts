local var_0_0 = class("FriendRequestPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "FriendRequestUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.requestPanel = arg_2_0._tf:Find("request_panel")
	arg_2_0.requestTopTF = arg_2_0._tf:Find("request_view_top")
	arg_2_0.refuseAllBtn = arg_2_0.requestTopTF:Find("refuse_all_btn")
	arg_2_0.informPanel = arg_2_0._tf:Find("inform_panel")
	arg_2_0.toggleTpl = arg_2_0.informPanel:Find("frame/window/main/Toggle")
	arg_2_0.buttonTpl = arg_2_0.informPanel:Find("frame/window/main/button")
	arg_2_0.toggleContainer = arg_2_0.informPanel:Find("frame/window/main/toggles")
	arg_2_0.confirmBtn = arg_2_0.informPanel:Find("frame/window/buttons/confirm_btn")
	arg_2_0.cancelBtn = arg_2_0.informPanel:Find("frame/window/buttons/cancel_btn")
	arg_2_0.backBtn = arg_2_0.informPanel:Find("frame/window/top/btnBack")
	arg_2_0.nameTF = arg_2_0.informPanel:Find("frame/window/name"):GetComponent(typeof(Text))

	setActive(arg_2_0.informPanel, false)
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.refuseMsgBox = FriendRefusePage.New(arg_3_0._tf, arg_3_0.event)

	onButton(arg_3_0, arg_3_0.refuseAllBtn, function()
		arg_3_0:emit(FriendMediator.REFUSE_ALL_REQUEST)
	end, SFX_PANEL)
	arg_3_0:InitInform()
end

function var_0_0.UpdateData(arg_5_0, arg_5_1)
	arg_5_0.requestVOs = arg_5_1.requestVOs or {}

	if not arg_5_0.isInit then
		arg_5_0.isInit = true

		arg_5_0:isInitRequestPage()
	else
		arg_5_0:sortRequest()
	end
end

function var_0_0.isInitRequestPage(arg_6_0)
	arg_6_0.requestItems = {}
	arg_6_0.requestRect = arg_6_0.requestPanel:Find("mask/view"):GetComponent("LScrollRect")

	function arg_6_0.requestRect.onInitItem(arg_7_0)
		arg_6_0:onInitItem(arg_7_0)
	end

	function arg_6_0.requestRect.onUpdateItem(arg_8_0, arg_8_1)
		arg_6_0:onUpdateItem(arg_8_0, arg_8_1)
	end

	arg_6_0:sortRequest()
end

function var_0_0.sortRequest(arg_9_0)
	arg_9_0.requestRect:SetTotalCount(#arg_9_0.requestVOs, -1)
end

function var_0_0.onInitItem(arg_10_0, arg_10_1)
	local var_10_0 = FriendRequestCard.New(arg_10_1)

	onButton(arg_10_0, var_10_0.acceptBtn, function()
		if var_10_0.friendVO then
			arg_10_0:emit(FriendMediator.ACCEPT_REQUEST, var_10_0.friendVO.id)
		end
	end, SFX_PANEL)
	onButton(arg_10_0, var_10_0.refuseBtn, function()
		if var_10_0.friendVO then
			arg_10_0.refuseMsgBox:ExecuteAction("Show", i18n("refuse_friend"), i18n("refuse_and_add_into_bl"), function(arg_13_0)
				arg_10_0:emit(FriendMediator.REFUSE_REQUEST, var_10_0.friendVO, arg_13_0)
			end)
		end
	end)
	onButton(arg_10_0, var_10_0.resumeBtn, function()
		arg_10_0:emit(FriendMediator.OPEN_RESUME, var_10_0.friendVO.id)
	end, SFX_PANEL)

	arg_10_0.requestItems[arg_10_1] = var_10_0
end

function var_0_0.onUpdateItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.requestItems[arg_15_2]

	if not var_15_0 then
		arg_15_0:onInitItem(arg_15_2)

		var_15_0 = arg_15_0.requestItems[arg_15_2]
	end

	local var_15_1 = arg_15_0.requestVOs[arg_15_1 + 1]

	var_15_0:update(var_15_1.player, var_15_1.timestamp, var_15_1.content)
	onButton(arg_15_0, var_15_0.reportBtn, function()
		if var_15_0.friendVO then
			arg_15_0:openInfromPanel(var_15_0.friendVO, var_15_1.content)
		end
	end)
end

function var_0_0.openInfromPanel(arg_17_0, arg_17_1, arg_17_2)
	setActive(arg_17_0.informPanel, true)
	arg_17_0:UpdateInform(arg_17_1, arg_17_2)
end

function var_0_0.closeInfromPanel(arg_18_0)
	setActive(arg_18_0.informPanel, false)
end

function var_0_0.InitInform(arg_19_0)
	local var_19_0 = require("ShareCfg.informCfg")

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		local var_19_1 = cloneTplTo(arg_19_0.toggleTpl, arg_19_0.toggleContainer)

		var_19_1:Find("Label"):GetComponent("Text").text = iter_19_1.content

		onToggle(arg_19_0, var_19_1, function(arg_20_0)
			if arg_20_0 then
				arg_19_0.informInfo = iter_19_1.content
			end
		end)
	end

	onButton(arg_19_0, arg_19_0.cancelBtn, function()
		arg_19_0:closeInfromPanel()
	end)
	onButton(arg_19_0, arg_19_0.backBtn, function()
		arg_19_0:closeInfromPanel()
	end)
end

function var_0_0.UpdateInform(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.nameTF.text = i18n("inform_player", arg_23_1.name)

	onButton(arg_23_0, arg_23_0.confirmBtn, function()
		if not arg_23_0.informInfo then
			pg.TipsMgr.GetInstance():ShowTips(i18n("inform_select_type"))

			return
		end

		arg_23_0:emit(FriendMediator.INFORM, arg_23_1.id, arg_23_0.informInfo, arg_23_2)
	end)
end

function var_0_0.OnDestroy(arg_25_0)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.requestItems or {}) do
		iter_25_1:dispose()
	end

	arg_25_0.refuseMsgBox:Destroy()
end

return var_0_0
