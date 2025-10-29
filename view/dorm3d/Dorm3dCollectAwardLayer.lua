local var_0_0 = class("Dorm3dCollectAwardLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dCollectAwardUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = pg.dorm3d_collection_template[arg_2_0.contextData.itemId]

	GetSpriteFromAtlasAsync("dorm3dcollection/" .. var_2_0.icon, "", function(arg_3_0)
		arg_2_0.iconSprite = arg_3_0

		arg_2_1()
	end)
end

function var_0_0.init(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf:Find("bg"), function()
		if arg_4_0.isBlock then
			return
		end

		arg_4_0:closeView()
	end, SFX_CANCEL)

	arg_4_0.isBlock = true

	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
end

function var_0_0.onBackPressed(arg_6_0)
	if arg_6_0.isBlock then
		return
	end

	var_0_0.super.onBackPressed(arg_6_0)
end

function var_0_0.didEnter(arg_7_0)
	local var_7_0 = pg.dorm3d_collection_template[arg_7_0.contextData.itemId]

	setText(arg_7_0._tf:Find("panel/name/Text"), var_7_0.name)
	setText(arg_7_0._tf:Find("panel/desc/content/desc"), var_7_0.desc)

	if var_7_0.award > 0 then
		local var_7_1 = pg.dorm3d_favor_trigger[var_7_0.award].num

		setText(arg_7_0._tf:Find("panel/favor/Text"), i18n("dorm3d_collect_favor_plus") .. var_7_1)
		setActive(arg_7_0._tf:Find("panel/favor"), arg_7_0.contextData.isNew)
	else
		setActive(arg_7_0._tf:Find("panel/favor"), false)
	end

	setImageSprite(arg_7_0._tf:Find("panel/icon"), arg_7_0.iconSprite, true)
	LeanTween.delayedCall(1.5, System.Action(function()
		arg_7_0.isBlock = false
	end))
end

function var_0_0.willExit(arg_9_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_9_0._tf)
end

return var_0_0
