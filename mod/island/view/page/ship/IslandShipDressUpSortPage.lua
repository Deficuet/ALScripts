local var_0_0 = class("IslandShipDressUpSortPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandDressUpSortUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.sortUIItemList = UIItemList.New(arg_2_0._tf:Find("frame"), arg_2_0._tf:Find("frame/tpl"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_5_0, arg_5_1, arg_5_2)
	var_0_0.super.Show(arg_5_0)

	arg_5_0.indexData = arg_5_1
	arg_5_0.callback = arg_5_2

	arg_5_0:InitList()
end

function var_0_0.InitList(arg_6_0)
	arg_6_0.sortUIItemList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = IslandShipDressUpPageNew.SORT_LIST[arg_7_1 + 1]
			local var_7_1 = arg_6_0.indexData.sortKey == var_7_0

			setText(arg_7_2:Find("Text"), setColorStr(IslandShipDressUpPageNew.Sort2CN(var_7_0), var_7_1 and "#393a3c" or "#7c7e81"))
			onButton(arg_6_0, arg_7_2, function()
				if arg_6_0.callback then
					arg_6_0.callback(var_7_0)
				end

				arg_6_0:Hide()
			end, SFX_PANEL)
		end
	end)
	arg_6_0.sortUIItemList:align(#IslandShipDressUpPageNew.SORT_LIST)
end

function var_0_0.Hide(arg_9_0)
	var_0_0.super.Hide(arg_9_0)

	arg_9_0.callback = nil
end

function var_0_0.OnDestroy(arg_10_0)
	if arg_10_0:isShowing() then
		arg_10_0:Hide()
	end
end

return var_0_0
