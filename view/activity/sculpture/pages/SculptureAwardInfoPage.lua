local var_0_0 = class("SculptureAwardInfoPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "SculptureAwardInfoUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.uilist = UIItemList.New(arg_2_0._tf:Find("frame/scrollrect/content"), arg_2_0._tf:Find("frame/scrollrect/content/tpl"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_5_0, arg_5_1)
	var_0_0.super.Show(arg_5_0)

	arg_5_0.activity = arg_5_1

	arg_5_0:UpdateList()
	setText(arg_5_0._tf:Find("frame/tip"), i18n("sculpture_close_tip"))
end

function var_0_0.UpdateList(arg_6_0)
	local var_6_0 = arg_6_0.activity:getConfig("config_data")

	arg_6_0.uilist:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateCard(var_6_0[arg_7_1 + 1], arg_7_2)
		end
	end)
	arg_6_0.uilist:align(#var_6_0)
end

function var_0_0.UpdateCard(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.activity:GetAwards(arg_8_1)
	local var_8_1 = arg_8_0.activity:GetResorceName(arg_8_1)
	local var_8_2 = arg_8_2:Find("icon/mask/image"):GetComponent(typeof(Image))

	LoadSpriteAtlasAsync("SculptureRole/" .. var_8_1 .. "_normal", nil, function(arg_9_0)
		if arg_8_0.exited then
			return
		end

		var_8_2.sprite = arg_9_0

		var_8_2:SetNativeSize()
	end)
	setText(arg_8_2:Find("Text"), HXSet.hxLan(arg_8_0.activity:GetAwardDesc(arg_8_1)))

	local var_8_3 = UIItemList.New(arg_8_2:Find("awards"), arg_8_2:Find("awards/tpl"))

	var_8_3:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_8_0[arg_10_1 + 1]
			local var_10_1 = {
				type = var_10_0[1],
				id = var_10_0[2],
				count = var_10_0[3]
			}

			updateDrop(arg_10_2, var_10_1)
			onButton(arg_8_0, arg_10_2, function()
				arg_8_0:emit(BaseUI.ON_DROP, var_10_1)
			end, SFX_PANEL)
		end
	end)
	var_8_3:align(#var_8_0)
	setActive(arg_8_2:Find("mask"), arg_8_0.activity:GetSculptureState(arg_8_1) == SculptureActivity.STATE_FINSIH)
end

function var_0_0.OnDestroy(arg_12_0)
	return
end

return var_0_0
