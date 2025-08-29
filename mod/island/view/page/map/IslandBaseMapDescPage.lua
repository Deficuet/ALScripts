local var_0_0 = class("IslandBaseMapDescPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandMapDescUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.nameTxt = arg_2_0:findTF("frame/title/name/Text"):GetComponent(typeof(Text))
	arg_2_0.descTxt = arg_2_0:findTF("frame/Text"):GetComponent(typeof(Text))
	arg_2_0.goBtn = arg_2_0:findTF("frame/go")
	arg_2_0.uiProductionList = UIItemList.New(arg_2_0:findTF("frame/list"), arg_2_0:findTF("frame/list/tpl"))
	arg_2_0.iconTr = arg_2_0:findTF("frame/icon")
	arg_2_0.fullMark = arg_2_0:findTF("frame/icon/tag")

	setText(arg_2_0:findTF("frame/go/Text"), i18n("island_word_go"))

	arg_2_0.animationPlayer = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0.dftAniEvent:SetEndEvent(function()
			arg_3_0.dftAniEvent:SetEndEvent(nil)
			arg_3_0:Hide()
		end)
		arg_3_0.animationPlayer:Play("IslandMapDescUI_out")
		arg_3_0:emit(IslandBaseMapPage.HIDE_DESC)
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_6_0, arg_6_1)
	local var_6_0 = pg.island_map[arg_6_1]

	arg_6_0.nameTxt.text = var_6_0.name
	arg_6_0.descTxt.text = var_6_0.desc

	LoadImageSpriteAtlasAsync("island/IslandMapIcon/" .. arg_6_1, "", arg_6_0.iconTr)
	onButton(arg_6_0, arg_6_0.goBtn, function()
		arg_6_0:GoMap(arg_6_1)
	end, SFX_PANEL)
	setActive(arg_6_0.fullMark, false)
end

function var_0_0.GoMap(arg_8_0, arg_8_1)
	local var_8_0 = pg.island_map[arg_8_1]

	arg_8_0:emit(IslandBaseMediator.SWITCH_MAP, arg_8_1, var_8_0.born_object)
	arg_8_0:emit(IslandBaseMapPage.CLOSE)
end

return var_0_0
