local var_0_0 = class("IslandMsgBoxSingleItemWindow", import(".IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBoxWithSingleItem"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.itemTr = arg_2_0:findTF("IslandItemTpl")
	arg_2_0.nameTxt = arg_2_0:findTF("name"):GetComponent(typeof(Text))
	arg_2_0.ownTxt = arg_2_0:findTF("own"):GetComponent(typeof(Text))
	arg_2_0.uiItemList = UIItemList.New(arg_2_0:findTF("list"), arg_2_0:findTF("list/tpl"))

	setText(arg_2_0:findTF("label/Text"), i18n("island_get_way"))
end

function var_0_0.OnShow(arg_3_0)
	var_0_0.super.OnShow(arg_3_0)

	local var_3_0 = arg_3_0.settings.itemId

	arg_3_0:FlushMain(var_3_0)
	arg_3_0:FlushAcquiringWay(var_3_0)
end

function var_0_0.FlushMain(arg_4_0, arg_4_1)
	local var_4_0 = pg.island_item_data_template[arg_4_1]

	arg_4_0.nameTxt.text = var_4_0.name
	arg_4_0.contentTxt.text = var_4_0.desc

	local var_4_1 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetOwnCount(arg_4_1)

	arg_4_0.ownTxt.text = i18n("island_own_cnt") .. setColorStr(var_4_1, "#39beff")

	local var_4_2 = Drop.New({
		count = 0,
		type = DROP_TYPE_ISLAND_ITEM,
		id = arg_4_1
	})

	updateCustomDrop(arg_4_0.itemTr, var_4_2)
end

function var_0_0.FlushAcquiringWay(arg_5_0, arg_5_1)
	local var_5_0 = IslandItem.New({
		num = 0,
		id = arg_5_1
	}):GetAcquiringWay()

	arg_5_0.uiItemList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = var_5_0[arg_6_1 + 1]

			setText(arg_6_2:Find("Text"), var_6_0[1])
			setText(arg_6_2:Find("go/Text"), i18n("island_word_go"))
			onButton(arg_5_0, arg_6_2:Find("go"), function()
				arg_5_0:GetMsgBoxMgr():emit(IslandMediator.OPEN_PAGE, var_6_0[2][1], var_6_0[2][2])
				arg_5_0:Hide()
			end, SFX_PANEL)
		end
	end)
	arg_5_0.uiItemList:align(#var_5_0)
end

function var_0_0.FlushBtn(arg_8_0, arg_8_1)
	setActive(arg_8_0.cancelBtn, false)
end

return var_0_0
