local var_0_0 = class("IslandDrawAwardAllWindow", import("Mod.Island.View.page.msgbox.window.IslandBaseMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandDrawAwardAllMsgBox"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:GetComponent(typeof(ItemList)).prefabItem:ToTable()

	for iter_2_0, iter_2_1 in ipairs({
		"rtTitle",
		"btnClose",
		"rtRarities"
	}) do
		arg_2_0[iter_2_1] = var_2_0[iter_2_0].transform
	end
end

function var_0_0.OnInit(arg_3_0)
	setText(arg_3_0.rtTitle, i18n("island_draw_reward"))
	onButton(arg_3_0, arg_3_0.btnClose, function()
		arg_3_0:Hide()
	end, SFX_CANCEL)
end

function var_0_0.OnShow(arg_5_0)
	var_0_0.super.OnShow(arg_5_0)
	arg_5_0:UpdateActivity(arg_5_0.settings.activity)
end

function var_0_0.UpdateActivity(arg_6_0, arg_6_1)
	arg_6_0.activity = arg_6_1

	eachChild(arg_6_0.rtRarities, function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_0.name
		local var_7_1 = arg_6_0.activity:GetRankList(var_7_0)

		setText(arg_7_0:Find("title/Text"), i18n("island_draw_" .. var_7_0))
		UIItemList.StaticAlign(arg_7_0:Find("container"), arg_7_0:Find("container/tpl"), #var_7_1, function(arg_8_0, arg_8_1, arg_8_2)
			arg_8_1 = arg_8_1 + 1

			if arg_8_0 == UIItemList.EventUpdate then
				local var_8_0, var_8_1 = unpack(var_7_1[arg_8_1])
				local var_8_2 = pg.island_draw_reward[var_8_0]
				local var_8_3 = Drop.New({
					type = var_8_2.drop_type,
					id = var_8_2.drop_id
				})

				IslandShopDrawAwardPage.ShowDropInfo(var_8_3, arg_8_2:Find("mask/Image"))
				setScrollText(arg_8_2:Find("name/Text"), var_8_3:getName())
				setText(arg_8_2:Find("got/got/Text"), i18n("island_draw_get"))
				setActive(arg_8_2:Find("got"), not var_8_1)
			end
		end)
	end)
end

return var_0_0
