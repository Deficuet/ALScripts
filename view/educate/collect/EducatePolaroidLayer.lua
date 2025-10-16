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
	arg_4_0.endings = getProxy(EducateProxy):GetFinishEndings()

	underscore.each(arg_4_0.endings, function(arg_5_0)
		local var_5_0 = pg.child_ending[arg_5_0].polaroid_condition

		if var_5_0 ~= 0 and not table.contains(arg_4_0.unlockAttrs, var_5_0) then
			table.insert(arg_4_0.unlockAttrs, var_5_0)
		end
	end)
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:initUnlockAttr()
	arg_6_0:initGroups()

	arg_6_0.polaroidData = getProxy(EducateProxy):GetPolaroidData()

	local var_6_0, var_6_1 = getProxy(EducateProxy):GetPolaroidGroupCnt()

	setText(arg_6_0.curCntTF, var_6_0)
	setText(arg_6_0.allCntTF, "/" .. var_6_1)
	onButton(arg_6_0, arg_6_0.performTF, function()
		setActive(arg_6_0.performTF, false)
	end, SFX_PANEL)
	arg_6_0:initShowList()

	arg_6_0.pages = math.ceil(#arg_6_0.groupIds / arg_6_0.onePageCnt)

	arg_6_0:updatePage()
	EducateTipHelper.ClearNewTip(EducateTipHelper.NEW_POLAROID)
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
				if var_9_1 then
					arg_8_0.selectedIndex = arg_9_1 + 1

					arg_8_0:updatePerform(var_9_0)
					arg_8_0.showList:align(#arg_8_0.showIds)
				else
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

function var_0_0.updatePage(arg_12_0)
	setActive(arg_12_0.nextBtn, arg_12_0.pages ~= 1 and arg_12_0.curPageIndex < arg_12_0.pages)
	setActive(arg_12_0.lastBtn, arg_12_0.pages ~= 1 and arg_12_0.curPageIndex > 1)
	setText(arg_12_0.paginationTF, arg_12_0.curPageIndex .. "/" .. arg_12_0.pages)

	local var_12_0 = (arg_12_0.curPageIndex - 1) * arg_12_0.onePageCnt

	for iter_12_0 = 1, arg_12_0.onePageCnt do
		local var_12_1 = arg_12_0.pageTF:Find("frame_" .. iter_12_0)
		local var_12_2 = arg_12_0.groupIds[var_12_0 + iter_12_0]

		if var_12_2 then
			setActive(var_12_1, true)
			arg_12_0:updateItem(var_12_2, var_12_1)
		else
			setActive(var_12_1, false)
		end
	end
end

function var_0_0.updateItem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.group2polaroidIds[arg_13_1]

	table.sort(var_13_0, CompareFuncs({
		function(arg_14_0)
			return arg_13_0.polaroidData[arg_14_0] and 0 or 1
		end,
		function(arg_15_0)
			return arg_13_0.polaroidData[arg_15_0] and arg_13_0.polaroidData[arg_15_0]:GetTimeWeight() or 1
		end,
		function(arg_16_0)
			return arg_16_0
		end
	}))

	local var_13_1 = arg_13_0.config[var_13_0[1]]
	local var_13_2 = arg_13_0.polaroidData[var_13_0[1]]

	setActive(arg_13_2:Find("lock"), not var_13_2)
	setActive(arg_13_2:Find("unlock"), var_13_2)

	if var_13_2 then
		local var_13_3 = arg_13_0.polaroidData[var_13_0[1]]

		LoadImageSpriteAsync("educatepolaroid/" .. var_13_1.pic, arg_13_2:Find("unlock/mask/Image"))
		setText(arg_13_2:Find("unlock/name"), var_13_1.title)
		onButton(arg_13_0, arg_13_2, function()
			arg_13_0:showPerformWindow(var_13_0)
		end, SFX_PANEL)
	else
		removeOnButton(arg_13_2)
		setText(arg_13_2:Find("lock/Text"), var_13_1.condition)
	end
end

function var_0_0.showPerformWindow(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.showIds = arg_18_1

	arg_18_0.showList:align(#arg_18_0.showIds)
	triggerButton(arg_18_0.groupsTF:GetChild(0))
	setActive(arg_18_0.performTF, true)
end

function var_0_0.updatePerform(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.config[arg_19_1]

	LoadImageSpriteAsync("educatepolaroid/" .. var_19_0.pic, arg_19_0.performTF:Find("bg/mask/Image"))
	setText(arg_19_0.performTF:Find("bg/Text"), var_19_0.title)
end

function var_0_0.playAnimChange(arg_20_0)
	arg_20_0.anim:Stop()
	arg_20_0.anim:Play("anim_educate_Polaroid_change")
end

function var_0_0.playAnimClose(arg_21_0)
	arg_21_0.anim:Play("anim_educate_Polaroid_out")
end

return var_0_0
