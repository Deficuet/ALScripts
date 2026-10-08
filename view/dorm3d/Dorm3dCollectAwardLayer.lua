local var_0_0 = class("Dorm3dCollectAwardLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dCollectAwardUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = var_0_0.super.getResource(arg_2_0)
	local var_2_1 = pg.dorm3d_collection_template[arg_2_0.contextData.itemId]

	table.insert(var_2_0, "dorm3dcollection/" .. var_2_1.icon)

	return var_2_0
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = pg.dorm3d_collection_template[arg_3_0.contextData.itemId]

	GetSpriteFromAtlasAsync("dorm3dcollection/" .. var_3_0.icon, "", function(arg_4_0)
		arg_3_0.iconSprite = arg_4_0

		arg_3_1()
	end)
end

function var_0_0.init(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("bg"), function()
		if arg_5_0.isBlock then
			return
		end

		arg_5_0:closeView()
	end, SFX_CANCEL)

	arg_5_0.isBlock = true

	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf)
end

function var_0_0.onBackPressed(arg_7_0)
	if arg_7_0.isBlock then
		return
	end

	var_0_0.super.onBackPressed(arg_7_0)
end

function var_0_0.didEnter(arg_8_0)
	local var_8_0 = pg.dorm3d_collection_template[arg_8_0.contextData.itemId]

	setText(arg_8_0._tf:Find("panel/name/Text"), var_8_0.name)
	setText(arg_8_0._tf:Find("panel/desc/content/desc"), var_8_0.desc)

	if var_8_0.award > 0 then
		local var_8_1 = pg.dorm3d_favor_trigger[var_8_0.award].num

		setText(arg_8_0._tf:Find("panel/favor/Text"), i18n("dorm3d_collect_favor_plus") .. var_8_1)
		setActive(arg_8_0._tf:Find("panel/favor"), arg_8_0.contextData.isNew)
	else
		setActive(arg_8_0._tf:Find("panel/favor"), false)
	end

	setImageSprite(arg_8_0._tf:Find("panel/icon"), GetSpriteFromAtlas("dorm3dcollection/" .. var_8_0.icon, ""), true)
	LeanTween.delayedCall(1.5, System.Action(function()
		arg_8_0.isBlock = false
	end))
end

function var_0_0.willExit(arg_10_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_10_0._tf)
end

return var_0_0
