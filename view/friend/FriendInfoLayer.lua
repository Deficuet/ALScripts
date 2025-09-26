local var_0_0 = class("FriendInfoLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "FriendInfoUI"
end

function var_0_0.setFriend(arg_2_0, arg_2_1)
	arg_2_0.friend = arg_2_1
end

function var_0_0.setFriendProxy(arg_3_0, arg_3_1)
	arg_3_0.friendProxy = arg_3_1
end

function var_0_0.GetBtnTags(arg_4_0)
	return {
		"OPEN_RESUME",
		"OPEND_FRIEND",
		"OPEN_BACKYARD",
		"TOGGLE_BLACK",
		"OPEN_INFORM",
		"OPEN_ISLAND_CARD"
	}
end

function var_0_0.init(arg_5_0)
	arg_5_0:OverlayPanel(arg_5_0._tf)

	arg_5_0.frame = arg_5_0:findTF("frame")
	arg_5_0.iconTF = arg_5_0:findTF("frame/left_bg/icon_bg/frame/icon"):GetComponent(typeof(Image))
	arg_5_0.starsTF = arg_5_0:findTF("frame/left_bg/icon_bg/stars")
	arg_5_0.starTF = arg_5_0:findTF("frame/left_bg/icon_bg/stars/star")
	arg_5_0.playerNameTF = arg_5_0:findTF("frame/left_bg/name_bg/Text"):GetComponent(typeof(Text))
	arg_5_0.levelTF = arg_5_0:findTF("frame/left_bg/icon_bg/lv/Text"):GetComponent(typeof(Text))
	arg_5_0.resumeEmblem = arg_5_0:findTF("frame/left_bg/emblem")
	arg_5_0.resumeRank = arg_5_0:findTF("frame/left_bg/emblem/Text"):GetComponent(typeof(Text))
	arg_5_0.informPanel = arg_5_0:findTF("inform_panel")
	arg_5_0.toggleTpl = arg_5_0:findTF("inform_panel/frame/window/main/Toggle")
	arg_5_0.buttonTpl = arg_5_0:findTF("inform_panel/frame/window/main/button")
	arg_5_0.toggleContainer = arg_5_0:findTF("inform_panel/frame/window/main/toggles")
	arg_5_0.confirmBtn = arg_5_0:findTF("frame/window/buttons/confirm_btn", arg_5_0.informPanel)
	arg_5_0.cancelBtn = arg_5_0:findTF("frame/window/buttons/cancel_btn", arg_5_0.informPanel)
	arg_5_0.backBtn = arg_5_0:findTF("inform_panel/frame/window/top/btnBack")
	arg_5_0.nameTF = arg_5_0:findTF("inform_panel/frame/window/name"):GetComponent(typeof(Text))

	if arg_5_0.contextData.pos then
		if arg_5_0.contextData.backyardView then
			local var_5_0 = arg_5_0:findTF("frame_for_backyard")

			var_5_0.position = arg_5_0.contextData.pos
			var_5_0.localPosition = Vector3(var_5_0.localPosition.x, var_5_0.localPosition.y, 0)
		else
			arg_5_0.height = arg_5_0._tf.rect.height
			arg_5_0.frame.position = arg_5_0.contextData.pos

			local var_5_1 = arg_5_0.frame.localPosition
			local var_5_2 = -1 * (arg_5_0.height / 2 - arg_5_0.frame.sizeDelta.y)
			local var_5_3 = var_5_2 >= var_5_1.y and var_5_2 or var_5_1.y

			arg_5_0.frame.localPosition = Vector3(var_5_1.x, var_5_3, 0)
		end
	end
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:Init()
	onButton(arg_6_0, arg_6_0._tf, function()
		arg_6_0:emit(var_0_0.ON_CLOSE)
	end, SOUND_BACK)
end

function var_0_0.Init(arg_8_0)
	local var_8_0 = arg_8_0.contextData.backyardView

	arg_8_0:initInfo()
	setActive(arg_8_0:findTF("frame_for_backyard"), var_8_0)
	setActive(arg_8_0:findTF("frame"), not var_8_0)

	local var_8_1

	if var_8_0 then
		var_8_1 = arg_8_0:findTF("frame_for_backyard/right_bg")
	else
		var_8_1 = arg_8_0:findTF("frame/right_bg")
	end

	arg_8_0.btnTFs = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_0:GetBtnTags()) do
		local var_8_2 = var_8_1:GetChild(iter_8_0 - 1)

		setActive(var_8_2, true)
		onButton(arg_8_0, var_8_2, function()
			if iter_8_1 == "" then
				return
			end

			if iter_8_1 == "OPEN_INFORM" then
				local var_9_0 = arg_8_0.friend.id .. arg_8_0.contextData.msg
				local var_9_1 = getProxy(ChatProxy)

				if not table.contains(var_9_1.informs, var_9_0) then
					arg_8_0:openInfromPanel()
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("chat_msg_inform"))
				end
			else
				arg_8_0:emit(FriendInfoMediator[iter_8_1])
			end
		end)

		arg_8_0.btnTFs[iter_8_0] = var_8_2
	end

	if arg_8_0.btnTFs[6] then
		setActive(arg_8_0.btnTFs[6], not LOCK_ISLAND_DISPLAY)
	end

	setActive(arg_8_0.btnTFs[5], arg_8_0.contextData.msg)
	setButtonEnabled(arg_8_0.btnTFs[2], not arg_8_0.friendProxy:isFriend(arg_8_0.friend.id))
	arg_8_0:updateBlack()

	if arg_8_0.contextData.form == NotificationLayer.FORM_BATTLE then
		setActive(arg_8_0.btnTFs[3], false)
	end

	setActive(arg_8_0:findTF("frame/left_bg", false))
