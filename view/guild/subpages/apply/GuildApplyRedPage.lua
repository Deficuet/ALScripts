local var_0_0 = class("GuildApplyRedPage", import("....base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "GuildApplyRedUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.iconTF = findTF(arg_2_0._tf, "panel/frame/policy_container/input_frame/shipicon/icon"):GetComponent(typeof(Image))
	arg_2_0.circle = findTF(arg_2_0._tf, "panel/frame/policy_container/input_frame/shipicon/frame")
	arg_2_0.manifesto = findTF(arg_2_0._tf, "panel/frame/policy_container/input_frame/Text"):GetComponent(typeof(Text))
	arg_2_0.starsTF = findTF(arg_2_0._tf, "panel/frame/policy_container/input_frame/shipicon/stars")
	arg_2_0.starTF = findTF(arg_2_0._tf, "panel/frame/policy_container/input_frame/shipicon/stars/star")
	arg_2_0.applyBtn = findTF(arg_2_0._tf, "panel/frame/confirm_btn")
	arg_2_0.cancelBtn = findTF(arg_2_0._tf, "panel/frame/cancel_btn")
	arg_2_0.nameTF = findTF(arg_2_0._tf, "panel/frame/name"):GetComponent(typeof(Text))
	arg_2_0.levelTF = findTF(arg_2_0._tf, "panel/frame/info/level/Text"):GetComponent(typeof(Text))
	arg_2_0.countTF = findTF(arg_2_0._tf, "panel/frame/info/count/Text"):GetComponent(typeof(Text))
	arg_2_0.flagName = findTF(arg_2_0._tf, "panel/frame/policy_container/name/Text"):GetComponent(typeof(Text))
	arg_2_0.policyTF = findTF(arg_2_0._tf, "panel/frame/policy_container/policy/Text"):GetComponent(typeof(Text))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.applyBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			limit = 20,
			yesText = "text_confirm",
			type = MSGBOX_TYPE_INPUT,
			placeholder = i18n("guild_request_msg_placeholder"),
			title = i18n("guild_request_msg_title"),
			onYes = function(arg_5_0)
				arg_3_0:emit(JoinGuildMediator.APPLY, arg_3_0.guildVO.id, arg_5_0)
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_7_0, arg_7_1)
	arg_7_0.guildVO = arg_7_1

	arg_7_0:UpdateApplyPanel()
	pg.UIMgr.GetInstance():BlurPanel(arg_7_0._tf)
	var_0_0.super.Show(arg_7_0)
end

function var_0_0.UpdateApplyPanel(arg_8_0)
	local var_8_0 = arg_8_0.guildVO
	local var_8_1 = Ship.New({
		configId = var_8_0:getCommader().icon
	})

	LoadSpriteAsync("QIcon/" .. var_8_1:getPainting(), function(arg_9_0)
		arg_8_0.iconTF.sprite = arg_9_0
	end)

	local var_8_2 = pg.ship_data_statistics[var_8_1.configId]

	arg_8_0.manifesto.text = var_8_0.manifesto

	local var_8_3 = arg_8_0.starsTF.childCount

	for iter_8_0 = var_8_3, var_8_2.star - 1 do
		cloneTplTo(arg_8_0.starTF, arg_8_0.starsTF)
	end

	for iter_8_1 = 1, var_8_3 do
		local var_8_4 = arg_8_0.starsTF:GetChild(iter_8_1 - 1)

		setActive(var_8_4, iter_8_1 <= var_8_2.star)
	end

	arg_8_0.nameTF.text = var_8_0.name
	arg_8_0.levelTF.text = var_8_0.level < 9 and "0" .. var_8_0.level or var_8_0.level
	arg_8_0.countTF.text = var_8_0.memberCount .. "/" .. var_8_0:getMaxMember()
	arg_8_0.flagName.text = var_8_0:getCommader().name
	arg_8_0.policyTF.text = var_8_0:getPolicyName()

	local var_8_5 = var_8_0:getCommader()
	local var_8_6 = AttireFrame.attireFrameRes(var_8_5, var_8_5.id == getProxy(PlayerProxy):getRawData().id, AttireConst.TYPE_ICON_FRAME, var_8_5.propose)

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. var_8_6, var_8_6, true, function(arg_10_0)
		if IsNil(arg_8_0._tf) then
			return
		end

		if arg_8_0.circle then
			arg_10_0.name = var_8_6
			findTF(arg_10_0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

			setParent(arg_10_0, arg_8_0.circle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. var_8_6, var_8_6, arg_10_0)
		end
	end)
end

function var_0_0.Hide(arg_11_0)
	var_0_0.super.Hide(arg_11_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0._tf, arg_11_0._parentTf)

	if arg_11_0.circle.childCount > 0 then
		local var_11_0 = arg_11_0.circle:GetChild(0).gameObject

		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. var_11_0.name, var_11_0.name, var_11_0)
	end
end

function var_0_0.OnDestroy(arg_12_0)
	if arg_12_0:isShowing() then
		arg_12_0:Hide()
	end
end

return var_0_0
