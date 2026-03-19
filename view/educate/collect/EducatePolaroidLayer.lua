local var_0_0 = class("EducatePolaroidLayer", import(".EducateCollectLayerTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "EducatePolaroidUI"
end

function var_0_0.initConfig(arg_2_0)
	arg_2_0.config = pg.child_polaroid
end

function var_0_0.initGroups(arg_3_0)
	arg_3_0.groupIds = {}
	arg_3_0.group2polaroidIds = {}

	for iter_3_0, iter_3_1 in pairs(pg.child_polaroid.get_id_list_by_group) do
		table.insert(arg_3_0.groupIds, iter_3_0)

		arg_3_0.group2polaroidIds[iter_3_0] = iter_3_1
	end

	table.sort(arg_3_0.groupIds)
end

function var_0_0.initUnlockAttr(arg_4_0)
	arg_4_0.unlockAttrs = {}
	arg_4_0.endings = getProxy(EducateProxy):GetAllEndings()

	underscore.each(arg_4_0.endings, function(arg_5_0)
		local var_5_0 = pg.child_ending[arg_5_0].polaroid_condition

		if var_5_0 ~= 0 and not table.contains(arg_4_0.unlockAttrs, var_5_0) then
			table.insert(arg_4_0.unlockAttrs, var_5_0)
		end
	end)
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:initGroups()
	arg_6_0:initShowList()
	onButton(arg_6_0, arg_6_0.performTF, function()
		setActive(arg_6_0.performTF, false)
	end, SFX_PANEL)

	arg_6_0.pages = math.ceil(#arg_6_0.groupIds / arg_6_0.onePageCnt)

	EducateTipHelper.ClearNewTip(EducateTipHelper.NEW_POLAROID)

	local var_6_0 = arg_6_0.performTF:Find("bg/lock/unlock_btn/Text")

	var_6_0:GetComponent("RichText"):AddSprite("gold", arg_6_0._tf:Find("res/gold"):GetComponent(typeof(Image)).sprite)
	setText(var_6_0, i18n("child_could_buy"))
	setText(arg_6_0.windowTF:Find("tip"), i18n("child_buy_polaroid_tip"))

	arg_6_0.basePrice = pg.gameset.child_polaroid_basic_price.key_value
	arg_6_0.addPrice = pg.gameset.child_polaroid_add_price.key_value
	arg_6_0.maxPrice = pg.gameset.child_polaroid_max_price.key_value

	arg_6_0:Flush()
end

function var_0_0.initShowList(arg_8_0)
	arg_8_0.showIds = {}
	arg_8_0.selectedIndex = 1
	arg_8_0.groupsTF = arg_8_0.performTF:Find("bg/groups")
	arg_8_0.showList = UIItemList.New(arg_8_0.groupsTF, arg_8_0.groupsTF:Find("tpl"))

	arg_8_0.showList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_8_0.showIds[arg_9_1 + 1]
			local var_9_1 = arg_8_0:IsUnlock(var_9_0)

			setText(arg_9_2:Find("unlock/unselected/Text"), var_9_0)
			setText(arg_9_2:Find("unlock/selected/Text"), var_9_0)
			setActive(arg_9_2:Find("lock"), not var_9_1)
			setActive(arg_9_2:Find("unlock"), var_9_1)
			setActive(arg_9_2:Find("unlock/selected"), arg_8_0.selectedIndex == arg_9_1 + 1)
			setActive(arg_9_2:Find("unlock/unselected"), arg_8_0.selectedIndex ~= arg_9_1 + 1)
			onButton(arg_8_0, arg_9_2, function(arg_10_0)
				arg_8_0.selectedIndex = arg_9_1 + 1

				arg_8_0:updatePerform(var_9_0, var_9_1)
				arg_8_0.showList:align(#arg_8_0.showIds)

				if not var_9_1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("child_polaroid_lock_tip"))
				end
			end)
		end
	end)
end

function var_0_0.IsUnlock(arg_11_0, arg_11_1)
	if arg_11_0.polaroidData[arg_11_1] then
		return true
	end

	if #arg_11_0.endings > 0 then
		local var_11_0 = arg_11_0.config[arg_11_1].stage

		if var_11_0[1] == 2 or var_11_0[1] == 3 then
			return true
		elseif var_11_0[1] == 4 then
			local var_11_1 = arg_11_0.config[arg_11_1].xingge[1]

			return table.contains(arg_11_0.unlockAttrs, var_11_1)
		end
	end

	return false
end

function var_0_0.SetData(arg_12_0)
	local var_12_0 = getProxy(EducateProxy)

	arg_12_0.polaroidData = var_12_0:GetPolaroidData()
	arg_12_0.gameCnt = var_12_0:GetGameCnt()
	arg_12_0.bugCnt = var_12_0:GetPolaroidBuyCnt()

	arg_12_0:initUnlockAttr()
end

function var_0_0.Flush(arg_13_0)
	arg_13_0:SetData()

	local var_13_0, var_13_1 = getProxy(EducateProxy):GetPolaroidGroupCnt()

	setText(arg_13_0.curCntTF, var_13_0)
	setText(arg_13_0.allCntTF, "/" .. var_13_1)
	arg_13_0:updatePage()

	if isActive(arg_13_0.performTF) then
		local var_13_2 = arg_13_0.showIds[arg_13_0.selectedIndex]
		local var_13_3 = arg_13_0:IsUnlock(var_13_2)

		arg_13_0:updatePerform(var_13_2, var_13_3)
		arg_13_0.showList:align(#arg_13_0.showIds)
	end
end

function var_0_0.updatePage(arg_14_0)
	setActive(arg_14_0.nextBtn, arg_14_0.pages ~= 1 and arg_14_0.curPageIndex < arg_14_0.pages)
	setActive(arg_14_0.lastBtn, arg_14_0.pages ~= 1 and arg_14_0.curPageIndex > 1)
	setText(arg_14_0.paginationTF, arg_14_0.curPageIndex .. "/" .. arg_14_0.pages)

	local var_14_0 = (arg_14_0.curPageIndex - 1) * arg_14_0.onePageCnt

	for iter_14_0 = 1, arg_14_0.onePageCnt do
		local var_14_1 = arg_14_0.pageTF:Find("frame_" .. iter_14_0)
		local var_14_2 = arg_14_0.groupIds[var_14_0 + iter_14_0]

		if var_14_2 then
			setActive(var_14_1, true)
			arg_14_0:updateItem(var_14_2, var_14_1)
		else
			setActive(var_14_1, false)
		end
	end
end

function var_0_0.updateItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.group2polaroidIds[arg_15_1]

	table.sort(var_15_0, CompareFuncs({
		function(arg_16_0)
			return arg_15_0.polaroidData[arg_16_0] and 0 or 1
		end,
		function(arg_17_0)
			return arg_15_0.polaroidData[arg_17_0] and arg_15_0.polaroidData[arg_17_0]:GetTimeWeight() or 1
		end,
		function(arg_18_0)
			return arg_18_0
		end
	}))

	local var_15_1 = arg_15_0.config[var_15_0[1]]
	local var_15_2 = arg_15_0.polaroidData[var_15_0[1]]

	setActive(arg_15_2:Find("lock"), not var_15_2)
	setActive(arg_15_2:Find("unlock"), var_15_2)

	if var_15_2 then
		local var_15_3 = arg_15_0.polaroidData[var_15_0[1]]

		LoadImageSpriteAsync("educatepolaroid/" .. var_15_1.pic, arg_15_2:Find("unlock/mask/Image"))
		setText(arg_15_2:Find("unlock/name"), var_15_1.title)
		onButton(arg_15_0, arg_15_2, function()
			arg_15_0:showPerformWindow(var_15_0)
		end, SFX_PANEL)
	else
		removeOnButton(arg_15_2)
		setText(arg_15_2:Find("lock/desc/Text"), var_15_1.condition)

		local var_15_4 = arg_15_2:Find("lock/unlock_btn")

		setActive(var_15_4, arg_15_0.gameCnt > 1)
		onButton(arg_15_0, var_15_4, function()
			arg_15_0:OnClickBuyBtn(var_15_1)
		end, SFX_PANEL)
	end
end

function var_0_0.showPerformWindow(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0.showIds = arg_21_1

	arg_21_0.showList:align(#arg_21_0.showIds)
	triggerButton(arg_21_0.groupsTF:GetChild(0))
	setActive(arg_21_0.performTF, true)
end

function var_0_0.updatePerform(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.config[arg_22_1]

	LoadImageSpriteAsync("educatepolaroid/" .. var_22_0.pic, arg_22_0.performTF:Find("bg/icon/Image"))
	setActive(arg_22_0.performTF:Find("bg/icon/lock"), not arg_22_2)
	setText(arg_22_0.performTF:Find("bg/Text"), arg_22_2 and var_22_0.title or "")
	setActive(arg_22_0.performTF:Find("bg/lock"), not arg_22_2)

	if not arg_22_2 then
		setText(arg_22_0.performTF:Find("bg/lock/desc/Text"), var_22_0.condition)

		local var_22_1 = arg_22_0.performTF:Find("bg/lock/unlock_btn")

		setActive(var_22_1, arg_22_0.gameCnt > 1)
		onButton(arg_22_0, var_22_1, function()
			arg_22_0:OnClickBuyBtn(var_22_0)
		end, SFX_PANEL)
	end
end

function var_0_0.OnClickBuyBtn(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1.title
	local var_24_1 = math.min(arg_24_0.maxPrice, arg_24_0.basePrice + arg_24_0.bugCnt * arg_24_0.addPrice)

	arg_24_0:emit(EducateBaseUI.EDUCATE_ON_MSG_TIP, {
		content = i18n("child_polaroid_buy", var_24_1, var_24_0),
		onYes = function()
			arg_24_0:emit(EducateCollectMediatorTemplate.UNLOCK, {
				type = EducateBuyCollectCommand.TYPE.POLAROID,
				id = arg_24_1.id,
				cost = var_24_1
			})
		end
	})
end

function var_0_0.playAnimChange(arg_26_0)
	arg_26_0.anim:Stop()
	arg_26_0.anim:Play("anim_educate_Polaroid_change")
end

function var_0_0.playAnimClose(arg_27_0)
	arg_27_0.anim:Play("anim_educate_Polaroid_out")
end

return var_0_0
