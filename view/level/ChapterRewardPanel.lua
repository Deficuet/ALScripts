local var_0_0 = class("ChapterRewardPanel", BaseSubView)

function var_0_0.getUIName(arg_1_0)
	return "ChapterRewardPanel"
end

function var_0_0.OnInit(arg_2_0)
	setText(arg_2_0._tf:Find("window/bg/text"), i18n("desc_defense_reward"))

	arg_2_0.UIlist = UIItemList.New(arg_2_0._tf:Find("window/bg/panel/list"), arg_2_0._tf:Find("window/bg/panel/list/item"))
	arg_2_0.closeBtn = arg_2_0._tf:Find("window/top/btnBack")
	arg_2_0.confirmBtn = arg_2_0._tf:Find("window/btn_confirm")

	onButton(arg_2_0, arg_2_0._tf, function()
		arg_2_0:Hide()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.closeBtn, function()
		arg_2_0:Hide()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.confirmBtn, function()
		arg_2_0:Hide()
	end, SFX_PANEL)
end

local var_0_1 = {
	"s",
	"a",
	"b"
}

local function var_0_2(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0.UIlist:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			setText(arg_7_2:Find("title/Text"), "PHASE " .. arg_7_1 + 1)

			local var_7_0 = tostring(arg_6_2[arg_7_1 + 1] - 1)

			if arg_6_2[arg_7_1 + 1] - 1 ~= arg_6_2[arg_7_1 + 2] then
				var_7_0 = tostring(arg_6_2[arg_7_1 + 2]) .. "-" .. var_7_0
			end

			setText(arg_7_2:Find("target/title"), i18n("text_rest_HP") .. "：")
			setText(arg_7_2:Find("target/Text"), var_7_0)

			local var_7_1 = arg_6_3[arg_7_1 + 1]

			updateDrop(arg_7_2:Find("award"), var_7_1, {
				hideName = true
			})
			onButton(arg_6_0, arg_7_2:Find("award"), function()
				arg_6_0:emit(BaseUI.ON_DROP, var_7_1)
			end, SFX_PANEL)
			setActive(arg_7_2:Find("award/mask"), false)
		end
	end)
	arg_6_0.UIlist:align(#arg_6_3)
end

function var_0_0.Show(arg_9_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_9_0._tf)
	var_0_0.super.Show(arg_9_0)
end

function var_0_0.Hide(arg_10_0)
	var_0_0.super.Hide(arg_10_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_10_0._tf, arg_10_0._parentTf)
end

function var_0_0.Enter(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.id
	local var_11_1 = pg.chapter_defense[var_11_0]

	assert(var_11_1, "Chapter Detail should only be Defense Type")

	local var_11_2 = Clone(var_11_1.score)

	table.insert(var_11_2, 1, var_11_1.port_hp + 1)

	local var_11_3 = {}

	for iter_11_0, iter_11_1 in ipairs(var_0_1) do
		local var_11_4 = var_11_1["evaluation_display_" .. iter_11_1]

		if #var_11_4 > 0 then
			table.insert(var_11_3, {
				type = var_11_4[1],
				id = var_11_4[2],
				count = var_11_4[3]
			})
		end
	end

	var_0_2(arg_11_0, var_11_1, var_11_2, var_11_3)
	arg_11_0:Show()
	Canvas.ForceUpdateCanvases()
end

function var_0_0.OnDestroy(arg_12_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_12_0._tf, arg_12_0._parentTf)
end

return var_0_0
