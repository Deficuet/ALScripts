ResPathSupport = {}

local var_0_0 = ResPathSupport

var_0_0.ConstPath = {}
var_0_0.ConstPath.BG = {}
var_0_0.ConstPath.BG.CommonBG = "commonbg"
var_0_0.ConstPath.BG.ShipRarityBG = "bg/star_level_bg_%s%s"
var_0_0.ConstPath.BG.ShipRarityUI = "ui/star_level_bg_%s%s"
var_0_0.ConstPath.BG.ShipBGFixList = {
	"",
	"_0",
	"_1"
}
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
var_0_0.ConstPath.UI = {}
var_0_0.ConstPath.UI.Base = "ui"
var_0_0.ConstPath.UI.LivingAreaCover = "livingareacover"
var_0_0.ConstPath.UI.ActivityBanner = "activitybanner"
var_0_0.ConstPath.UI.LinkButton = "linkbutton"
var_0_0.ConstPath.UI.ShipSkillIcon = "skillicon"

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

function var_0_0.CombinePath(...)
	local var_2_0 = {
		...
	}

	return table.concat(var_2_0, "/")
end

function var_0_0.GetSoundResList(arg_3_0)
	local var_3_0 = {
		var_0_0.ConstPath.Sound.Default,
		var_0_0.ConstPath.Sound.BGM
	}
	local var_3_1 = {}

	if arg_3_0 and #arg_3_0 > 0 then
		_.each(var_3_0, function(arg_4_0)
			table.insert(var_3_1, string.format(arg_4_0, arg_3_0))
		end)
	end

	return var_3_1
end

function var_0_0.GetShipRarityBgList(arg_5_0)
	local var_5_0 = pg.ship_data_statistics[arg_5_0].rarity
	local var_5_1 = {
		var_5_0,
		var_5_0 + 1
	}
	local var_5_2 = var_0_0.ConstPath.BG.ShipBGFixList
	local var_5_3 = {
		var_0_0.ConstPath.BG.ShipRarityBG,
		var_0_0.ConstPath.BG.ShipRarityUI
	}
	local var_5_4 = {}

	_.each(var_5_3, function(arg_6_0)
		_.each(var_5_1, function(arg_7_0)
			_.each(var_5_2, function(arg_8_0)
				table.insert(var_5_4, string.lower(string.format(arg_6_0, arg_7_0, arg_8_0)))
			end)
		end)
	end)

	return var_5_4
end

function var_0_0.GetShipSkinBgList(arg_9_0)
	local var_9_0 = pg.ship_skin_template[arg_9_0]
	local var_9_1 = {
		var_9_0.bg_sp,
		var_9_0.bg,
		var_9_0.rarity_bg
	}
	local var_9_2 = {
		var_0_0.ConstPath.BG.ShipRarityBG,
		var_0_0.ConstPath.BG.ShipRarityUI
	}
	local var_9_3 = {}

	_.each(var_9_2, function(arg_10_0)
		_.each(var_9_1, function(arg_11_0)
			if arg_11_0 and #arg_11_0 > 0 then
				table.insert(var_9_3, string.lower(string.format(arg_10_0, arg_11_0, "")))
			end
		end)
	end)

	return var_9_3
end

function var_0_0.GetSkillIconList(arg_12_0)
	local var_12_0 = var_0_0.ConstPath.UI.ShipSkillIcon
	local var_12_1 = pg.ship_data_template[arg_12_0].buff_list_display
	local var_12_2 = {}

	_.each(var_12_1, function(arg_13_0)
		local var_13_0 = getSkillConfig(arg_13_0)
		local var_13_1 = tostring(var_13_0.icon)

		if var_13_1 and #var_13_1 > 0 then
			local var_13_2 = var_0_0.CombinePath(var_12_0, var_13_1)
			local var_13_3 = string.lower(var_13_2)

			table.insert(var_12_2, var_13_3)
		end
	end)

	return var_12_2
end

function var_0_0.GetSpineCharListByPrefabName(arg_14_0)
	local var_14_0 = var_0_0.ConstPath.SpineChar.Base
	local var_14_1 = var_0_0.ConstPath.SpineChar.FixList
	local var_14_2 = {}

	if arg_14_0 and #arg_14_0 > 0 then
		_.each(var_14_1, function(arg_15_0)
			table.insert(var_14_2, string.lower(string.format(var_14_0, arg_14_0, arg_15_0)))
		end)
	end

	return var_14_2
end

function var_0_0.GetSpineQIconListByPrefabName(arg_16_0)
	local var_16_0 = var_0_0.ConstPath.SpineQIcon.Base
	local var_16_1 = var_0_0.ConstPath.SpineQIcon.FixList
	local var_16_2 = {}

	if arg_16_0 and #arg_16_0 > 0 then
		_.each(var_16_1, function(arg_17_0)
			table.insert(var_16_2, string.lower(string.format(var_16_0, arg_16_0, arg_17_0)))
		end)
	end

	return var_16_2
