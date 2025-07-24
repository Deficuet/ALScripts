local var_0_0 = class("AterialYumiaCoreBuffLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AterialYumiaCoreBuffLayer"
end

function var_0_0.SetActivity(arg_2_0, arg_2_1)
	arg_2_0.activity = arg_2_1
	arg_2_0.config = arg_2_1:getConfig("config_client").core_tasks
end

function var_0_0.init(arg_3_0)
	arg_3_0.rtBg = arg_3_0._tf:Find("bg")
	arg_3_0.btnReturn = arg_3_0._tf:Find("adapt/bottom/btn_return")

	onButton(arg_3_0, arg_3_0.btnReturn, function()
		if arg_3_0.inAnim then
			return
		end

		arg_3_0.inAnim = true

		quickPlayAnimation(arg_3_0._tf, "Anim_AteriaYumiaCoreBuffLayer_Out")
	end, SFX_CANCEL)

	arg_3_0.rtUpgrade = arg_3_0._tf:Find("upgrade")

	setActive(arg_3_0.rtUpgrade, false)
	onButton(arg_3_0, arg_3_0.rtUpgrade:Find("top/btn_back"), function()
		if arg_3_0.inAnim then
			return
		end

		arg_3_0.inAnim = true

		quickPlayAnimation(arg_3_0.rtUpgrade, "Anim_AteriaYumiaCoreBuffLayer_upgrade_Out")
	end, SFX_CANCEL)
	arg_3_0.rtUpgrade:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		arg_3_0.inAnim = false

		pg.UIMgr.GetInstance():UnblurPanel(arg_3_0.rtUpgrade, arg_3_0._tf)
		setActive(arg_3_0.rtUpgrade, false)
	end)
	arg_3_0._tf:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
		arg_3_0.inAnim = false

		arg_3_0:closeView()
	end)
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:UpdateView()
end

