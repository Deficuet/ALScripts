local var_0_0 = class("IslandRestaurantRankPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandRestaurantRankUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.uiAnim = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.uiAnimEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.uiAnimEvent:SetEndEvent(function()
		arg_2_0.playingHideAnim = false

		var_0_0.super.Hide(arg_2_0)
	end)

	arg_2_0.viewTF = arg_2_0._tf:Find("window/view")

	local var_2_0 = arg_2_0.viewTF:Find("content")
	local var_2_1 = var_2_0:Find("tpl")

	setText(var_2_1:Find("info/top/exp/name"), i18n("island_manage_need_ext"))
	setText(var_2_1:Find("info/top/finished/Text"), i18n("island_manage_reach"))
	setText(var_2_1:Find("info/bottom/content/shelf/info/name"), i18n("island_manage_slot"))
	setText(var_2_1:Find("info/bottom/content/capacity/info/name"), i18n("island_manage_food_cnt"))
	setText(var_2_1:Find("info/bottom/content/percent/info/name"), i18n("island_manage_sale_ratio"))
	setText(var_2_1:Find("info/bottom/content/assistant/info/name"), i18n("island_manage_worker_cnt"))

	arg_2_0.uiList = UIItemList.New(var_2_0, var_2_1)
end

function var_0_0.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf:Find("mask"), function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("window/close"), function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	arg_4_0.uiList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventInit then
			arg_4_0:InitItem(arg_7_1, arg_7_2)
		elseif arg_7_0 == UIItemList.EventUpdate then
			arg_4_0:UpdataItem(arg_7_1, arg_7_2)
		end
	end)

	arg_4_0.rankIds = pg.island_manage_rank.all

	table.sort(arg_4_0.rankIds)
end

function var_0_0.InitItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = pg.island_manage_rank[arg_8_0.rankIds[arg_8_1 + 1]]

	arg_8_2.name = var_8_0.id

	LoadImageSpriteAsync("island/islandrestaurant/" .. var_8_0.icon, arg_8_2:Find("icon"))
	setText(arg_8_2:Find("info/top/name"), var_8_0.name)

	local var_8_1 = arg_8_2:Find("info/bottom/content")

	setText(var_8_1:Find("shelf/info/value"), var_8_0.slot_num[1])
	setText(var_8_1:Find("capacity/info/value"), var_8_0.slot_num[2])
	setText(var_8_1:Find("percent/info/value"), var_8_0.bonus_coefficient / 100 .. "%")
	setText(var_8_1:Find("assistant/info/value"), var_8_0.assistant_num)
	setActive(arg_8_2:Find("dot/silder"), arg_8_1 + 1 ~= #arg_8_0.rankIds)
end

function var_0_0.UpdataItem(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.rankIds[arg_9_1 + 1]
	local var_9_1 = arg_9_0.rankIds[arg_9_1]
	local var_9_2 = arg_9_0.expData[var_9_0]
	local var_9_3 = var_9_0 <= arg_9_0.level

	setActive(arg_9_2:Find("dot/finished"), var_9_3)
	setActive(arg_9_2:Find("info/top/finished"), var_9_3)
	setActive(arg_9_2:Find("info/top/exp"), not var_9_3)
	setText(arg_9_2:Find("info/top/exp/value"), arg_9_0.sales .. "/" .. var_9_2)

	local var_9_4 = arg_9_0.expData[var_9_1] or 0
	local var_9_5 = (arg_9_0.sales - var_9_4) / (var_9_2 - var_9_4)

	setSlider(arg_9_2:Find("dot/silder"), 0, 1, var_9_5)
end

function var_0_0.OnShow(arg_10_0, arg_10_1)
	arg_10_0:BlurPanel()

	arg_10_0.rest = getProxy(IslandProxy):GetIsland():GetManageAgency():GetRestaurant(arg_10_1)
	arg_10_0.level = arg_10_0.rest:GetRankLevel()
	arg_10_0.sales = arg_10_0.rest:GetSales()
	arg_10_0.expData = IslandRestaurant.GET_RNAK_EXPS(arg_10_1)

	arg_10_0.uiList:align(#arg_10_0.rankIds)

	local var_10_0 = {}

	arg_10_0.uiList:eachActive(function(arg_11_0, arg_11_1)
		arg_11_1:GetComponent(typeof(CanvasGroup)).alpha = 0

		table.insert(var_10_0, function(arg_12_0)
			arg_11_1:GetComponent(typeof(CanvasGroup)).alpha = 1

			arg_11_1:GetComponent(typeof(Animation)):Play()
			arg_10_0:managedTween(LeanTween.delayedCall, function()
				arg_12_0()
			end, 0.03, nil)
		end)
	end)
	seriesAsync(var_10_0, function()
		scrollTo(arg_10_0.viewTF, 0, 1 - (arg_10_0.level - 1) / (#arg_10_0.rankIds - 3))
	end)
end

function var_0_0.HideByAnim(arg_15_0)
	if arg_15_0.playingHideAnim then
		return
	end

	arg_15_0.uiAnim:Play("anim_IslandRestaurantRankUI_Out")

	arg_15_0.playingHideAnim = true
end

function var_0_0.OnHide(arg_16_0)
	arg_16_0:UnBlurPanel()
end

function var_0_0.OnDestroy(arg_17_0)
	arg_17_0.uiAnimEvent:SetEndEvent(nil)
end

return var_0_0
