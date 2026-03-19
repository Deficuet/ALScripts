local var_0_0 = class("NewEducateSelEndingLayer", import("view.newEducate.base.NewEducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateSelEndingUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.rootTF = arg_2_0._tf:Find("root")
	arg_2_0.blurPanel = arg_2_0.rootTF:Find("bg")
	arg_2_0.scrollrect = arg_2_0.blurPanel:Find("window/view")

	local var_2_0 = arg_2_0.blurPanel:Find("window/view/content")

	arg_2_0.uiList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	arg_2_0.uiList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventInit then
			arg_2_0:InitItem(arg_3_1, arg_3_2)
		elseif arg_3_0 == UIItemList.EventUpdate then
			setActive(arg_3_2:Find("selected"), arg_2_0.selectedIdx == arg_3_1 + 1)
		end
	end)

	arg_2_0.sureBtn = arg_2_0.blurPanel:Find("window/sure_btn")

	setText(arg_2_0.sureBtn:Find("Image"), i18n("word_ok"))
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:OverlayPanel(arg_4_0.blurPanel, {
		groupDelta = 1,
		pbList = {
			arg_4_0.blurPanel
		}
	})
	onButton(arg_4_0, arg_4_0.sureBtn, function()
		arg_4_0:emit(NewEducateSelEndingMediator.ON_SELECT_ENDING, arg_4_0.endingList[arg_4_0.selectedIdx])
	end, SFX_PANEL)

	arg_4_0.selectedIdx = 1

	arg_4_0:RefreshView()
end

function var_0_0.InitItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1 + 1
	local var_6_1 = arg_6_0.endingList[var_6_0]
	local var_6_2 = pg.child2_ending[var_6_1]

	setScrollText(arg_6_2:Find("name_mask/name"), var_6_2.name)
	LoadImageSpriteAsync("neweducateicon/" .. var_6_2.pic_preview, arg_6_2:Find("Image"))
	setActive(arg_6_2:Find("complete"), table.contains(arg_6_0.completeList, var_6_1))
	onButton(arg_6_0, arg_6_2, function()
		arg_6_0.selectedIdx = var_6_0

		arg_6_0.uiList:align(#arg_6_0.endingList)
	end, SFX_PANEL)
end

function var_0_0.RefreshView(arg_8_0)
	arg_8_0.endingList = arg_8_0.contextData.char:GetFSM():GetState(NewEducateFSM.SYSTEM.ENDING):GetEndings()
	arg_8_0.completeList = arg_8_0.contextData.char:GetPermanentData():GetFinishedEndings()

	table.sort(arg_8_0.endingList, CompareFuncs({
		function(arg_9_0)
			return table.contains(arg_8_0.completeList, arg_9_0) and 1 or 0
		end,
		function(arg_10_0)
			return -arg_10_0
		end
	}))
	arg_8_0.uiList:align(#arg_8_0.endingList)
	scrollTo(arg_8_0.scrollrect, arg_8_0.uiList.container.rect.width / 2, 0)
end

function var_0_0.OnSelDone(arg_11_0, arg_11_1)
	local var_11_0 = pg.child2_ending[arg_11_1].performance

	NewEducateHelper.PlaySpecialStory(var_11_0, function()
		arg_11_0:closeView()
	end, true)
end

function var_0_0.onBackPressed(arg_13_0)
	return
end

function var_0_0.willExit(arg_14_0)
	existCall(arg_14_0.contextData.onExit)
	arg_14_0:UnOverlayPanel(arg_14_0.blurPanel, arg_14_0._tf)
end

return var_0_0
