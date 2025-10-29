local var_0_0 = class("GetCommanderResultPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "GetCommanderResultUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.treePanel = CommanderTreePage.New(arg_2_0._tf, arg_2_0.event)
	arg_2_0.uiList = UIItemList.New(arg_2_0._tf:Find("frame/list"), arg_2_0._tf:Find("frame/list/tpl"))
	arg_2_0.uiList1 = UIItemList.New(arg_2_0._tf:Find("frame/list1"), arg_2_0._tf:Find("frame/list/tpl"))

	setText(arg_2_0._tf:Find("frame/Text"), i18n("word_click_to_close"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.paintings = {}

	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_5_0, arg_5_1)
	var_0_0.super.Show(arg_5_0)
	arg_5_0:UpdateCommanders(arg_5_1)
end

function var_0_0.UpdateCommanders(arg_6_0, arg_6_1)
	arg_6_0.uiList:align(0)
	arg_6_0.uiList1:align(0)

	local var_6_0 = #arg_6_1 <= 5 and arg_6_0.uiList1 or arg_6_0.uiList

	var_6_0:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateCommander(arg_6_1[arg_7_1 + 1], arg_7_2)
		end
	end)

	local var_6_1 = #arg_6_1 <= 5 and #arg_6_1 or 10

	var_6_0:align(var_6_1)
end

function var_0_0.UpdateCommander(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1 then
		local var_8_0 = {
			"",
			"",
			"R",
			"SR",
			"SSR"
		}
		local var_8_1 = arg_8_1:getRarity()
		local var_8_2 = GetSpriteFromAtlas("ui/CommanderBuildResultUI_atlas", var_8_0[var_8_1])
		local var_8_3 = arg_8_1:getPainting()
		local var_8_4 = arg_8_2:Find("info/mask/paint")

		arg_8_2:Find("info/frame"):GetComponent(typeof(Image)).sprite = var_8_2

		setCommanderPaintingPrefab(var_8_4, var_8_3, "result2")
		arg_8_0:UpdateTalent(arg_8_1, arg_8_2)

		arg_8_0.paintings[var_8_3] = var_8_4

		setText(arg_8_2:Find("info/Text"), arg_8_1:getName())
	end

	setActive(arg_8_2:Find("empty"), arg_8_1 == nil)
	setActive(arg_8_2:Find("info"), arg_8_1)
end

function var_0_0.UpdateTalent(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_1:getTalents()
	local var_9_1 = UIItemList.New(arg_9_2:Find("info/talent"), arg_9_2:Find("info/talent/tpl"))

	var_9_1:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_9_0[arg_10_1 + 1]

			GetImageSpriteFromAtlasAsync("CommanderTalentIcon/" .. var_10_0:getConfig("icon"), "", arg_10_2)
			onButton(arg_9_0, arg_10_2, function()
				arg_9_0.treePanel:ExecuteAction("Show", var_10_0)
			end, SFX_PANEL)
		end
	end)
	var_9_1:align(#var_9_0)
end

function var_0_0.OnDestroy(arg_12_0)
	if arg_12_0.treePanel then
		arg_12_0.treePanel:Destroy()

		arg_12_0.treePanel = nil
	end

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.paintings) do
		retCommanderPaintingPrefab(iter_12_1, iter_12_0)
	end

	arg_12_0.paintings = {}
end

return var_0_0
