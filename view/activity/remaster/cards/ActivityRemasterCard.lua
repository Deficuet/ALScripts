local var_0_0 = class("ActivityRemasterCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.doingTr = arg_1_0._tf:Find("doing")
	arg_1_0.finishTr = arg_1_0._tf:Find("finish")
	arg_1_0.finishTagTr = arg_1_0._tf:Find("finish_tag")
	arg_1_0.ico = arg_1_0._tf:Find("border/ico"):GetComponent(typeof(Image))
	arg_1_0.title = arg_1_0._tf:Find("border/title"):GetComponent(typeof(Image))
	arg_1_0.modelTxt = arg_1_0._tf:Find("border/model"):GetComponent(typeof(Text))
	arg_1_0.furTxt = arg_1_0._tf:Find("border/fur"):GetComponent(typeof(Text))
	arg_1_0.finishToggle = arg_1_0._tf:Find("finish_toggle")
	arg_1_0.uiShipList = UIItemList.New(arg_1_0._tf:Find("border/ships"), arg_1_0._tf:Find("border/ships/tpl"))

	setText(arg_1_0._tf:Find("border/label"), i18n("act_remaster_colllect_progress"))
end

function var_0_0.Update(arg_2_0, arg_2_1)
	arg_2_0.remasterData = arg_2_1

	arg_2_0:UpdateStyle(arg_2_1)
	arg_2_0:UpdateProgress(arg_2_1)
	arg_2_0:UpdateShips(arg_2_1)
end

function var_0_0.UpdateStyle(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1:IsFinish()
	local var_3_1 = arg_3_1:GetBanner()
	local var_3_2 = GetSpriteFromAtlas("ActivityRemaster/" .. var_3_1, "banner")
	local var_3_3 = GetSpriteFromAtlas("ActivityRemaster/" .. var_3_1, "title")

	arg_3_0.ico.sprite = var_3_2
	arg_3_0.title.sprite = var_3_3

	triggerToggle(arg_3_0.finishToggle, var_3_0)
end

function var_0_0.UpdateProgress(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:GetShipProgress()
	local var_4_1 = arg_4_1:GetShipTotalCnt()

	arg_4_0.modelTxt.text = var_4_0 .. "/" .. var_4_1

	local var_4_2 = arg_4_1:GetFurnitureProgress()
	local var_4_3 = arg_4_1:GetFurnitureTotalCnt()

	arg_4_0.furTxt.text = var_4_2 .. "/" .. var_4_3
end

function var_0_0.UpdateShips(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:GetCollectableShipIdList()

	arg_5_0.uiShipList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = var_5_0[arg_6_1 + 1]
			local var_6_1 = ShipGroup.getDefaultShipConfig(var_6_0).skin_id
			local var_6_2 = pg.ship_skin_template[var_6_1]

			GetImageSpriteFromAtlasAsync("shipYardIcon/" .. var_6_2.painting, var_6_2.painting, arg_6_2:Find("ico"))

			local var_6_3 = getProxy(CollectionProxy):getShipGroup(var_6_0)

			setActive(arg_6_2:Find("mask"), var_6_3)
		end
	end)
	arg_5_0.uiShipList:align(#var_5_0)
end

function var_0_0.Dispose(arg_7_0)
	return
end

return var_0_0
