local var_0_0 = class("IslandRestaurantRankPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandRestaurantRankUI"
end

function var_0_0.OnLoaded(arg_2_0)
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

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("mask"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("window/close"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.uiList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventInit then
			arg_3_0:InitItem(arg_6_1, arg_6_2)
		elseif arg_6_0 == UIItemList.EventUpdate then
			arg_3_0:UpdataItem(arg_6_1, arg_6_2)
		end
	end)

	arg_3_0.rankIds = pg.island_manage_rank.all

	table.sort(arg_3_0.rankIds)
end

function var_0_0.InitItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = pg.island_manage_rank[arg_7_0.rankIds[arg_7_1 + 1]]

	arg_7_2.name = var_7_0.id

	LoadImageSpriteAsync("island/islandrestaurant/" .. var_7_0.icon, arg_7_2:Find("icon"))
	setText(arg_7_2:Find("info/top/name"), var_7_0.name)

	local var_7_1 = arg_7_2:Find("info/bottom/content")

	setText(var_7_1:Find("shelf/info/value"), var_7_0.slot_num[1])
	setText(var_7_1:Find("capacity/info/value"), var_7_0.slot_num[2])
	setText(var_7_1:Find("percent/info/value"), var_7_0.bonus_coefficient / 100 .. "%")
	setText(var_7_1:Find("assistant/info/value"), var_7_0.assistant_num)
	setActive(arg_7_2:Find("dot/silder"), arg_7_1 + 1 ~= #arg_7_0.rankIds)
end

function var_0_0.UpdataItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.rankIds[arg_8_1 + 1]
	local var_8_1 = arg_8_0.rankIds[arg_8_1]
	local var_8_2 = arg_8_0.expData[var_8_0]
	local var_8_3 = var_8_0 <= arg_8_0.level

	setActive(arg_8_2:Find("dot/finished"), var_8_3)
	setActive(arg_8_2:Find("info/top/finished"), var_8_3)
	setActive(arg_8_2:Find("info/top/exp"), not var_8_3)

	local var_8_4 = arg_8_0.expData[var_8_1] or 0
	local var_8_5 = 0

	if var_8_2 ~= var_8_4 then
		var_8_5 = (arg_8_0.sales - var_8_4) / (var_8_2 - var_8_4)
	end

	setSlider(arg_8_2:Find("dot/silder"), 0, 1, var_8_5)
	setText(arg_8_2:Find("info/top/exp/value"), arg_8_0.sales .. "/" .. var_8_4)
end

function var_0_0.OnShow(arg_9_0, arg_9_1)
	arg_9_0:BlurPanel()

	arg_9_0.rest = getProxy(IslandProxy):GetIsland():GetManageAgency():GetRestaurant(arg_9_1)
	arg_9_0.level = arg_9_0.rest:GetRankLevel()
	arg_9_0.sales = arg_9_0.rest:GetSales()
	arg_9_0.expData = IslandRestaurant.GET_RNAK_EXPS(arg_9_1)

	arg_9_0.uiList:align(#arg_9_0.rankIds)

	local var_9_0 = {}

	arg_9_0.uiList:eachActive(function(arg_10_0, arg_10_1)
		arg_10_1:GetComponent(typeof(CanvasGroup)).alpha = 0

		table.insert(var_9_0, function(arg_11_0)
			arg_10_1:GetComponent(typeof(CanvasGroup)).alpha = 1

			arg_10_1:GetComponent(typeof(Animation)):Play()
			arg_9_0:managedTween(LeanTween.delayedCall, function()
				arg_11_0()
			end, 0.03, nil)
		end)
	end)
	seriesAsync(var_9_0, function()
		scrollTo(arg_9_0.viewTF, 0, 1 - (arg_9_0.level - 1) / (#arg_9_0.rankIds - 3))
	end)
end

function var_0_0.OnHide(arg_14_0)
	arg_14_0:UnBlurPanel()
end

function var_0_0.OnDestroy(arg_15_0)
	arg_15_0:OnHide()
end

return var_0_0
