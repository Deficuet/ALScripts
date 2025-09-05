local var_0_0 = class("IslandAwardDisplayInMainPanel", import("view.base.BaseSubView"))
local var_0_1 = 3
local var_0_2 = 5

function var_0_0.getUIName(arg_1_0)
	return "IslandAwardDisplayInMainPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.nameTf = arg_2_0._tf:Find("title/name")
	arg_2_0.container = arg_2_0:findTF("content")
	arg_2_0.item = arg_2_0:findTF("tpl")
	arg_2_0.poolContainer = arg_2_0:findTF("pool")
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.showItemQueue = {}
	arg_3_0.poolList = {}
	arg_3_0.timers = {}
	arg_3_0.showCount = 0

	setText(arg_3_0.nameTf, "获得")
	setActive(arg_3_0.item, false)
end

function var_0_0.Show(arg_4_0, arg_4_1)
	var_0_0.super.Show(arg_4_0)

	arg_4_0.isShow = true
end

function var_0_0.Hide(arg_5_0)
	var_0_0.super.Hide(arg_5_0)

	arg_5_0.isShow = false
end

function var_0_0.ShowAwards(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.awards

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		local var_6_1 = arg_6_0:CreateItem()
		local var_6_2 = iter_6_1:getIcon()
		local var_6_3 = iter_6_1:getName()

		setText(findTF(var_6_1, "name"), string.format(var_6_3))
		GetImageSpriteFromAtlasAsync(var_6_2, "", findTF(var_6_1, "icon"))
		setText(findTF(var_6_1, "name/count"), iter_6_1:getCount())
	end
end

function var_0_0.CreateItem(arg_7_0)
	arg_7_0.showCount = arg_7_0.showCount + 1

	if arg_7_0.showCount > 0 and not arg_7_0.isShow then
		arg_7_0:Show()
	end

	local var_7_0

	if arg_7_0.showCount > var_0_2 then
		var_7_0 = arg_7_0.showItemQueue[1]

		table.remove(arg_7_0.showItemQueue, 1)

		arg_7_0.showCount = arg_7_0.showCount - 1
	elseif #arg_7_0.poolList > 0 then
		var_7_0 = arg_7_0.poolList[1]

		table.remove(arg_7_0.poolList, 1)
		var_7_0:SetParent(arg_7_0.container, false)

		GetOrAddComponent(var_7_0, typeof(CanvasGroup)).alpha = 1
	else
		var_7_0 = cloneTplTo(arg_7_0.item, arg_7_0.container)
	end

	local var_7_1 = arg_7_0.showCount - 1

	var_7_0.transform:SetSiblingIndex(var_7_1)
	table.insert(arg_7_0.showItemQueue, var_7_0)

	if arg_7_0.timers[var_7_0] then
		arg_7_0.timers[var_7_0]:Stop()
	end

	arg_7_0.timers[var_7_0] = Timer.New(function()
		arg_7_0:DeleteItem(var_7_0)
	end, var_0_1, 1)

	arg_7_0.timers[var_7_0]:Start()

	return var_7_0
end

function var_0_0.DeleteItem(arg_9_0, arg_9_1)
	arg_9_0.showCount = arg_9_0.showCount - 1

	if arg_9_0.showCount <= 0 and arg_9_0.isShow then
		arg_9_0:Hide()
	end

	GetOrAddComponent(arg_9_1, typeof(CanvasGroup)).alpha = 0

	table.insert(arg_9_0.poolList, arg_9_1)
	arg_9_1:SetParent(arg_9_0.poolContainer, false)
end

function var_0_0.OnDestroy(arg_10_0)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.timers) do
		if iter_10_1 then
			iter_10_1:Stop()
		end
	end
end

return var_0_0
