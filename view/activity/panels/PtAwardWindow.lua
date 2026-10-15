local var_0_0 = class("PtAwardWindow")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._tf = arg_1_1
	arg_1_0.binder = arg_1_2
	arg_1_0.scrollPanel = arg_1_0._tf:Find("window/panel")
	arg_1_0.UIlist = UIItemList.New(arg_1_0._tf:Find("window/panel/list"), arg_1_0._tf:Find("window/panel/list/item"))
	arg_1_0.ptTF = arg_1_0._tf:Find("window/pt")
	arg_1_0.totalTxt = arg_1_0._tf:Find("window/pt/Text"):GetComponent(typeof(Text))
	arg_1_0.totalTitleTxt = arg_1_0._tf:Find("window/pt/title"):GetComponent(typeof(Text))
	arg_1_0.totalTitleIcon = arg_1_0._tf:Find("window/pt/icon/image"):GetComponent(typeof(Image))
	arg_1_0.closeBtn = arg_1_0._tf:Find("window/top/btnBack")
	arg_1_0.ptIcon = arg_1_0._tf:Find("window/pt/icon")
	arg_1_0.getBtn = arg_1_0._tf:Find("window/btn_get")

	onButton(arg_1_0.binder, arg_1_0._tf, function()
		arg_1_0:Hide()
	end, SFX_PANEL)
	onButton(arg_1_0.binder, arg_1_0.closeBtn, function()
		arg_1_0:Hide()
	end, SFX_PANEL)
	onButton(arg_1_0.binder, arg_1_0.getBtn, function()
		if not arg_1_0.ptData or arg_1_0.ptData:GetMaxAvailableTargetIndex() == arg_1_0.ptData:GetLevel() then
			return
		end

		local var_4_0 = {}
		local var_4_1 = getProxy(PlayerProxy):getRawData()
		local var_4_2 = pg.gameset.urpt_chapter_max.description[1]
		local var_4_3 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_4_2)
		local var_4_4 = arg_1_0.ptData:GetAllAvailableAwards()
		local var_4_5, var_4_6 = Task.StaticJudgeOverflow(var_4_1.gold, var_4_1.oil, var_4_3, true, true, var_4_4)

		if var_4_5 then
			table.insert(var_4_0, function(arg_5_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_4_6,
					onYes = arg_5_0
				})
			end)
		end

		seriesAsync(var_4_0, function()
			local var_6_0 = arg_1_0.ptData:GetCurrTarget()

			arg_1_0.binder:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 4,
				activity_id = arg_1_0.ptData:GetId(),
				arg1 = var_6_0,
				callback = function()
					arg_1_0:Refresh()
				end
			})
		end)
	end, SFX_PANEL)
end

