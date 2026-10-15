ResPathSupport = {}

local var_0_0 = ResPathSupport

var_0_0.ConstPath = {}
var_0_0.ConstPath.BG = {}
var_0_0.ConstPath.BG.Base = "bg"
var_0_0.ConstPath.BG.CommonBG = "commonbg"
var_0_0.ConstPath.BG.ShipRarityBG = "bg/star_level_bg_%s%s"
var_0_0.ConstPath.BG.ShipRarityUI = "ui/star_level_bg_%s%s"
var_0_0.ConstPath.BG.ShipRarityEffect = "ui/al_bg02_%s"
var_0_0.ConstPath.BG.ShipCard = "bg/star_level_card_%s"
var_0_0.ConstPath.BG.ShipBGFixList = {
	"",
	"_0",
	"_1"
}
var_0_0.ConstPath.BG.LoadingBGList = {
	"loadingbg",
	"loadingbg_hx"
}
var_0_0.ConstPath.BG.LoadingBG = "loadingbg"
var_0_0.ConstPath.Sound = {}
var_0_0.ConstPath.Sound.Default = "cue/%s.b"
var_0_0.ConstPath.Sound.BGM = "cue/bgm-%s.b"
var_0_0.ConstPath.Painting = {}
var_0_0.ConstPath.Painting.Base = "painting/%s%s"
var_0_0.ConstPath.Painting.FixList = {
	"",
	"_blueprint",
	"_ex",
	"_hx",
	"_n",
	"_n_ex",
	"_n_hx",
	"_n_rw",
	"_pt_hx",
	"_rank",
	"_shophx",
	"_wjz",
	"_wjz_hx"
}
var_0_0.ConstPath.Painting.ShopFixList = {
	"",
	"_hx",
	"_shophx"
}
var_0_0.ConstPath.PaintingFace = {}
var_0_0.ConstPath.PaintingFace.Base = "paintingface/%s%s"
var_0_0.ConstPath.PaintingFace.FixList = {
	"",
	"_hx"
}
var_0_0.ConstPath.PaintingShipYardIcon = {}
var_0_0.ConstPath.PaintingShipYardIcon.Base = "shipyardicon/%s%s"
var_0_0.ConstPath.PaintingShipYardIcon.FixList = {
	"",
	"_hx"
}
var_0_0.ConstPath.PaintingSquareIcon = {}
var_0_0.ConstPath.PaintingSquareIcon.Base = "squareicon/%s%s"
var_0_0.ConstPath.PaintingSquareIcon.FixList = {
	"",
	"_hx"
}
var_0_0.ConstPath.PaintingHeroHrzIcon = {}
var_0_0.ConstPath.PaintingHeroHrzIcon.Base = "herohrzicon/%s%s"
var_0_0.ConstPath.PaintingHeroHrzIcon.FixList = {
	"",
	"_hx"
}
var_0_0.ConstPath.Live2D = {}
var_0_0.ConstPath.Live2D.Base = "live2d/%s%s"
var_0_0.ConstPath.Live2D.FixList = {
	"",
	"_hx"
}
var_0_0.ConstPath.SpinePainting = {}
var_0_0.ConstPath.SpinePainting.Base = "spinepainting/%s%s"
var_0_0.ConstPath.SpinePainting.FixList = {
	"",
	"_hx"
}
var_0_0.ConstPath.SpineChar = {}
var_0_0.ConstPath.SpineChar.Base = "char/%s%s"
var_0_0.ConstPath.SpineChar.FixList = {
	"",
	"_hx",
	"_l",
	"_r"
}
var_0_0.ConstPath.SpineQIcon = {}
var_0_0.ConstPath.SpineQIcon.Base = "qicon/%s%s"
var_0_0.ConstPath.SpineQIcon.FixList = {
	"",
	"_hx",
	"_l",
	"_r"
}
var_0_0.ConstPath.SpineModel = {}
var_0_0.ConstPath.SpineModel.Base = "shipmodels/%s%s"
var_0_0.ConstPath.SpineModel.FixList = {
	"",
	"_hx",
	"_l",
	"_r"
}
var_0_0.ConstPath.Ship = {}
var_0_0.ConstPath.Ship.Rarity = {}
var_0_0.ConstPath.Ship.Rarity.NewShipBG = "newshipbg/bg_%s"
var_0_0.ConstPath.Ship.Rarity.EffectDesign = "raritydesign/%s"
var_0_0.ConstPath.Ship.Rarity.EffectMeta = "raritymeta/%s"
var_0_0.ConstPath.Ship.Rarity.ShipRarity = "shiprarity/%s%s%s"
var_0_0.ConstPath.Ship.Rarity.ShipRarityFixList1 = {
	"",
	"0",
	"1"
}
var_0_0.ConstPath.Ship.Rarity.ShipRarityFixList2 = {
	"m",
	"s"
}
var_0_0.ConstPath.Ship.Rarity.GetRole = "ui/getrole_%s%s"
var_0_0.ConstPath.Ship.Rarity.GetRoleFixList = {
	"",
	"_1",
	"_2"
}
var_0_0.ConstPath.Ship.Nation = {}
var_0_0.ConstPath.Ship.Nation.Prints = "prints/%s%s"
var_0_0.ConstPath.Ship.Nation.PrintsFixList = {
	"_0"
}
var_0_0.ConstPath.Commander = {}
var_0_0.ConstPath.Commander.CommanderHrz = "commanderhrz"
var_0_0.ConstPath.Commander.CommanderSkillIcon = "commanderskillicon"
var_0_0.ConstPath.Equipment = {}
var_0_0.ConstPath.Equipment.Equip = "equips"
var_0_0.ConstPath.LevelMap = "levelmap"
var_0_0.ConstPath.ChapterPic = "chapter/pic"
var_0_0.ConstPath.Enemies = "enemies"
var_0_0.ConstPath.StrategyIcon = "strategyicon"
var_0_0.ConstPath.FurnitureIcon = "furnitureicon"
var_0_0.ConstPath.UI = {}
var_0_0.ConstPath.UI.Base = "ui"
var_0_0.ConstPath.UI.Atlas = "_atlas"
var_0_0.ConstPath.UI.LivingAreaCover = "livingareacover"
var_0_0.ConstPath.UI.ActivityBanner = "activitybanner"
var_0_0.ConstPath.UI.LinkButton = "linkbutton"
var_0_0.ConstPath.UI.ShipSkillIcon = "skillicon"
var_0_0.ConstPath.UI.Effect = "effect"
var_0_0.ConstPath.UI.ShipModelBuliding = "ui/shipmodelbuliding"
var_0_0.ConstPath.UI.BuildPainting = "ui/buildpainting"
var_0_0.ConstPath.UI.IconFrame = "iconframe"

