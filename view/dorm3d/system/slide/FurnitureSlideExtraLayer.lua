local var_0_0 = class("FurnitureSlideExtraLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dFurnitureSlideExtraUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.slideList = ApartmentProxy.GetSlideInviteList()

	arg_2_0:InitUI()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0.queuePanel = arg_3_0._tf:Find("top")
	arg_3_0.performancePanel = arg_3_0._tf:Find("performance")
	arg_3_0.queueContainer = arg_3_0._tf:Find("top/bg/container")
	arg_3_0.performanceContainer = arg_3_0._tf:Find("performance/line/container")

	setText(arg_3_0._tf:Find("top/bg/Text"), i18n("3ddorm_beach_slide_tip2"))
	setText(arg_3_0._tf:Find("performance/btn_invite/Text"), i18n("3ddorm_beach_slide_tip1"))

	arg_3_0.queueItemList = UIItemList.New(arg_3_0.queueContainer, arg_3_0.queueContainer:Find("tpl"))
	arg_3_0.performanceItemList = UIItemList.New(arg_3_0.performanceContainer, arg_3_0.performanceContainer:Find("tpl"))

	arg_3_0.queueItemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_4_1 + 1
		local var_4_1 = var_4_0 > #arg_3_0.slideList

		setActive(arg_4_2:Find("icon"), not var_4_1)
		setActive(arg_4_2:Find("front"), not var_4_1)
		setActive(arg_4_2:Find("plus"), var_4_1)

		if not var_4_1 then
			local var_4_2 = arg_3_0.slideList[var_4_0]
			local var_4_3 = pg.dorm3d_resource.get_id_list_by_ship_group[var_4_2][2]

			GetImageSpriteFromAtlasAsync(pg.dorm3d_resource[var_4_3].head_Icon, "", arg_4_2:Find("icon"), true)
		end
	end)
	arg_3_0.performanceItemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_5_1 + 1
		local var_5_1 = arg_3_0.slideList[var_5_0]

		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_2 = pg.dorm3d_resource.get_id_list_by_ship_group[var_5_1][2]

			GetImageSpriteFromAtlasAsync(pg.dorm3d_resource[var_5_2].head_Icon, "", arg_5_2:Find("icon"), true)
			setText(arg_5_2:Find("name"), ShipGroup.getDefaultShipNameByGroupID(var_5_1))
			onButton(arg_3_0, arg_5_2, function()
				arg_3_0:emit(FurnitureSlideExtraMediator.GO_SLIDE_PERFORMANCE, var_5_1)
			end, SFX_DORM_CLICK)
		end
	end)
	onButton(arg_3_0, arg_3_0._tf:Find("top/bg"), function()
		arg_3_0:emit(FurnitureSlideExtraMediator.OPEN_INVITE_LAYER, arg_3_0.slideList)
	end, SFX_DORM_CLICK)
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:HideInteraction()
	arg_8_0:HidePerformance()
end

function var_0_0.UpdateSlideInviteList(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0.slideList = arg_9_1

	arg_9_0:Flush()
end

function var_0_0.Flush(arg_10_0)
	arg_10_0.queueItemList:align(#arg_10_0.slideList + 1)
	arg_10_0.performanceItemList:align(#arg_10_0.slideList)
end

function var_0_0.HandleDormUIState(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1 == "base"

	setActive(arg_11_0._tf, var_11_0)
end

function var_0_0.ShowInteraction(arg_12_0)
	setActive(arg_12_0.queuePanel, true)
	arg_12_0.queueItemList:align(#arg_12_0.slideList + 1)
end

function var_0_0.HideInteraction(arg_13_0)
	setActive(arg_13_0.queuePanel, false)
end

function var_0_0.ShowPerformance(arg_14_0)
	setActive(arg_14_0.performancePanel, true)
	arg_14_0.performanceItemList:align(#arg_14_0.slideList)
end

function var_0_0.HidePerformance(arg_15_0)
	setActive(arg_15_0.performancePanel, false)
end

function var_0_0.willExit(arg_16_0)
	return
end

return var_0_0
