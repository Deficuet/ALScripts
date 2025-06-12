local var_0_0 = class("FurnitureSlideExtraLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dFurnitureSlideExtraUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.slideList = ApartmentProxy.GetSlideInviteList()

	arg_2_0:InitUI()
	pg.NodeCanvasMgr.GetInstance():RegisterFunc("Slide.ShowInteraction", function()
		arg_2_0:ShowIneraction()
	end)
	pg.NodeCanvasMgr.GetInstance():RegisterFunc("Slide.HideInteraction", function()
		arg_2_0:HideInteraction()
	end)
	pg.NodeCanvasMgr.GetInstance():RegisterFunc("Slide.ShowPerformance", function()
		arg_2_0:ShowPerformance()
	end)
	pg.NodeCanvasMgr.GetInstance():RegisterFunc("Slide.HidePerformance", function()
		arg_2_0:HidePerformance()
	end)

	arg_2_0.system = SlideExtraSystem.New(arg_2_0.event, arg_2_0.contextData.scene)

	arg_2_0.system:Init()
end

function var_0_0.InitUI(arg_7_0)
	arg_7_0.queuePanel = arg_7_0._tf:Find("top")
	arg_7_0.performancePanel = arg_7_0._tf:Find("performance")
	arg_7_0.queueContainer = arg_7_0._tf:Find("top/bg/container/group")
	arg_7_0.performanceContainer = arg_7_0._tf:Find("performance/line/container")
	arg_7_0.queueItemList = UIItemList.New(arg_7_0.queueContainer, arg_7_0.queueContainer:Find("tpl"))
	arg_7_0.performanceItemList = UIItemList.New(arg_7_0.performanceContainer, arg_7_0.performanceContainer:Find("tpl"))

	arg_7_0.queueItemList:make(function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = arg_8_1 + 1
		local var_8_1 = arg_7_0.slideList[var_8_0]

		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_2 = pg.dorm3d_resource.get_id_list_by_ship_group[var_8_1][2]

			GetImageSpriteFromAtlasAsync(pg.dorm3d_resource[var_8_2].head_Icon, "", arg_8_2:Find("icon"), true)
		end
	end)
	arg_7_0.performanceItemList:make(function(arg_9_0, arg_9_1, arg_9_2)
		local var_9_0 = arg_9_1 + 1
		local var_9_1 = arg_7_0.slideList[var_9_0]

		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_2 = pg.dorm3d_resource.get_id_list_by_ship_group[var_9_1][2]

			GetImageSpriteFromAtlasAsync(pg.dorm3d_resource[var_9_2].head_Icon, "", arg_9_2:Find("icon"), true)
			setText(arg_9_2:Find("name"), ShipGroup.getDefaultShipNameByGroupID(var_9_1))
			onButton(arg_7_0, arg_9_2, function()
				arg_7_0:emit(FurnitureSlideExtraMediator.GO_SLIDE_PERFORMANCE, var_9_1)
			end, SFX_DORM_CLICK)
		end
	end)
	onButton(arg_7_0, arg_7_0._tf:Find("top/bg"), function()
		arg_7_0:emit(FurnitureSlideExtraMediator.OPEN_INVITE_LAYER, arg_7_0.slideList)
	end, SFX_DORM_CLICK)
	onButton(arg_7_0, arg_7_0._tf:Find("top/walk"), function()
		arg_7_0.system.wayPoints = arg_7_0.system.ladyMovePointsDic[30221].WalkToSlide

		warning(arg_7_0.wayPoints)

		arg_7_0.system.curIndex = 0
	end)
	onButton(arg_7_0, arg_7_0._tf:Find("top/ladder"), function()
		arg_7_0.system.ladyEnv:PlaySingleAction("swim_slide_ladder_01")

		arg_7_0.system.bonePosition = arg_7_0.system.ladyBoneRoot.localPosition
	end)
	onButton(arg_7_0, arg_7_0._tf:Find("top/slide"), function()
		arg_7_0.system.ladyEnv:PlaySingleAction("swim_slide_inwater_01")

		arg_7_0.system.bonePosition = arg_7_0.system.ladyBoneRoot.localPosition
	end, SFX_DORM_CLICK)
end

function var_0_0.InitSlide(arg_15_0)
	arg_15_0.system:InitSlide()
end

function var_0_0.didEnter(arg_16_0)
	arg_16_0:HideInteraction()
	arg_16_0:HidePerformance()
end

function var_0_0.UpdateSlideInviteList(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	arg_17_0.slideList = arg_17_1

	arg_17_0:Flush()
	arg_17_0.system:UpdateSlideInviteList(arg_17_2, arg_17_3)
end

function var_0_0.Flush(arg_18_0)
	arg_18_0.queueItemList:align(#arg_18_0.slideList)
	arg_18_0.performanceItemList:align(#arg_18_0.slideList)
end

function var_0_0.ShowIneraction(arg_19_0)
	setActive(arg_19_0.queuePanel, true)
	arg_19_0.queueItemList:align(#arg_19_0.slideList)
end

function var_0_0.HideInteraction(arg_20_0)
	setActive(arg_20_0.queuePanel, false)
end

function var_0_0.ShowPerformance(arg_21_0)
	setActive(arg_21_0.performancePanel, true)
	arg_21_0.performanceItemList:align(#arg_21_0.slideList)
end

function var_0_0.HidePerformance(arg_22_0)
	setActive(arg_22_0.performancePanel, false)
end

function var_0_0.willExit(arg_23_0)
	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.ShowInteraction")
	pg.NodeCanvasMgr.GetInstance():UnregisterFunc("Slide.HideInteraction")
	arg_23_0.system:Dispose()
end

return var_0_0