end

function var_0_0.GetSpineModelsByPrefabName(arg_18_0)
	local var_18_0 = var_0_0.ConstPath.SpineModel.Base
	local var_18_1 = var_0_0.ConstPath.SpineModel.FixList
	local var_18_2 = {}

	if arg_18_0 and #arg_18_0 > 0 then
		_.each(var_18_1, function(arg_19_0)
			table.insert(var_18_2, string.lower(string.format(var_18_0, arg_18_0, arg_19_0)))
		end)
	end

	return var_18_2
end

function var_0_0.GetPaintingListByPaintingName(arg_20_0)
	local var_20_0 = var_0_0.ConstPath.Painting.Base
	local var_20_1 = var_0_0.ConstPath.Painting.FixList
	local var_20_2 = {}

	if arg_20_0 and #arg_20_0 > 0 then
		_.each(var_20_1, function(arg_21_0)
			table.insert(var_20_2, string.lower(string.format(var_20_0, arg_20_0, arg_21_0)))
		end)
	end

	return var_20_2
end

function var_0_0.GetPaintingFaceListByPaintingName(arg_22_0)
	local var_22_0 = var_0_0.ConstPath.PaintingFace.Base
	local var_22_1 = var_0_0.ConstPath.PaintingFace.FixList
	local var_22_2 = {}

	if arg_22_0 and #arg_22_0 > 0 then
		_.each(var_22_1, function(arg_23_0)
			table.insert(var_22_2, string.lower(string.format(var_22_0, arg_22_0, arg_23_0)))
		end)
	end

	return var_22_2
end

function var_0_0.GetPaintingShipYardIconListByPaintingName(arg_24_0)
	local var_24_0 = var_0_0.ConstPath.PaintingShipYardIcon.Base
	local var_24_1 = var_0_0.ConstPath.PaintingShipYardIcon.FixList
	local var_24_2 = {}

	if arg_24_0 and #arg_24_0 > 0 then
		_.each(var_24_1, function(arg_25_0)
			table.insert(var_24_2, string.lower(string.format(var_24_0, arg_24_0, arg_25_0)))
		end)
	end

	return var_24_2
end

function var_0_0.GetPaintingSquareIconListByPaintingName(arg_26_0)
	local var_26_0 = var_0_0.ConstPath.PaintingSquareIcon.Base
	local var_26_1 = var_0_0.ConstPath.PaintingSquareIcon.FixList
	local var_26_2 = {}

	if arg_26_0 and #arg_26_0 > 0 then
		_.each(var_26_1, function(arg_27_0)
			table.insert(var_26_2, string.lower(string.format(var_26_0, arg_26_0, arg_27_0)))
		end)
	end

	return var_26_2
end

function var_0_0.GetPaintingHeroHrzIconListByPaintingName(arg_28_0)
	local var_28_0 = var_0_0.ConstPath.PaintingHeroHrzIcon.Base
	local var_28_1 = var_0_0.ConstPath.PaintingHeroHrzIcon.FixList
	local var_28_2 = {}

	if arg_28_0 and #arg_28_0 > 0 then
		_.each(var_28_1, function(arg_29_0)
			table.insert(var_28_2, string.lower(string.format(var_28_0, arg_28_0, arg_29_0)))
		end)
	end

	return var_28_2
end

function var_0_0.GetShipSkinPaintingList(arg_30_0)
	local var_30_0 = pg.ship_skin_template[arg_30_0].painting

	return var_0_0.GetPaintingListByPaintingName(var_30_0)
end

function var_0_0.GetShipSkinPaintingFaceList(arg_31_0)
	local var_31_0 = pg.ship_skin_template[arg_31_0].painting

	return var_0_0.GetPaintingFaceListByPaintingName(var_31_0)
end

function var_0_0.GetShipSkinPaintingShipYardIconList(arg_32_0)
	local var_32_0 = pg.ship_skin_template[arg_32_0].painting

	return var_0_0.GetPaintingShipYardIconListByPaintingName(var_32_0)
end

function var_0_0.GetShipSkinPaintingSquareIconList(arg_33_0)
	local var_33_0 = pg.ship_skin_template[arg_33_0].painting

	return var_0_0.GetPaintingSquareIconListByPaintingName(var_33_0)
end

function var_0_0.GetShipSkinPaintingHeroHrzIconList(arg_34_0)
	local var_34_0 = pg.ship_skin_template[arg_34_0].painting

	return var_0_0.GetPaintingHeroHrzIconListByPaintingName(var_34_0)
end

function var_0_0.GetShipSkinSpineQIconList(arg_35_0)
	local var_35_0 = var_0_0.ConstPath.SpineQIcon.Base
	local var_35_1 = var_0_0.ConstPath.SpineQIcon.FixList
	local var_35_2 = pg.ship_skin_template[arg_35_0].painting
	local var_35_3 = {}

	_.each(var_35_1, function(arg_36_0)
		table.insert(var_35_3, string.format(var_35_0, var_35_2, arg_36_0))
	end)

	return var_35_3