end

function var_0_0.openInfromPanel(arg_10_0)
	setActive(arg_10_0.informPanel, true)

	if not arg_10_0.isInitInform then
		arg_10_0.isInitInform = true

		arg_10_0:initInform()
	end
end

function var_0_0.initInform(arg_11_0)
	arg_11_0.informInfoForBackYard = {}

	local var_11_0
	local var_11_1 = arg_11_0.contextData.backyardView

	if var_11_1 then
		arg_11_0.nameTF.text = i18n("inform_player", arg_11_0.friend.name) .. i18n("backyard_theme_inform_them", arg_11_0.contextData.msg)

		local var_11_2 = require("ShareCfg.InformForBackYardThemeTemplateCfg")

		for iter_11_0, iter_11_1 in ipairs(var_11_2) do
			local var_11_3 = cloneTplTo(arg_11_0.buttonTpl, arg_11_0.toggleContainer)

			var_11_3:Find("Label"):GetComponent("Text").text = iter_11_1.content

			local var_11_4 = false

			onButton(arg_11_0, var_11_3, function()
				var_11_4 = not var_11_4

				setActive(var_11_3:Find("Background/Checkmark"), var_11_4)

				if var_11_4 then
					table.insert(arg_11_0.informInfoForBackYard, iter_11_0)
				elseif table.contains(arg_11_0.informInfoForBackYard, iter_11_0) then
					table.removebyvalue(arg_11_0.informInfoForBackYard, iter_11_0)
				end
			end)
		end
	else
		arg_11_0.nameTF.text = i18n("inform_player", arg_11_0.friend.name)

		local var_11_5 = require("ShareCfg.informCfg")

		for iter_11_2, iter_11_3 in ipairs(var_11_5) do
			local var_11_6 = cloneTplTo(arg_11_0.toggleTpl, arg_11_0.toggleContainer)

			var_11_6:Find("Label"):GetComponent("Text").text = iter_11_3.content

			onToggle(arg_11_0, var_11_6, function(arg_13_0)
				if arg_13_0 then
					arg_11_0.informInfo = iter_11_3.content
				end
			end)
		end
	end

	onButton(arg_11_0, arg_11_0.confirmBtn, function()
		if not arg_11_0.contextData.msg then
			pg.TipsMgr.GetInstance():ShowTips(i18n("inform_chat_msg"))

			return
		end

		if var_11_1 then
			if #arg_11_0.informInfoForBackYard == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("inform_select_type"))

				return
			end

			arg_11_0:emit(FriendInfoMediator.INFORM_BACKYARD, arg_11_0.friend.id, arg_11_0.informInfoForBackYard, arg_11_0.contextData.msg, arg_11_0.friend.name)
		else
			if not arg_11_0.informInfo then
				pg.TipsMgr.GetInstance():ShowTips(i18n("inform_select_type"))

				return
			end

			arg_11_0:emit(FriendInfoMediator.INFORM, arg_11_0.friend.id, arg_11_0.informInfo, arg_11_0.contextData.msg)
		end
	end)
	onButton(arg_11_0, arg_11_0.cancelBtn, function()
		arg_11_0:closeInfromPanel()
	end)
	onButton(arg_11_0, arg_11_0.backBtn, function()
		arg_11_0:closeInfromPanel()
	end)
end

function var_0_0.closeInfromPanel(arg_17_0)
	setActive(arg_17_0.informPanel, false)

	arg_17_0.informInfo = nil
end

function var_0_0.initInfo(arg_18_0)
	assert(arg_18_0.friend, "self.friend is nil")

	local var_18_0 = pg.ship_data_statistics[arg_18_0.friend.icon]

	assert(var_18_0, "shipCfg is nil >> id ==" .. arg_18_0.friend.icon)

	local var_18_1 = pg.ship_skin_template[var_18_0.skin_id]

	assert(var_18_1, "skinCfg is nil >> id ==" .. var_18_0.skin_id)
	LoadSpriteAsync("qicon/" .. var_18_1.painting, function(arg_19_0)
		if not IsNil(arg_18_0.iconTF) then
			if not arg_19_0 then
				arg_18_0.iconTF.sprite = GetSpriteFromAtlas("heroicon/unknown", "")
			else
				arg_18_0.iconTF.sprite = arg_19_0
			end
		end
	end)

	for iter_18_0 = arg_18_0.starsTF.childCount, var_18_0.star - 1 do
		cloneTplTo(arg_18_0.starTF, arg_18_0.starsTF)
	end

	for iter_18_1 = 1, var_18_0.star do
		local var_18_2 = arg_18_0.starsTF:GetChild(iter_18_1 - 1)

		setActive(var_18_2, iter_18_1 <= var_18_0.star)
	end

	arg_18_0.playerNameTF.text = arg_18_0.friend.name
	arg_18_0.levelTF.text = arg_18_0.friend.level

	local var_18_3 = SeasonInfo.getMilitaryRank(arg_18_0.friend.score, arg_18_0.friend.rank)
	local var_18_4 = SeasonInfo.getEmblem(arg_18_0.friend.score, arg_18_0.friend.rank)

	LoadImageSpriteAsync("emblem/" .. var_18_4, arg_18_0.resumeEmblem)
end

function var_0_0.updateBlack(arg_20_0)
	local var_20_0 = arg_20_0.friendProxy:getBlackPlayerById(arg_20_0.friend.id) ~= nil

	setActive(findTF(arg_20_0.btnTFs[4], "black"), not var_20_0)
	setActive(findTF(arg_20_0.btnTFs[4], "unblack"), var_20_0)
end

function var_0_0.willExit(arg_21_0)
	return
end

return var_0_0
