local var_0_0 = class("IslandThemeMsgboxWindow", import(".IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBoxForTheme"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.iconRaw = arg_2_0:findTF("icon_raw"):GetComponent(typeof(RawImage))
	arg_2_0.icon = arg_2_0:findTF("icon"):GetComponent(typeof(Image))
	arg_2_0.delBtn = arg_2_0:findTF("delete")

	setText(arg_2_0.delBtn:Find("Text"), i18n("island_btn_label_del"))
	setText(arg_2_0:findTF("confirm/Text"), i18n("island_word_place"))
end

function var_0_0.OnInit(arg_3_0)
	var_0_0.super.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.delBtn, function()
		if arg_3_0.settings.onDel then
			arg_3_0.settings.onDel()
		end

		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_5_0)
	arg_5_0.settings.content = arg_5_0.settings.theme.name

	var_0_0.super.OnShow(arg_5_0)
	arg_5_0:FlushIcon()
end

function var_0_0.OnHide(arg_6_0)
	var_0_0.super.OnHide(arg_6_0)

	if not IsNil(arg_6_0.iconRaw.texture) then
		Object.Destroy(arg_6_0.iconRaw.texture)

		arg_6_0.iconRaw.texture = nil
	end
end

function var_0_0.FlushBtn(arg_7_0, arg_7_1)
	return
end

function var_0_0.FlushIcon(arg_8_0)
	local var_8_0 = arg_8_0.settings.theme

	if isa(var_8_0, AgoraTheme) then
		arg_8_0:LoadRawTex(var_8_0.id)
	else
		arg_8_0:LoadImage(var_8_0.id)
	end
end

function var_0_0.LoadRawTex(arg_9_0, arg_9_1)
	local var_9_0 = AgoraCalc.BuildScreenShootSavePath(arg_9_1)

	if not PathMgr.FileExists(var_9_0) then
		arg_9_0:LoadImage(0)

		return
	end

	local var_9_1 = System.IO.File.ReadAllBytes(var_9_0)
	local var_9_2 = UnityEngine.Texture2D.New(426, 320)

	Tex2DExtension.LoadImage(var_9_2, var_9_1)

	arg_9_0.iconRaw.texture = var_9_2

	setActive(arg_9_0.iconRaw, true)
	setActive(arg_9_0.icon, false)
end

function var_0_0.LoadImage(arg_10_0, arg_10_1)
	LoadSpriteAsync("island/IslandThemeIcon/" .. arg_10_1, function(arg_11_0)
		arg_10_0.icon.sprite = arg_11_0

		arg_10_0.icon:SetNativeSize()
	end)
	setActive(arg_10_0.iconRaw, false)
	setActive(arg_10_0.icon, true)
end

return var_0_0