function var_0_0.MergeLuaArr(...)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in pairs({
		...
	}) do
		if iter_1_1 then
			for iter_1_2 = 1, #iter_1_1 do
				var_1_0[#var_1_0 + 1] = iter_1_1[iter_1_2]
			end
		end
	end

	return var_1_0
end

function var_0_0.UniqueLuaArr(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = {}

	if arg_2_0 then
		for iter_2_0 = 1, #arg_2_0 do
			local var_2_2 = arg_2_0[iter_2_0]

			if var_2_2 and var_2_2 ~= "" and not var_2_1[var_2_2] then
				var_2_1[var_2_2] = true
				var_2_0[#var_2_0 + 1] = var_2_2
			end
		end
	end

	return var_2_0
end

function var_0_0.CombinePath(...)
	local var_3_0 = {
		...
	}

	return table.concat(var_3_0, "/")
end

function var_0_0.GetSoundResList(arg_4_0)
	local var_4_0 = {
		var_0_0.ConstPath.Sound.Default,
		var_0_0.ConstPath.Sound.BGM
	}
	local var_4_1 = {}

	if arg_4_0 and #arg_4_0 > 0 then
		_.each(var_4_0, function(arg_5_0)
			table.insert(var_4_1, string.format(arg_5_0, arg_4_0))
		end)
	end

	return var_4_1
end

function var_0_0.GetShipRarityBgList(arg_6_0)
	local var_6_0 = pg.ship_data_statistics[arg_6_0].rarity
	local var_6_1 = {
		var_6_0,
		var_6_0 + 1
	}
	local var_6_2 = var_0_0.ConstPath.BG.ShipBGFixList
	local var_6_3 = {
		var_0_0.ConstPath.BG.ShipRarityBG,
		var_0_0.ConstPath.BG.ShipRarityUI
	}
	local var_6_4 = {}

	_.each(var_6_3, function(arg_7_0)
		_.each(var_6_1, function(arg_8_0)
			local var_8_0 = shipRarity2bgPrint(arg_8_0, false, false)

			_.each(var_6_2, function(arg_9_0)
				table.insert(var_6_4, string.lower(string.format(arg_7_0, var_8_0, arg_9_0)))
			end)
		end)
	end)
	_.each(var_6_1, function(arg_10_0)
		if arg_10_0 > 2 then
			table.insert(var_6_4, string.lower(string.format(var_0_0.ConstPath.BG.ShipRarityEffect, arg_10_0 - 1)))
		end
	end)

	return var_6_4
end

function var_0_0.GetShipSkinBgList(arg_11_0)
	local var_11_0 = pg.ship_skin_template[arg_11_0]
	local var_11_1 = {
		var_11_0.bg_sp,
		var_11_0.bg,
		var_11_0.rarity_bg
	}
	local var_11_2 = {
		var_0_0.ConstPath.BG.ShipRarityBG,
		var_0_0.ConstPath.BG.ShipRarityUI
	}
	local var_11_3 = {}

	_.each(var_11_2, function(arg_12_0)
		_.each(var_11_1, function(arg_13_0)
			if arg_13_0 and #arg_13_0 > 0 then
				table.insert(var_11_3, string.lower(string.format(arg_12_0, arg_13_0, "")))
			end
		end)
	end)

	return var_11_3
end

function var_0_0.GetSkillIconList(arg_14_0)
	local var_14_0 = var_0_0.ConstPath.UI.ShipSkillIcon
	local var_14_1 = pg.ship_data_template[arg_14_0].buff_list_display
	local var_14_2 = {}

	_.each(var_14_1, function(arg_15_0)
		local var_15_0 = getSkillConfig(arg_15_0)
		local var_15_1 = tostring(var_15_0.icon)

		if var_15_1 and #var_15_1 > 0 then
			local var_15_2 = var_0_0.CombinePath(var_14_0, var_15_1)
			local var_15_3 = string.lower(var_15_2)

			table.insert(var_14_2, var_15_3)
		end
	end)

	return var_14_2
end

function var_0_0.GetSpineCharListByPrefabName(arg_16_0)
	local var_16_0 = var_0_0.ConstPath.SpineChar.Base
	local var_16_1 = var_0_0.ConstPath.SpineChar.FixList
	local var_16_2 = {}

	if arg_16_0 and #arg_16_0 > 0 then
		_.each(var_16_1, function(arg_17_0)
			table.insert(var_16_2, string.lower(string.format(var_16_0, arg_16_0, arg_17_0)))
		end)
	end

	return var_16_2
end

function var_0_0.GetSpineQIconListByPrefabName(arg_18_0)
	local var_18_0 = var_0_0.ConstPath.SpineQIcon.Base
	local var_18_1 = var_0_0.ConstPath.SpineQIcon.FixList
	local var_18_2 = {}

	if arg_18_0 and #arg_18_0 > 0 then
		_.each(var_18_1, function(arg_19_0)
			table.insert(var_18_2, string.lower(string.format(var_18_0, arg_18_0, arg_19_0)))
		end)
	end

	return var_18_2
end

function var_0_0.GetSpineModelsByPrefabName(arg_20_0)
	local var_20_0 = var_0_0.ConstPath.SpineModel.Base
	local var_20_1 = var_0_0.ConstPath.SpineModel.FixList
	local var_20_2 = {}

	if arg_20_0 and #arg_20_0 > 0 then
		_.each(var_20_1, function(arg_21_0)
			table.insert(var_20_2, string.lower(string.format(var_20_0, arg_20_0, arg_21_0)))
		end)
	end

	return var_20_2
end

function var_0_0.GetPaintingListByPaintingName(arg_22_0)
	local var_22_0 = var_0_0.ConstPath.Painting.Base
	local var_22_1 = var_0_0.ConstPath.Painting.FixList
	local var_22_2 = {}

	if arg_22_0 and #arg_22_0 > 0 then
		_.each(var_22_1, function(arg_23_0)
			local var_23_0 = string.lower(string.format(var_22_0, arg_22_0, arg_23_0))

			table.insert(var_22_2, var_23_0)
		end)
	end

	return var_22_2
end

function var_0_0.GetShopPaintingListByPaintingName(arg_24_0)
	local var_24_0 = var_0_0.ConstPath.Painting.Base
	local var_24_1 = var_0_0.ConstPath.Painting.ShopFixList
	local var_24_2 = {}

	if arg_24_0 and #arg_24_0 > 0 then
		_.each(var_24_1, function(arg_25_0)
			local var_25_0 = string.lower(string.format(var_24_0, arg_24_0, arg_25_0))

			table.insert(var_24_2, var_25_0)
		end)
	end

	return var_24_2
end

function var_0_0.GetPaintingFaceListByPaintingName(arg_26_0)
	local var_26_0 = var_0_0.ConstPath.PaintingFace.Base
	local var_26_1 = var_0_0.ConstPath.PaintingFace.FixList
	local var_26_2 = {}

	if arg_26_0 and #arg_26_0 > 0 then
		_.each(var_26_1, function(arg_27_0)
			table.insert(var_26_2, string.lower(string.format(var_26_0, arg_26_0, arg_27_0)))
		end)
	end

	return var_26_2
end

function var_0_0.GetPaintingShipYardIconListByPaintingName(arg_28_0)
	local var_28_0 = var_0_0.ConstPath.PaintingShipYardIcon.Base
	local var_28_1 = var_0_0.ConstPath.PaintingShipYardIcon.FixList
	local var_28_2 = {}

	if arg_28_0 and #arg_28_0 > 0 then
		_.each(var_28_1, function(arg_29_0)
			table.insert(var_28_2, string.lower(string.format(var_28_0, arg_28_0, arg_29_0)))
		end)
	end

	return var_28_2
end

function var_0_0.GetPaintingSquareIconListByPaintingName(arg_30_0)
	local var_30_0 = var_0_0.ConstPath.PaintingSquareIcon.Base
	local var_30_1 = var_0_0.ConstPath.PaintingSquareIcon.FixList
	local var_30_2 = {}

	if arg_30_0 and #arg_30_0 > 0 then
		_.each(var_30_1, function(arg_31_0)
			table.insert(var_30_2, string.lower(string.format(var_30_0, arg_30_0, arg_31_0)))
		end)
	end

	return var_30_2
end

function var_0_0.GetPaintingHeroHrzIconListByPaintingName(arg_32_0)
	local var_32_0 = var_0_0.ConstPath.PaintingHeroHrzIcon.Base
	local var_32_1 = var_0_0.ConstPath.PaintingHeroHrzIcon.FixList
	local var_32_2 = {}

	if arg_32_0 and #arg_32_0 > 0 then
		_.each(var_32_1, function(arg_33_0)
			table.insert(var_32_2, string.lower(string.format(var_32_0, arg_32_0, arg_33_0)))
		end)
	end

	return var_32_2
end

function var_0_0.GetShipSkinPaintingList(arg_34_0)
	local var_34_0 = pg.ship_skin_template[arg_34_0].painting

	return var_0_0.GetPaintingListByPaintingName(var_34_0)
end

function var_0_0.GetShipSkinPaintingFaceList(arg_35_0)
	local var_35_0 = pg.ship_skin_template[arg_35_0].painting

	return var_0_0.GetPaintingFaceListByPaintingName(var_35_0)
end

function var_0_0.GetShipSkinPaintingShipYardIconList(arg_36_0)
	local var_36_0 = pg.ship_skin_template[arg_36_0].painting

	return var_0_0.GetPaintingShipYardIconListByPaintingName(var_36_0)
end

function var_0_0.GetShipSkinPaintingSquareIconList(arg_37_0)
	local var_37_0 = pg.ship_skin_template[arg_37_0].painting

	return var_0_0.GetPaintingSquareIconListByPaintingName(var_37_0)
end

function var_0_0.GetShipSkinPaintingHeroHrzIconList(arg_38_0)
	local var_38_0 = pg.ship_skin_template[arg_38_0].painting

	return var_0_0.GetPaintingHeroHrzIconListByPaintingName(var_38_0)
end

function var_0_0.GetShipSkinSpineQIconList(arg_39_0)
	local var_39_0 = var_0_0.ConstPath.SpineQIcon.Base
	local var_39_1 = var_0_0.ConstPath.SpineQIcon.FixList
	local var_39_2 = pg.ship_skin_template[arg_39_0].painting
	local var_39_3 = {}

	_.each(var_39_1, function(arg_40_0)
		table.insert(var_39_3, string.format(var_39_0, var_39_2, arg_40_0))
	end)

	return var_39_3
end

function var_0_0.GetShipSkinSpineShipModelList(arg_41_0)
	local var_41_0 = var_0_0.ConstPath.SpineModel.Base
	local var_41_1 = var_0_0.ConstPath.SpineModel.FixList
	local var_41_2 = pg.ship_skin_template[arg_41_0].painting
	local var_41_3 = {}

	_.each(var_41_1, function(arg_42_0)
		table.insert(var_41_3, string.format(var_41_0, var_41_2, arg_42_0))
	end)

	return var_41_3
end

function var_0_0.GetShipSkinSpineCharList(arg_43_0)
	local var_43_0 = var_0_0.ConstPath.SpineChar.Base
	local var_43_1 = var_0_0.ConstPath.SpineChar.FixList
	local var_43_2 = pg.ship_skin_template[arg_43_0].painting
	local var_43_3 = {}

	_.each(var_43_1, function(arg_44_0)
		table.insert(var_43_3, string.format(var_43_0, var_43_2, arg_44_0))
	end)

	return var_43_3
end

function var_0_0.GetShipSkinLive2DListByPaintingName(arg_45_0)
	local var_45_0 = var_0_0.ConstPath.Live2D.Base
	local var_45_1 = var_0_0.ConstPath.Live2D.FixList
	local var_45_2 = {}

	if arg_45_0 and #arg_45_0 > 0 then
		_.each(var_45_1, function(arg_46_0)
			table.insert(var_45_2, string.format(var_45_0, arg_45_0, arg_46_0))
		end)
	end

	return var_45_2
end

function var_0_0.GetShipSkinLive2DList(arg_47_0)
	local var_47_0 = pg.ship_skin_template[arg_47_0].painting

	return var_0_0.GetShipSkinLive2DListByPaintingName(var_47_0)
end

function var_0_0.GetShipSkinSpinePaintingList(arg_48_0)
	local var_48_0 = var_0_0.ConstPath.SpinePainting.Base
	local var_48_1 = var_0_0.ConstPath.SpinePainting.FixList
	local var_48_2 = pg.ship_skin_template[arg_48_0].painting
	local var_48_3 = {}

	_.each(var_48_1, function(arg_49_0)
		table.insert(var_48_3, string.format(var_48_0, var_48_2, arg_49_0))
	end)

	return var_48_3
end

function var_0_0.GetShipSkinEffectList(arg_50_0)
	local var_50_0 = var_0_0.ConstPath.UI.Base
	local var_50_1 = {}
	local var_50_2 = pg.ship_skin_template[arg_50_0]

	if var_50_2.special_effects and #var_50_2.special_effects > 0 then
		local var_50_3 = var_50_2.special_effects[1]

		table.insert(var_50_1, var_0_0.CombinePath(var_50_0, var_50_3))
	end

	return var_50_1
end

function var_0_0.GetShipSkinSoundList(arg_51_0)
	local var_51_0 = pg.ship_skin_template[arg_51_0].bgm
	local var_51_1 = {}

	if var_51_0 and #var_51_0 > 0 then
		var_51_1 = var_0_0.GetSoundResList(var_51_0)
	end

	return var_51_1
end

function var_0_0.GetShipAllRes(arg_52_0)
	local var_52_0 = arg_52_0.configId
	local var_52_1 = arg_52_0:getSkinId()
	local var_52_2 = {
		"spinematerials",
		"ui/lihui_qiehuan01",
		"ui/lihui_qiehuan02",
		"effect/jiehuntexiao"
	}
	local var_52_3 = var_0_0.GetShipRarityBgList(var_52_0)
	local var_52_4 = var_0_0.GetShipSkinBgList(var_52_1)
	local var_52_5 = var_0_0.GetSkillIconList(var_52_0)
	local var_52_6 = var_0_0.GetShipSkinSoundList(var_52_1)
	local var_52_7 = var_0_0.GetShipSkinSpineQIconList(var_52_1)
	local var_52_8 = var_0_0.GetShipSkinSpineShipModelList(var_52_1)
	local var_52_9 = var_0_0.GetShipSkinSpineCharList(var_52_1)
	local var_52_10 = var_0_0.GetShipSkinSpinePaintingList(var_52_1)
	local var_52_11 = var_0_0.GetShipSkinPaintingList(var_52_1)
	local var_52_12 = var_0_0.GetShipSkinPaintingFaceList(var_52_1)
	local var_52_13 = var_0_0.GetShipSkinPaintingShipYardIconList(var_52_1)
	local var_52_14 = var_0_0.GetShipSkinPaintingSquareIconList(var_52_1)
	local var_52_15 = var_0_0.GetShipSkinPaintingHeroHrzIconList(var_52_1)
	local var_52_16 = var_0_0.GetShipSkinEffectList(var_52_1)

	return (var_0_0.MergeLuaArr(var_52_2, var_52_3, var_52_4, var_52_5, var_52_6, var_52_7, var_52_8, var_52_9, var_52_10, var_52_11, var_52_12, var_52_13, var_52_14, var_52_15, var_52_16))
end
