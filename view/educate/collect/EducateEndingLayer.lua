local var_0_0 = class("EducateEndingLayer", import(".EducateCollectLayerTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "EducateEndingUI"
end

function var_0_0.initConfig(arg_2_0)
	arg_2_0.config = pg.child_ending
end

function var_0_0.didEnter(arg_3_0)
	setText(arg_3_0.performTF:Find("review_btn/Text"), i18n("child_btn_review"))

	arg_3_0.endings = getProxy(EducateProxy):GetFinishEndings()
	arg_3_0.char = getProxy(EducateProxy):GetCharData()
	arg_3_0.tpl = arg_3_0.windowTF:Find("condition_tpl")

	setText(arg_3_0.curCntTF, #arg_3_0.endings)
	setText(arg_3_0.allCntTF, "/" .. #arg_3_0.config.all)
	arg_3_0:updatePage()
end

function var_0_0.updateItem(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = table.contains(arg_4_0.endings, arg_4_1.id)

	if var_4_0 then
		LoadImageSpriteAsync("bg/" .. arg_4_1.pic, arg_4_2:Find("unlock/mask/Image"))
		setText(arg_4_2:Find("unlock/name"), arg_4_1.name)
		onButton(arg_4_0, arg_4_2, function()
			arg_4_0:showPerformWindow(arg_4_1)
		end, SFX_PANEL)
	else
		removeOnButton(arg_4_2)

		local var_4_1 = arg_4_2:Find("lock/conditions")
		local var_4_2 = arg_4_1.condition

		arg_4_0:updateConditions(var_4_2, var_4_1)
	end

	setActive(arg_4_2:Find("unlock"), var_4_0)
	setActive(arg_4_2:Find("lock"), not var_4_0)
end

function var_0_0.updateConditions(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = 0

	for iter_6_0 = 1, #arg_6_1 do
		local var_6_1 = arg_6_1[iter_6_0]

		if var_6_1[1] == EducateConst.DROP_TYPE_ATTR then
			var_6_0 = var_6_0 + 1

			local var_6_2 = iter_6_0 <= arg_6_2.childCount and arg_6_2:GetChild(iter_6_0 - 1) or cloneTplTo(arg_6_0.tpl, arg_6_2)
			local var_6_3 = false
			local var_6_4 = ""

			if var_6_1[3] then
				var_6_3 = arg_6_0.char:GetAttrById(var_6_1[2]) >= var_6_1[3]
				var_6_4 = pg.child_attr[var_6_1[2]].name .. " > " .. var_6_1[3]
			else
				var_6_3 = arg_6_0.char:GetPersonalityId() == var_6_1[2]
				var_6_4 = i18n("child_nature_title") .. pg.child_attr[var_6_1[2]].name
			end

			setActive(var_6_2:Find("icon/unlock"), var_6_3)

			local var_6_5 = var_6_3 and "F59F48" or "888888"

			setTextColor(var_6_2:Find("Text"), Color.NewHex(var_6_5))
			setText(var_6_2:Find("Text"), var_6_4)
		end
	end

	for iter_6_1 = 1, arg_6_2.childCount do
		setActive(arg_6_2:GetChild(iter_6_1 - 1), iter_6_1 <= var_6_0)
	end
end

function var_0_0.showPerformWindow(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.performTF:Find("Image")

	LoadImageSpriteAsync("bg/" .. arg_7_1.pic, var_7_0)
	setActive(arg_7_0.performTF, true)
	onButton(arg_7_0, var_7_0, function()
		setActive(arg_7_0.performTF, false)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.performTF:Find("review_btn"), function()
		pg.PerformMgr.GetInstance():PlayGroup(arg_7_1.performance)
	end, SFX_PANEL)
end

function var_0_0.playAnimChange(arg_10_0)
	arg_10_0.anim:Stop()
	arg_10_0.anim:Play("anim_educate_ending_change")
end

function var_0_0.playAnimClose(arg_11_0)
	arg_11_0.anim:Play("anim_educate_ending_out")
end

return var_0_0