function var_0_0.UpdateList(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	assert(#arg_8_1 == #arg_8_2)
	arg_8_0.UIlist:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_8_1[arg_9_1 + 1]
			local var_9_1 = arg_8_2[arg_9_1 + 1]
			local var_9_2 = GetPerceptualSize(arg_8_0.resTitle)

			setText(arg_9_2:Find("title/Text"), "PHASE " .. arg_9_1 + 1)
			setText(arg_9_2:Find("target/Text"), var_9_1)

			if arg_9_2:Find("target/icon") then
				if arg_8_0.resIcon == "" then
					arg_8_0.resIcon = nil
				end

				if arg_8_0.resIcon then
					LoadImageSpriteAsync(arg_8_0.resIcon, arg_9_2:Find("target/icon"), false)
				end

				setActive(arg_9_2:Find("target/icon"), arg_8_0.resIcon)
				setActive(arg_9_2:Find("target/mark"), arg_8_0.resIcon)
			end

			setText(arg_9_2:Find("target/title"), arg_8_0.resTitle)

			local var_9_3 = Drop.Create(var_9_0)

			updateDrop(arg_9_2:Find("award"), var_9_3, {
				hideName = true
			})
			onButton(arg_8_0.binder, arg_9_2:Find("award"), function()
				arg_8_0.binder:emit(BaseUI.ON_DROP, var_9_3)
			end, SFX_PANEL)
			setActive(arg_9_2:Find("award/mask"), arg_9_1 + 1 <= arg_8_3)

			if not IsNil(arg_9_2:Find("mask")) then
				if arg_8_4 then
					local var_9_4 = pg.TimeMgr.GetInstance()
					local var_9_5 = arg_8_4[arg_9_1 + 1]

					setActive(arg_9_2:Find("mask"), var_9_5 > var_9_4:GetServerTime())

					local var_9_6 = var_9_4:STimeDescS(var_9_5, "%m")
					local var_9_7 = var_9_4:STimeDescS(var_9_5, "%d")

					setText(arg_9_2:Find("mask/Text"), i18n("unlock_date_tip", var_9_6, var_9_7))
				else
					setActive(arg_9_2:Find("mask"), false)
				end
			end
		end
	end)
	arg_8_0.UIlist:align(#arg_8_1)
	scrollTo(arg_8_0.scrollPanel, 0, 1 - arg_8_3 * 166 / (#arg_8_2 * 166 + 20 - 570))
end

function var_0_0.Show(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.dropList
	local var_11_1 = arg_11_1.targets
	local var_11_2 = arg_11_1.level
	local var_11_3 = arg_11_1.count
	local var_11_4 = arg_11_1.resDrop
	local var_11_5 = arg_11_1.type

	arg_11_0.blur = arg_11_1.blur

	local var_11_6 = arg_11_1.unlockStamps

	arg_11_0.ptActId = arg_11_1.ptActId
	arg_11_0.resIcon = nil

	arg_11_0:UpdateTitle(var_11_5)
	arg_11_0:updateResIcon(arg_11_1.resDrop, arg_11_1.type)
	arg_11_0:UpdateList(var_11_0, var_11_1, var_11_2, var_11_6)

	arg_11_0.totalTxt.text = var_11_3
	arg_11_0.totalTitleTxt.text = arg_11_0.cntTitle

	Canvas.ForceUpdateCanvases()
	setActive(arg_11_0._tf, true)

	if arg_11_0.blur then
		pg.UIMgr.GetInstance():BlurPanel(arg_11_0._tf)
	end

	arg_11_0:Refresh()
end

function var_0_0.UpdateTitle(arg_12_0, arg_12_1)
	local var_12_0 = ""

	switch(arg_12_1, {
		function()
			arg_12_0.resTitle, arg_12_0.cntTitle = i18n("target_get_tip"), i18n("pt_total_count", var_12_0)
			arg_12_0.cntTitle = string.gsub(arg_12_0.cntTitle, "：", "")
		end,
		function()
			arg_12_0.resTitle, arg_12_0.cntTitle = i18n("pt_cosume", var_12_0), i18n("pt_total_count", i18n("pt_cosume", var_12_0))
			arg_12_0.cntTitle = string.gsub(arg_12_0.cntTitle, "：", "")
		end,
		function()
			arg_12_0.resTitle, arg_12_0.cntTitle = i18n("pt_ship_goal"), i18n("pt_ship_now")
		end,
		function()
			arg_12_0.resTitle, arg_12_0.cntTitle = i18n("cumulative_victory_target_tip"), i18n("cumulative_victory_now_tip")
		end,
		function()
			arg_12_0.resTitle, arg_12_0.cntTitle = i18n("npcfriendly_count"), i18n("npcfriendly_total_count")
		end,
		function()
			arg_12_0.resTitle, arg_12_0.cntTitle = i18n("activity_yanhua_tip2"), i18n("activity_yanhua_tip3")
		end,
		[9] = 2,
		[8] = 1
	}, function()
		arg_12_0.resTitle, arg_12_0.cntTitle = i18n("target_get_tip"), i18n("pt_total_count", var_12_0)
		arg_12_0.cntTitle = string.gsub(arg_12_0.cntTitle, "：", "")
	end)
end

local var_0_1 = {
	nil,
	true,
	false,
	false,
	false,
	false
}

function var_0_0.updateResIcon(arg_20_0, arg_20_1, arg_20_2)
	if defaultValue(var_0_1[arg_20_2], true) then
		arg_20_0.resIcon = arg_20_1:getIcon()
	end

	setActive(arg_20_0.ptIcon, arg_20_0.resIcon)

	if arg_20_0.resIcon then
		LoadImageSpriteAsync(arg_20_0.resIcon, arg_20_0.totalTitleIcon, false)
	end
end

function var_0_0.Refresh(arg_21_0)
	if arg_21_0.ptActId then
		local var_21_0 = getProxy(ActivityProxy):getActivityById(arg_21_0.ptActId)

		if not arg_21_0.ptData then
			arg_21_0.ptData = ActivityPtData.New(var_21_0)
		else
			arg_21_0.ptData:Update(var_21_0)
		end

		setActive(arg_21_0.getBtn:Find("off"), arg_21_0.ptData:GetMaxAvailableTargetIndex() == arg_21_0.ptData:GetLevel())
		setActive(arg_21_0.getBtn:Find("on"), arg_21_0.ptData:GetMaxAvailableTargetIndex() ~= arg_21_0.ptData:GetLevel())
	end
end

function var_0_0.Hide(arg_22_0)
	if arg_22_0.blur then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_22_0._tf)
	end

	setActive(arg_22_0._tf, false)
end

function var_0_0.Dispose(arg_23_0)
	arg_23_0:Hide()
	removeOnButton(arg_23_0._tf)
	removeOnButton(arg_23_0.closeBtn)
end

return var_0_0
