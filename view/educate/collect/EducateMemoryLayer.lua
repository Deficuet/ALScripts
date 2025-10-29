local var_0_0 = class("EducateMemoryLayer", import(".EducateCollectLayerTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "EducateMemoryUI"
end

function var_0_0.initConfig(arg_2_0)
	arg_2_0.config = pg.child_memory
end

function var_0_0.didEnter(arg_3_0)
	setText(arg_3_0.performTF:Find("review_btn/Text"), i18n("child_btn_review"))

	arg_3_0.memories = getProxy(EducateProxy):GetMemories()

	setText(arg_3_0.curCntTF, #arg_3_0.memories)
	setText(arg_3_0.allCntTF, "/" .. #arg_3_0.config.all)
	arg_3_0:updatePage()
end

function var_0_0.updateItem(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = table.contains(arg_4_0.memories, arg_4_1.id)

	setActive(arg_4_2:Find("lock"), not var_4_0)
	setActive(arg_4_2:Find("unlock"), var_4_0)
	setActive(arg_4_2:Find("unlock/new"), EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_MEMORY, arg_4_1.id))

	if var_4_0 then
		LoadImageSpriteAsync("bg/" .. arg_4_1.pic, arg_4_2:Find("unlock/mask/Image"))
		setText(arg_4_2:Find("unlock/name"), arg_4_1.desc)
		onButton(arg_4_0, arg_4_2, function()
			arg_4_0:showPerformWindow(arg_4_1)
		end, SFX_PANEL)
	else
		removeOnButton(arg_4_2)
		setText(arg_4_2:Find("lock/Text"), i18n("child_collect_lock"))
	end
end

function var_0_0.showPerformWindow(arg_6_0, arg_6_1)
	EducateTipHelper.ClearNewTip(EducateTipHelper.NEW_MEMORY, arg_6_1.id)

	local var_6_0 = arg_6_0.performTF:Find("Image")

	LoadImageSpriteAsync("bg/" .. arg_6_1.pic, var_6_0)
	setActive(arg_6_0.performTF, true)
	onButton(arg_6_0, var_6_0, function()
		setActive(arg_6_0.performTF, false)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.performTF:Find("review_btn"), function()
		pg.PerformMgr.GetInstance():PlayOne(arg_6_1.performance)
	end, SFX_PANEL)
end

function var_0_0.playAnimChange(arg_9_0)
	arg_9_0.anim:Stop()
	arg_9_0.anim:Play("anim_educate_memory_change")
end

function var_0_0.playAnimClose(arg_10_0)
	arg_10_0.anim:Play("anim_educate_memory_out")
end

return var_0_0
