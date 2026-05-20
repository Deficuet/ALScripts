local var_0_0 = class("GalleryConst")

var_0_0.Version = 3
var_0_0.AutoScrollIndex = 41
var_0_0.NewCount = 15
var_0_0.OPEN_FULL_SCREEN_PIC_VIEW = "GelleryConst:OPEN_FULL_SCREEN_PIC_VIEW"
var_0_0.CardStates = {
	DirectShow = 0,
	Unlocked = 1,
	Unlockable = 2,
	DisUnlockable = 3
}
var_0_0.DateIndex = {
	0
}
var_0_0.DateIndexName = {
	(i18n("res_pic_time_all"))
}
var_0_0.Data_All_Value = 0
var_0_0.Sort_Order_Up = 0
var_0_0.Sort_Order_Down = 1
var_0_0.Filte_Normal_Value = 0
var_0_0.Filte_Like_Value = 1
var_0_0.Loading_BG_NO_Filte = 0
var_0_0.Loading_BG_Filte = 1
var_0_0.CARD_PATH_PREFIX = "gallerypic/"
var_0_0.PIC_PATH_PREFIX = "gallerypic/"
var_0_0.Still_Show_On_Lock = 0
var_0_0.Set_BG_Func_Save_Tag = "set_bg_func_save"

function var_0_0.SetBGFuncTag(arg_1_0)
	if getProxy(PlayerProxy) then
		local var_1_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt(var_0_0.Set_BG_Func_Save_Tag .. var_1_0, arg_1_0 and 1 or 0)
	end
end

function var_0_0.GetBGFuncTag()
	if getProxy(PlayerProxy) then
		local var_2_0 = getProxy(PlayerProxy):getRawData().id

		return PlayerPrefs.GetInt(var_0_0.Set_BG_Func_Save_Tag .. var_2_0) == 1 and true or false
	end
end

function var_0_0.GetGalleryPicPathByID(arg_3_0)
	local var_3_0 = pg.gallery_config[arg_3_0]

	if not var_3_0 then
		return nil
	end

	local var_3_1 = var_3_0.illustration

	return var_0_0.PIC_PATH_PREFIX .. var_3_1
end

function var_0_0.GetGalleryPreviewPicPathByID(arg_4_0)
	local var_4_0 = pg.gallery_config[arg_4_0]

	if not var_4_0 then
		return nil
	end

	local var_4_1 = var_4_0.illustration .. "_t"

	return var_0_0.CARD_PATH_PREFIX .. var_4_1
end

return var_0_0
