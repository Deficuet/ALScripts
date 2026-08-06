GalleryConst = {}

local var_0_0 = GalleryConst

var_0_0.Version = 3
var_0_0.AutoScrollIndex = 41
var_0_0.NewCount = 15
var_0_0.CardStates = {
	Unlocked = 1
}
var_0_0.Sort_Order_Up = 0
var_0_0.Sort_Order_Down = 1
var_0_0.Filte_Normal_Value = 0
var_0_0.Filte_Like_Value = 1
var_0_0.Filte_Set_Normal_Value = 0
var_0_0.Filte_Set_Value = 1
var_0_0.CARD_PATH_PREFIX = "gallerypic/"
var_0_0.PIC_PATH_PREFIX = "gallerypic/"

function var_0_0.GetGalleryPicPathByID(arg_1_0)
	local var_1_0 = pg.gallery_config[arg_1_0]

	if not var_1_0 then
		return nil
	end

	local var_1_1 = var_1_0.illustration

	return var_0_0.PIC_PATH_PREFIX .. var_1_1
end

function var_0_0.GetGalleryPreviewPicPathByID(arg_2_0)
	local var_2_0 = pg.gallery_config[arg_2_0]

	if not var_2_0 then
		return nil
	end

	local var_2_1 = var_2_0.illustration .. "_t"

	return var_0_0.CARD_PATH_PREFIX .. var_2_1
end

function var_0_0.isGalleryLikeByID(arg_3_0)
	local var_3_0 = getProxy(AppreciateProxy):getGalleryLikeIDList()

	return table.contains(var_3_0, arg_3_0)
end

return var_0_0
