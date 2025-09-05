local var_0_0 = class("IslandTopHeadHudView", import(".IslandBaseOpView"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_0.GetSubView(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.views) do
		if isa(iter_2_1, arg_2_1) then
			return iter_2_1
		end
	end

	return nil
end

function var_0_0.SubViewInit(arg_3_0)
	arg_3_0.views = {
		arg_3_0:CreateInfoHudView()
	}
	arg_3_0.chatBubblePlayers = {}
end

function var_0_0.CreateInfoHudView(arg_4_0)
	return IslandHudView.New(arg_4_0.view)
end

function var_0_0.GetUIName(arg_5_0)
	return "IslandTopHeadHudUI"
end

function var_0_0.OnInit(arg_6_0, arg_6_1)
	arg_6_0._go = arg_6_1
	arg_6_0._tf = arg_6_1.transform
	arg_6_0.chatTpl = arg_6_0._tf:GetComponent(typeof(ItemList)).prefabItem[0]
	arg_6_0.parent = arg_6_0._tf:Find("parent")
	arg_6_0.unitHudRoot = arg_6_0._tf:Find("parent/unitHud")
	arg_6_0.unitHudDic = {}

	arg_6_0:SubViewInit()
end

function var_0_0.Update(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.views) do
		iter_7_1:Update()
	end
end

function var_0_0.LateUpdate(arg_8_0)
	arg_8_0:UpdateChatPosition()
end

function var_0_0.UpdateChatPosition(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(arg_9_0.unitHudDic) do
		local var_9_0 = arg_9_0:UnitKey2unitData(iter_9_0)
		local var_9_1 = arg_9_0.view:GetUnitModuleWithType(var_9_0.type, var_9_0.id)
		local var_9_2 = var_9_1 and var_9_1._go or nil

		if var_9_1 and not IsNil(var_9_2) then
			local var_9_3 = var_9_2.transform.position + Vector3(0, 1.8, 0)

			if IslandCalcUtil.IsInViewport(var_9_3) then
				setActive(iter_9_1, true)

				local var_9_4 = IslandCalcUtil.WorldPosition2LocalPosition(arg_9_0.parent, var_9_3)

				iter_9_1.transform.localPosition = var_9_4
			else
				setActive(iter_9_1, false)
			end
		end
	end
end

function var_0_0.UnitKey2unitData(arg_10_0, arg_10_1)
	local var_10_0 = string.split(arg_10_1, "_")

	return {
		id = tonumber(var_10_0[2]),
		type = tonumber(var_10_0[1])
	}
end

function var_0_0.GetUnitHudRoot(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.unitHudDic[arg_11_1.key]

	if IsNil(var_11_0) then
		var_11_0 = Object.Instantiate(arg_11_0.unitHudRoot, arg_11_0.parent)
		var_11_0.name = arg_11_1.key

		setActive(var_11_0, true)

		arg_11_0.unitHudDic[arg_11_1.key] = var_11_0
	end

	return var_11_0.transform
end

function var_0_0.GenUnitData(arg_12_0, arg_12_1, arg_12_2)
	return {
		id = arg_12_1,
		type = arg_12_2,
		key = arg_12_2 .. "_" .. arg_12_1
	}
end

function var_0_0.PlayBubble(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = pg.NewStoryMgr.GetInstance():GetScript(arg_13_1)
	local var_13_1 = IslandStory.New(var_13_0, arg_13_2, IslandStory.MODE_BUBBLE)
	local var_13_2 = {}

	for iter_13_0, iter_13_1 in ipairs(var_13_1.steps) do
		local var_13_3 = iter_13_1:GetUnitData()
		local var_13_4 = arg_13_0:GetUnitHudRoot(var_13_3):Find("bubleContainer")
		local var_13_5 = arg_13_0:GetView():GetUnitModuleWithType(var_13_3.type, var_13_3.id)

		assert(var_13_5)
		table.insert(var_13_2, function(arg_14_0)
			local var_14_0 = arg_13_0.chatBubblePlayers[var_13_3.key] or IslandChatBubblePlayer.New(Object.Instantiate(arg_13_0.chatTpl, var_13_4), var_13_5._go)

			var_14_0:Play(iter_13_1, arg_13_3)

			arg_13_0.chatBubblePlayers[var_13_3.key] = var_14_0
		end)
	end

	seriesAsync(var_13_2, function()
		if arg_13_3 then
			arg_13_3()
		end
	end)
end

function var_0_0.ShowHud(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0:GetUnitHudRoot(arg_16_0:GenUnitData(arg_16_1.id, arg_16_1.type)):Find("npcInfoContainer")

	arg_16_0:GetSubView(IslandHudView):ShowHud(arg_16_1, var_16_0)
end

function var_0_0.RefreshHud(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:GetUnitHudRoot(arg_17_0:GenUnitData(arg_17_1.id, arg_17_1.type)):Find("npcInfoContainer")

	arg_17_0:GetSubView(IslandHudView):RefreshHud(arg_17_1, var_17_0)
end

function var_0_0.HideHud(arg_18_0, arg_18_1)
	arg_18_0:GetSubView(IslandHudView):HideHud(arg_18_1)
end

function var_0_0.UpdateAllHud(arg_19_0)
	arg_19_0:GetSubView(IslandHudView):UpdateAllHud()
end

function var_0_0.OnDispose(arg_20_0)
	var_0_0.super.OnDispose(arg_20_0)

	for iter_20_0, iter_20_1 in pairs(arg_20_0.chatBubblePlayers) do
		iter_20_1:Dispose()
	end

	arg_20_0.chatBubblePlayers = nil
end

return var_0_0
