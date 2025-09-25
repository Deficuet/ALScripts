local var_0_0 = class("SkinExperienceDiplayPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ExSkinListUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.uilist = UIItemList.New(arg_2_0:findTF("window/list/content"), arg_2_0:findTF("window/list/content/tpl"))
	arg_2_0.skinTimers = {}
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0:findTF("window/top/btnBack"), function()
		arg_3_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0:findTF("window/button_container/confirm_btn"), function()
		arg_3_0:Hide()
	end, SFX_CANCEL)
end

function var_0_0.Show(arg_7_0, arg_7_1)
	var_0_0.super.Show(arg_7_0)
	arg_7_0:Display(arg_7_1)
	pg.UIMgr.GetInstance():BlurPanel(arg_7_0._tf)
end

function var_0_0.Hide(arg_8_0)
	var_0_0.super.Hide(arg_8_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_8_0._tf, pg.UIMgr.GetInstance()._normalUIMain)
end

function var_0_0.Display(arg_9_0, arg_9_1)
	arg_9_0:Clear()
	arg_9_0.uilist:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_9_1[arg_10_1 + 1]

			setText(arg_10_2:Find("name/Text"), var_10_0:getConfig("name"))

			if arg_9_0.skinTimers[var_10_0.id] then
				arg_9_0.skinTimers[var_10_0.id]:Stop()
			end

			arg_9_0.skinTimers[var_10_0.id] = Timer.New(function()
				local var_11_0 = skinTimeStamp(var_10_0:getRemainTime())

				setText(arg_10_2:Find("time/Text"), var_11_0)
			end, 1, -1)

			arg_9_0.skinTimers[var_10_0.id]:Start()
			arg_9_0.skinTimers[var_10_0.id].func()

			local var_10_1 = arg_10_2:Find("icon_bg/icon")

			LoadSpriteAsync("qicon/" .. var_10_0:getIcon(), function(arg_12_0)
				if not IsNil(arg_9_0._tf) then
					var_10_1:GetComponent(typeof(Image)).sprite = arg_12_0
				end
			end)
		end
	end)
	arg_9_0.uilist:align(#arg_9_1)
end

function var_0_0.Clear(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.skinTimers) do
		iter_13_1:Stop()
	end

	arg_13_0.skinTimers = {}
end

function var_0_0.OnDestroy(arg_14_0)
	arg_14_0:Clear()

	arg_14_0.skinTimers = nil
end

return var_0_0