end

function var_0_0.GetShipSkinSpineShipModelList(arg_37_0)
	local var_37_0 = var_0_0.ConstPath.SpineModel.Base
	local var_37_1 = var_0_0.ConstPath.SpineModel.FixList
	local var_37_2 = pg.ship_skin_template[arg_37_0].painting
	local var_37_3 = {}

	_.each(var_37_1, function(arg_38_0)
		table.insert(var_37_3, string.format(var_37_0, var_37_2, arg_38_0))
	end)

	return var_37_3
end

function var_0_0.GetShipSkinSpineCharList(arg_39_0)
	local var_39_0 = var_0_0.ConstPath.SpineChar.Base
	local var_39_1 = var_0_0.ConstPath.SpineChar.FixList
	local var_39_2 = pg.ship_skin_template[arg_39_0].painting
	local var_39_3 = {}

	_.each(var_39_1, function(arg_40_0)
		table.insert(var_39_3, string.format(var_39_0, var_39_2, arg_40_0))
	end)

	return var_39_3
end

function var_0_0.GetShipSkinLive2DList(arg_41_0)
	local var_41_0 = var_0_0.ConstPath.Live2D.Base
	local var_41_1 = var_0_0.ConstPath.Live2D.FixList
	local var_41_2 = pg.ship_skin_template[arg_41_0].painting
	local var_41_3 = {}

	_.each(var_41_1, function(arg_42_0)
		table.insert(var_41_3, string.format(var_41_0, var_41_2, arg_42_0))
	end)

	return var_41_3
end

function var_0_0.GetShipSkinSpinePaintingList(arg_43_0)
	local var_43_0 = var_0_0.ConstPath.SpinePainting.Base
	local var_43_1 = var_0_0.ConstPath.SpinePainting.FixList
	local var_43_2 = pg.ship_skin_template[arg_43_0].painting
	local var_43_3 = {}

	_.each(var_43_1, function(arg_44_0)
		table.insert(var_43_3, string.format(var_43_0, var_43_2, arg_44_0))
	end)

	return var_43_3
end

function var_0_0.GetShipSkinEffectList(arg_45_0)
	local var_45_0 = var_0_0.ConstPath.UI.Base
	local var_45_1 = {}
	local var_45_2 = pg.ship_skin_template[arg_45_0]

	if var_45_2.special_effects and #var_45_2.special_effects > 0 then
		local var_45_3 = var_45_2.special_effects[1]

		table.insert(var_45_1, var_0_0.CombinePath(var_45_0, var_45_3))
	end

	return var_45_1
end

function var_0_0.GetShipSkinSoundList(arg_46_0)
	local var_46_0 = pg.ship_skin_template[arg_46_0].bgm
	local var_46_1 = {}

	if var_46_0 and #var_46_0 > 0 then
		var_46_1 = var_0_0.GetSoundResList(var_46_0)
	end

	return var_46_1
end

function var_0_0.GetShipAllRes(arg_47_0)
	local var_47_0 = arg_47_0.configId
	local var_47_1 = arg_47_0:getSkinId()
	local var_47_2 = {
		"spinematerials",
		"ui/lihui_qiehuan01",
		"ui/lihui_qiehuan02",
		"effect/jiehuntexiao"
	}
	local var_47_3 = var_0_0.GetShipRarityBgList(var_47_0)
	local var_47_4 = var_0_0.GetShipSkinBgList(var_47_1)
	local var_47_5 = var_0_0.GetSkillIconList(var_47_0)
	local var_47_6 = var_0_0.GetShipSkinSoundList(var_47_1)
	local var_47_7 = var_0_0.GetShipSkinSpineQIconList(var_47_1)
	local var_47_8 = var_0_0.GetShipSkinSpineShipModelList(var_47_1)
	local var_47_9 = var_0_0.GetShipSkinSpineCharList(var_47_1)
	local var_47_10 = var_0_0.GetShipSkinSpinePaintingList(var_47_1)
	local var_47_11 = var_0_0.GetShipSkinPaintingList(var_47_1)
	local var_47_12 = var_0_0.GetShipSkinPaintingFaceList(var_47_1)
	local var_47_13 = var_0_0.GetShipSkinPaintingShipYardIconList(var_47_1)
	local var_47_14 = var_0_0.GetShipSkinPaintingSquareIconList(var_47_1)
	local var_47_15 = var_0_0.GetShipSkinPaintingHeroHrzIconList(var_47_1)
	local var_47_16 = var_0_0.GetShipSkinEffectList(var_47_1)

	return (var_0_0.MergeLuaArr(var_47_2, var_47_3, var_47_4, var_47_5, var_47_6, var_47_7, var_47_8, var_47_9, var_47_10, var_47_11, var_47_12, var_47_13, var_47_14, var_47_15, var_47_16))
end
