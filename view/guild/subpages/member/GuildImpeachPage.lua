local var_0_0 = class("GuildImpeachPage", import(".GuildMemberBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "GuildImpeachPage"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.impeachconfirmBtn = arg_2_0._tf:Find("frame/confirm_btn")
	arg_2_0.impeachcancelBtn = arg_2_0._tf:Find("frame/cancel_btn")
	arg_2_0.impeachnameTF = arg_2_0._tf:Find("frame/info/name/Text"):GetComponent(typeof(Text))
	arg_2_0.impeachiconTF = arg_2_0._tf:Find("frame/info/shipicon/icon"):GetComponent(typeof(Image))
	arg_2_0.impeachduty = arg_2_0._tf:Find("frame/duty"):GetComponent(typeof(Image))
	arg_2_0.impeachstarsTF = arg_2_0._tf:Find("frame/info/shipicon/stars")
	arg_2_0.impeachstarTF = arg_2_0._tf:Find("frame/info/shipicon/stars/star")
	arg_2_0.impeachlevelTF = arg_2_0._tf:Find("frame/info/level/Text"):GetComponent(typeof(Text))
	arg_2_0.circle = arg_2_0._tf:Find("frame/info/shipicon/frame")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.impeachcancelBtn, function()
		arg_3_0:Hide()
	end, SFX_CONFIRM)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_CONFIRM)
end

function var_0_0.OnShow(arg_6_0)
	local var_6_0 = arg_6_0.guildVO
	local var_6_1 = arg_6_0.playerVO
	local var_6_2 = arg_6_0.memberVO

	arg_6_0.impeachnameTF.text = var_6_2.name

	local var_6_3 = AttireFrame.attireFrameRes(var_6_2, var_6_2.id == getProxy(PlayerProxy):getRawData().id, AttireConst.TYPE_ICON_FRAME, var_6_2.propose)

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. var_6_3, var_6_3, true, function(arg_7_0)
		if IsNil(arg_6_0._tf) then
			return
		end

		if arg_6_0.cirCle then
			arg_7_0.name = var_6_3
			findTF(arg_7_0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

			setParent(arg_7_0, arg_6_0.cirCle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. var_6_3, var_6_3, arg_7_0)
		end
	end)

	local var_6_4 = pg.ship_data_statistics[var_6_2.icon]
	local var_6_5 = Ship.New({
		configId = var_6_2.icon,
		skin_id = var_6_2.skinId
	})

	LoadSpriteAsync("qicon/" .. var_6_5:getPainting(), function(arg_8_0)
		if not IsNil(arg_6_0.impeachiconTF) then
			arg_6_0.impeachiconTF.sprite = arg_8_0
		end
	end)

	local var_6_6 = GetSpriteFromAtlas("dutyicon", "icon_" .. var_6_2.duty)

	arg_6_0.impeachduty.sprite = var_6_6

	local var_6_7 = arg_6_0.impeachstarsTF.childCount

	for iter_6_0 = var_6_7, var_6_4.star - 1 do
		cloneTplTo(arg_6_0.impeachstarTF, arg_6_0.impeachstarsTF)
	end

	for iter_6_1 = 1, var_6_7 do
		local var_6_8 = arg_6_0.impeachstarsTF:GetChild(iter_6_1 - 1)

		setActive(var_6_8, iter_6_1 <= var_6_4.star)
	end

	arg_6_0.impeachlevelTF.text = "Lv." .. var_6_2.level

	onButton(arg_6_0, arg_6_0.impeachconfirmBtn, function()
		if var_6_2.id == var_6_1.id then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_impeach_tip"),
			onYes = function()
				arg_6_0:emit(GuildMemberMediator.IMPEACH, var_6_2.id)
				arg_6_0:Hide()
			end
		})
	end, SFX_CONFIRM)
end

return var_0_0
