local var_0_0 = class("EducateCollectLayerTemplate", import("..base.EducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	assert(nil, "getUIName方法必须由子类实现")
end

function var_0_0.initConfig(arg_2_0)
	assert(nil, "initConfig方法必须由子类实现")
end

function var_0_0.init(arg_3_0)
	arg_3_0.anim = arg_3_0._tf:Find("anim_root"):GetComponent(typeof(Animation))
	arg_3_0.animEvent = arg_3_0._tf:Find("anim_root"):GetComponent(typeof(DftAniEvent))

	arg_3_0.animEvent:SetEndEvent(function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end)

	arg_3_0.closeBtn = arg_3_0._tf:Find("anim_root/bg")
	arg_3_0.windowTF = arg_3_0._tf:Find("anim_root/window")
	arg_3_0.curCntTF = arg_3_0.windowTF:Find("collect/cur")
	arg_3_0.allCntTF = arg_3_0.windowTF:Find("collect/all")
	arg_3_0.pageTF = arg_3_0.windowTF:Find("page")
	arg_3_0.nextBtn = arg_3_0.windowTF:Find("next_btn")
	arg_3_0.lastBtn = arg_3_0.windowTF:Find("last_btn")
	arg_3_0.paginationTF = arg_3_0.windowTF:Find("pagination")
	arg_3_0.performTF = arg_3_0._tf:Find("anim_root/perform")

	setActive(arg_3_0.performTF, false)
	arg_3_0:initConfig()

	arg_3_0.onePageCnt = arg_3_0.pageTF.childCount
	arg_3_0.pages = math.ceil(#arg_3_0.config.all / arg_3_0.onePageCnt)
	arg_3_0.curPageIndex = 1

	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:playAnimClose()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.nextBtn, function()
		arg_3_0:playAnimChange()

		arg_3_0.curPageIndex = arg_3_0.curPageIndex + 1

		arg_3_0:updatePage()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.lastBtn, function()
		arg_3_0:playAnimChange()

		arg_3_0.curPageIndex = arg_3_0.curPageIndex - 1

		arg_3_0:updatePage()
	end, SFX_PANEL)
	arg_3_0:OverlayPanel(arg_3_0._tf, {
		groupDelta = 2
	})
end

function var_0_0.updatePage(arg_8_0)
	setActive(arg_8_0.nextBtn, arg_8_0.pages ~= 1 and arg_8_0.curPageIndex < arg_8_0.pages)
	setActive(arg_8_0.lastBtn, arg_8_0.pages ~= 1 and arg_8_0.curPageIndex > 1)
	setText(arg_8_0.paginationTF, arg_8_0.curPageIndex .. "/" .. arg_8_0.pages)

	local var_8_0 = (arg_8_0.curPageIndex - 1) * arg_8_0.onePageCnt

	for iter_8_0 = 1, arg_8_0.onePageCnt do
		local var_8_1 = arg_8_0.pageTF:Find("frame_" .. iter_8_0)
		local var_8_2 = arg_8_0.config[arg_8_0.config.all[var_8_0 + iter_8_0]]

		if var_8_2 then
			setActive(var_8_1, true)
			arg_8_0:updateItem(var_8_2, var_8_1)
		else
			setActive(var_8_1, false)
		end
	end
end

function var_0_0.updateItem(arg_9_0, arg_9_1, arg_9_2)
	assert(nil, "updateItem方法必须由子类实现")
end

function var_0_0.playAnimChange(arg_10_0)
	assert(nil, "playAnimClose方法必须由子类实现")
end

function var_0_0.playAnimClose(arg_11_0)
	assert(nil, "playAnimClose方法必须由子类实现")
end

function var_0_0.onBackPressed(arg_12_0)
	arg_12_0:playAnimClose()
end

function var_0_0.willExit(arg_13_0)
	arg_13_0.animEvent:SetEndEvent(nil)
	arg_13_0:UnOverlayPanel(arg_13_0._tf)
end

return var_0_0
