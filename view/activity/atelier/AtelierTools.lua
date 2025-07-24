return {
	IsUnlockAtelier = function(arg_1_0, arg_1_1)
		local var_1_0 = arg_1_0:getConfig("config_client")[arg_1_1]
		local var_1_1 = tonumber(var_1_0.unlockStageID)
		local var_1_2 = var_1_0.unlockStoryID
		local var_1_3 = true

		if var_1_1 then
			local var_1_4 = getProxy(ChapterProxy)
			local var_1_5 = var_1_4:getChapterById(var_1_1, true)

			var_1_3 = var_1_5 and var_1_5:isClear() and var_1_4:getMapById(var_1_4:getLastMapForActivity())
		end

		if var_1_2 then
			var_1_3 = var_1_3 and pg.NewStoryMgr.GetInstance():IsPlayed(var_1_2)
		end

		return var_1_3
	end,
	UpdateYumiaItem = function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1:GetRarity()
		local var_2_1 = ItemRarity.Rarity2Print(var_2_0)

		GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_2_1, arg_2_0:Find("IconTpl/icon_bg"))
		GetImageSpriteFromAtlasAsync(arg_2_1:GetIconPath(), "", arg_2_0:Find("IconTpl/icon_bg/icon"))

		local var_2_2 = arg_2_1:GetProps()
		local var_2_3 = arg_2_0:Find("List")

		for iter_2_0 = 0, 3 do
			local var_2_4 = var_2_3:GetChild(iter_2_0)
			local var_2_5

			if table.contains(var_2_2, iter_2_0 + 1) then
				var_2_5 = AtelierFormulaCircle.ELEMENT_NAME[iter_2_0 + 1]
			else
				var_2_5 = AtelierFormulaCircle.ELEMENT_NAME[iter_2_0 + 1] .. "_2"
			end

			GetImageSpriteFromAtlasAsync("ui/ateliercommonyumiaui_atlas", var_2_5, var_2_4)
		end

		local var_2_6 = arg_2_1:GetCategory()

		if var_2_6 ~= 0 then
			GetImageSpriteFromAtlasAsync("ui/ateliercommonyumiaui_atlas", "category" .. var_2_6, arg_2_0:Find("categoryBg/category"))
		end

		setActive(arg_2_0:Find("categoryBg"), var_2_6 ~= 0)
		setText(arg_2_0:Find("cntText"), arg_2_1.count)
	end
}
