local var_0_0 = class("IslandAwardDisplayWindow", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandAwardDisplayUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.frameTr = arg_2_0:findTF("frame")
	arg_2_0.title = arg_2_0:findTF("frame/Board/Top/text/text"):GetComponent("Text")
	arg_2_0.uiitemList = UIItemList.New(arg_2_0:findTF("frame/Board/Content/award/content"), arg_2_0:findTF("frame/Board/Content/award/content/tpl"))

	setText(arg_2_0:findTF("frame/tip"), i18n("island_click_close"))

	arg_2_0.animator = arg_2_0.frameTr:GetComponent(typeof(Animation))
	arg_2_0.aniDft = arg_2_0.frameTr:GetComponent(typeof(DftAniEvent))
end

function var_0_0.Show(arg_3_0, arg_3_1)
	var_0_0.super.Show(arg_3_0)

	arg_3_0.title.text = setColorStr(arg_3_1.title or "", arg_3_1.titleColor or "#393a3c")

	arg_3_0:UpdateAwards(arg_3_1.awards)
end

function var_0_0.UpdateAwards(arg_4_0, arg_4_1)
	arg_4_0.uiitemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_4_1[arg_5_1 + 1]

			updateCustomDrop(arg_5_2, var_5_0)
			setText(findTF(arg_5_2, "icon_bg/count_bg/count"), "x" .. var_5_0.count)
		end
	end)
	arg_4_0.uiitemList:align(#arg_4_1)
end

function var_0_0.PlayExitAniamtion(arg_6_0, arg_6_1)
	arg_6_0.aniDft:SetEndEvent(function()
		arg_6_0.aniDft:SetEndEvent(nil)
		arg_6_1()
	end)
	arg_6_0.animator:Play("anim_Island_commonget_single_out")
end

function var_0_0.OnDestroy(arg_8_0)
	arg_8_0.aniDft:SetEndEvent(nil)
end

return var_0_0
