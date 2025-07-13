local var_0_0 = class("SecondSummaryPage4", import(".SummaryAnimationPage"))

var_0_0.PerPageCount = 6
var_0_0.PageTypeFurniture = 1
var_0_0.PageTypeIconFrame = 2

function var_0_0.OnInit(arg_1_0)
	local var_1_0 = arg_1_0.summaryInfoVO.pageType

	setActive(arg_1_0._tf:Find("tip"), var_1_0 == var_0_0.PageTypeFurniture)
	setActive(arg_1_0._tf:Find("tip_2"), var_1_0 == var_0_0.PageTypeIconFrame)

	local var_1_1

	if var_1_0 == var_0_0.PageTypeFurniture then
		var_1_1 = arg_1_0.summaryInfoVO.medalList
	elseif var_1_0 == var_0_0.PageTypeIconFrame then
		var_1_1 = arg_1_0.summaryInfoVO.iconFrameList
	else
		assert(false, "page type error")
	end

	local var_1_2 = {}
	local var_1_3 = var_0_0.PerPageCount * (arg_1_0.summaryInfoVO.samePage - 1) + 1

	for iter_1_0 = var_1_3, math.min(var_1_3 + var_0_0.PerPageCount - 1, #var_1_1) do
		table.insert(var_1_2, var_1_1[iter_1_0])
	end

	local var_1_4 = getProxy(AttireProxy)
	local var_1_5 = UIItemList.New(arg_1_0._tf:Find("scroll_rect/content"), arg_1_0._tf:Find("scroll_rect/content/item_tpl"))

	var_1_5:make(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_1 + 1

		if arg_2_0 == UIItemList.EventUpdate then
			setActive(arg_2_2:Find("icon/Image"), var_1_0 == var_0_0.PageTypeFurniture)
			setActive(arg_2_2:Find("icon/frame"), var_1_0 == var_0_0.PageTypeIconFrame)
			setActive(arg_2_2:Find("date"), var_1_0 == var_0_0.PageTypeFurniture)
			setText(arg_2_2:Find("date"), i18n("player_summary_data"))
			setText(arg_2_2:Find("from"), i18n("player_summary_from"))

			if arg_1_0.summaryInfoVO.pageType == var_0_0.PageTypeFurniture then
				local var_2_1 = var_1_2[var_2_0]
				local var_2_2 = arg_1_0.summaryInfoVO.furnitures[var_2_1]
				local var_2_3 = pg.furniture_data_template[var_2_1]

				assert(var_2_3, var_2_1)
				GetImageSpriteFromAtlasAsync("furnitureicon/" .. var_2_3.icon, "", arg_2_2:Find("icon/Image"), true)
				setText(arg_2_2:Find("controll/name/Text"), var_2_3.name)
				setText(arg_2_2:Find("from/Text"), var_2_3.gain_by)
				setText(arg_2_2:Find("date/Text"), var_2_2 and var_2_2:getDate() or i18n("summary_page_un_rearch"))
			elseif arg_1_0.summaryInfoVO.pageType == var_0_0.PageTypeIconFrame then
				local var_2_4, var_2_5 = unpack(var_1_2[var_2_0])
				local var_2_6 = var_1_4:getAttireFrame(AttireConst.TYPE_ICON_FRAME, var_2_4)

				setLocalScale(arg_2_2:Find("icon/frame"), Vector3(var_2_5, var_2_5, var_2_5))
				PoolMgr.GetInstance():GetPrefab(var_2_6:getIcon(), var_2_6:getConfig("id"), true, function(arg_3_0)
					setParent(arg_3_0, arg_2_2:Find("icon/frame"), false)
				end)
				setText(arg_2_2:Find("controll/name/Text"), var_2_6:getConfig("name"))
				setText(arg_2_2:Find("from/Text"), var_2_6:getConfig("gain_by"))
			else
				assert(false, "logic error")
			end
		end
	end)
	var_1_5:align(#var_1_2)
end

return var_0_0
