local var_0_0 = class("ChildishnessSchoolPtPage", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ChildishnessSchoolPtPage"
end

function var_0_0.init(arg_2_0)
	arg_2_0.bg = arg_2_0._tf:Find("bg")
	arg_2_0.scrollPanel = arg_2_0._tf:Find("window/panel")
	arg_2_0.UIlist = UIItemList.New(arg_2_0._tf:Find("window/panel/list"), arg_2_0._tf:Find("window/panel/list/item"))
	arg_2_0.ptTF = arg_2_0._tf:Find("window/top/pt")
	arg_2_0.totalTxt = arg_2_0._tf:Find("window/top/pt/Text"):GetComponent(typeof(Text))
	arg_2_0.closeBtn = arg_2_0._tf:Find("window/top/btnBack")
	arg_2_0.getBtn = arg_2_0._tf:Find("window/btn_get")
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0.anim:Play("anim_kinder_schoolPT_out")
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.bg, function()
		arg_3_0.anim:Play("anim_kinder_schoolPT_out")
	end, SFX_PANEL)
	arg_3_0:Show()

	arg_3_0.anim = arg_3_0._tf:GetComponent(typeof(Animation))
	arg_3_0.animEvent = arg_3_0.anim:GetComponent(typeof(DftAniEvent))

	arg_3_0.animEvent:SetEndEvent(function()
		arg_3_0:closeView()
	end)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.Show(arg_7_0)
	arg_7_0:UpdatePtData()

	local var_7_0 = arg_7_0.ptData.dropList
	local var_7_1 = arg_7_0.ptData.targets
	local var_7_2 = arg_7_0.ptData.level
	local var_7_3 = arg_7_0.ptData.count

	arg_7_0:updateResIcon(arg_7_0.ptData.resId, arg_7_0.ptData.resIcon, arg_7_0.ptData.type)
	arg_7_0:UpdateList(var_7_0, var_7_1, var_7_2)

	arg_7_0.totalTxt.text = var_7_3

	Canvas.ForceUpdateCanvases()
end

function var_0_0.UpdateList(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	assert(#arg_8_1 == #arg_8_2)
	arg_8_0.UIlist:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_8_1[arg_9_1 + 1]
			local var_9_1 = arg_8_2[arg_9_1 + 1]

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
			end

			local var_9_2 = Drop.Create(var_9_0)

			updateDrop(arg_9_2:Find("award/mask"), var_9_2, {
				hideName = true
			})

			if var_9_2.type == DROP_TYPE_ITEM and var_9_2:getSubClass():getConfig("type") == 9 then
				setActive(arg_9_2:Find("award/specialFrame"), true)
			else
				setActive(arg_9_2:Find("award/specialFrame"), false)
			end

			onButton(arg_8_0, arg_9_2:Find("award"), function()
				arg_8_0:emit(BaseUI.ON_DROP, var_9_2)
			end, SFX_PANEL)

			local var_9_3 = arg_8_0.ptData:GetDroptItemState(arg_9_1 + 1)

			if var_9_3 == ActivityPtData.STATE_LOCK then
				setActive(arg_9_2:Find("mask_get"), false)
				setActive(arg_9_2:Find("mask_got"), false)
			elseif var_9_3 == ActivityPtData.STATE_CAN_GET then
				setActive(arg_9_2:Find("mask_get"), true)
				setActive(arg_9_2:Find("mask_got"), false)
			else
				setActive(arg_9_2:Find("mask_get"), false)
				setActive(arg_9_2:Find("mask_got"), true)
			end
		end
	end)
	arg_8_0.UIlist:align(#arg_8_1)

	local var_8_0 = arg_8_0.scrollPanel:GetComponent("ScrollRect")

	scrollTo(arg_8_0.scrollPanel, 0, 1 - arg_8_3 * 145 / (#arg_8_2 * 145 - 7 - 591))

	if arg_8_0.ptData:CanGetAward() then
		setActive(arg_8_0.getBtn, true)
		onButton(arg_8_0, arg_8_0.getBtn, function()
			local var_11_0 = {}
			local var_11_1 = {}
			local var_11_2 = arg_8_0.ptData:GetLevel()
			local var_11_3 = arg_8_0.ptData:GetCurrLevel()

			for iter_11_0 = var_11_2 + 1, var_11_3 do
				local var_11_4 = arg_8_1[iter_11_0]
				local var_11_5 = false

				for iter_11_1, iter_11_2 in pairs(var_11_1) do
					if iter_11_2[1] == var_11_4[1] and iter_11_2[2] == var_11_4[2] then
						var_11_5 = true
						iter_11_2[3] = iter_11_2[3] + var_11_4[3]

						break
					end
				end

				if not var_11_5 then
					table.insert(var_11_1, var_11_4)
				end
			end

			local var_11_6 = getProxy(PlayerProxy):getRawData()
			local var_11_7 = pg.gameset.urpt_chapter_max.description[1]
			local var_11_8 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_11_7)
			local var_11_9, var_11_10 = Task.StaticJudgeOverflow(var_11_6.gold, var_11_6.oil, var_11_8, true, true, var_11_1)

			if var_11_9 then
				table.insert(var_11_0, function(arg_12_0)
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_ITEM_BOX,
						content = i18n("award_max_warning"),
						items = var_11_10,
						onYes = arg_12_0
					})
				end)
			end

			seriesAsync(var_11_0, function()
				local var_13_0 = arg_8_0.ptData:GetCurrTarget()

				arg_8_0:emit(ChildishnessSchoolPtMediator.EVENT_PT_OPERATION, {
					cmd = 4,
					activity_id = arg_8_0.ptData:GetId(),
					arg1 = var_13_0
				})
			end)
		end, SFX_PANEL)
	else
		setActive(arg_8_0.getBtn, false)
		removeOnButton(arg_8_0.getBtn)
	end
end

function var_0_0.updateResIcon(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if arg_14_3 == 2 or arg_14_3 ~= 3 and arg_14_3 ~= 4 and arg_14_3 ~= 5 and arg_14_3 ~= 6 then
		if arg_14_1 then
			arg_14_0.resIcon = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = arg_14_1
			}):getIcon()
		elseif arg_14_2 then
			arg_14_0.resIcon = arg_14_2
		end
	end
end

function var_0_0.UpdatePtData(arg_15_0)
	local var_15_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.ALVIT_PT_ACT_ID)

	arg_15_0.ptData = ActivityPtData.New(var_15_0)
end

function var_0_0.willExit(arg_16_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_16_0._tf)
end

return var_0_0