function var_0_0.UpdateView(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.config) do
		local var_9_0 = {}

		for iter_9_2, iter_9_3 in ipairs(iter_9_1) do
			local var_9_1 = getProxy(TaskProxy):getTaskVO(iter_9_3)

			if var_9_1 and var_9_1:isReceive() then
				table.insert(var_9_0, var_9_1)
			end
		end

		local var_9_2 = #var_9_0
		local var_9_3 = arg_9_0.rtBg:Find(tostring(iter_9_0))

		setText(var_9_3:Find("name/Text"), i18n("yumia_buff_name_" .. iter_9_0))
		setText(var_9_3:Find("name/level"), string.format("LV.<size=30>%s</size>", var_9_2))
		UIItemList.StaticAlign(var_9_3:Find("buffs"), var_9_3:Find("buffs/tpl"), #var_9_0, function(arg_10_0, arg_10_1, arg_10_2)
			arg_10_1 = arg_10_1 + 1

			if arg_10_0 == UIItemList.EventUpdate then
				local var_10_0 = Drop.Create(var_9_0[arg_10_1]:getConfig("award_display")[1])

				GetImageSpriteFromAtlasAsync(var_10_0:getIcon(), "", arg_10_2, false)
			end
		end)
		onButton(arg_9_0, var_9_3, function()
			arg_9_0:ShowUpgrade(iter_9_0)
			pg.UIMgr.GetInstance():BlurPanel(arg_9_0.rtUpgrade)
			setActive(arg_9_0.rtUpgrade, true)

			for iter_11_0 = 1, 4 do
				local var_11_0 = arg_9_0.rtUpgrade:Find("main/ring"):Find("lv" .. iter_11_0)

				setCanvasGroupAlpha(var_11_0, 0)

				local var_11_1 = {}

				if iter_11_0 > 1 then
					table.insert(var_11_1, function(arg_12_0)
						onDelayTick(arg_12_0, (iter_11_0 - 1) * 0.08)
					end)
				end

				seriesAsync(var_11_1, function()
					quickPlayAnimation(var_11_0, string.format("Anim_AteriaYumiaCoreBuffLayer_lv%d_In", iter_11_0))
				end)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.ShowUpgrade(arg_14_0, arg_14_1, arg_14_2)
	arg_14_1 = arg_14_1 or arg_14_0.index
	arg_14_0.index = arg_14_1

	local var_14_0 = arg_14_0.config[arg_14_1]
	local var_14_1 = 0

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		local var_14_2 = getProxy(TaskProxy):getTaskVO(iter_14_1)
		local var_14_3 = arg_14_0.rtUpgrade:Find("main/ring"):Find("lv" .. iter_14_0)
		local var_14_4 = var_14_2:isReceive()

		if var_14_4 then
			var_14_1 = iter_14_0

			local var_14_5 = Drop.Create(var_14_2:getConfig("award_display")[1])

			GetImageSpriteFromAtlasAsync(var_14_5:getIcon(), "", var_14_3:Find("active/icon"), false)
			setText(var_14_3:Find("active/icon/name"), var_14_5:getName())
			setText(var_14_3:Find("active/icon/Text"), var_14_5.desc)
		else
			setText(var_14_3:Find("inactive/Text"), i18n("yumia_buff_4", iter_14_0))
		end

		if arg_14_2 and not isActive(var_14_3:Find("active")) and var_14_4 then
			quickPlayAnimation(var_14_3, "Anim_AteriaYumiaCoreBuffLayer_active")
		end

		setActive(var_14_3:Find("active"), var_14_4)
		setActive(var_14_3:Find("inactive"), not var_14_4)
	end

	local var_14_6 = arg_14_0.rtUpgrade:Find("main/content")

	setText(var_14_6:Find("icon/core_name"), i18n("yumia_buff_name_" .. arg_14_1))
	setText(var_14_6:Find("icon/desc"), i18n("yumia_buff_desc_" .. arg_14_1))

	if arg_14_2 then
		var_14_6:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
			setText(var_14_6:Find("icon/level"), string.format("LV.<size=50><color=#ffffff00>%s</color></size>", var_14_1))
			setText(var_14_6:Find("icon/level/number"), string.format("<size=50>%s</size>", var_14_1))
			onNextTick(function()
				setCanvasGroupAlpha(var_14_6:Find("icon/level/number"), 1)
			end)
		end)
		quickPlayAnimation(var_14_6, "Anim_AteriaYumiaCoreBuffLayer_active_Level")
	else
		setText(var_14_6:Find("icon/level"), string.format("LV.<size=50><color=#ffffff00>%s</color></size>", var_14_1))
		setText(var_14_6:Find("icon/level/number"), string.format("<size=50>%s</size>", var_14_1))
	end

	local var_14_7 = getProxy(TaskProxy):getTaskVO(var_14_0[math.min(var_14_1 + 1, #var_14_0)])
	local var_14_8 = var_14_7:getGiveDrops()

	setText(var_14_6:Find("cost/Text"), i18n("yumia_buff_1"))
	UIItemList.StaticAlign(var_14_6:Find("cost/container"), var_14_6:Find("cost/container/IconTpl"), #var_14_8, function(arg_17_0, arg_17_1, arg_17_2)
		arg_17_1 = arg_17_1 + 1

		if arg_17_0 == UIItemList.EventUpdate then
			local var_17_0 = var_14_8[arg_17_1]

			updateDrop(arg_17_2, var_17_0)
			setText(arg_17_2:Find("icon_bg/count"), string.format("%d/%d", var_17_0:getOwnedCount(), var_17_0.count))
			onButton(arg_14_0, arg_17_2, function()
				arg_14_0:emit(BaseUI.ON_DROP, var_17_0)
			end, SFX_PANEL)
			setCanvasGroupAlpha(arg_17_2, 0)

			if arg_17_1 > 1 then
				onDelayTick(function()
					quickPlayAnimation(arg_17_2, "Anim_AteriaYumiaCoreBuffLayer_tpl")
				end, 0.08 * (arg_17_1 - 1))
			else
				quickPlayAnimation(arg_17_2, "Anim_AteriaYumiaCoreBuffLayer_tpl")
			end
		end
	end)

	local var_14_9 = var_14_7:getTaskStatus()

	setActive(var_14_6:Find("btn_lock"), var_14_9 == 0)
	setText(var_14_6:Find("btn_lock/Text"), i18n("yumia_buff_2"))
	setActive(var_14_6:Find("btn_confirm"), var_14_9 == 1)
	setText(var_14_6:Find("btn_confirm/Text"), i18n("yumia_buff_2"))
	setActive(var_14_6:Find("btn_finish"), var_14_9 == 2)
	setText(var_14_6:Find("btn_finish/Text"), i18n("yumia_buff_3"))
	onButton(arg_14_0, var_14_6:Find("btn_confirm"), function()
		arg_14_0:emit(AterialYumiaCoreBuffMediator.SUBMIT_TASK, var_14_7.id)
	end, SFX_CONFIRM)
end

function var_0_0.willExit(arg_21_0)
	if isActive(arg_21_0.rtUpgrade) then
		pg.UIMgr.GetInstance():UnblurPanel(arg_21_0.rtUpgrade, arg_21_0._tf)
		setActive(arg_21_0.rtUpgrade, false)
	end
end

function var_0_0.onBackPressed(arg_22_0)
	if isActive(arg_22_0.rtUpgrade) then
		triggerButton(arg_22_0.rtUpgrade:Find("top/btn_back"))
	else
		triggerButton(arg_22_0.btnReturn)
	end
end

return var_0_0
