local var_0_0 = class("ActivityBossSurugaScene", import(".ActivityBossSceneTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "ActivityBossUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = var_0_0.super.getResource(arg_2_0)

	table.insert(var_2_0, "ui/cysx_fk")

	return var_2_0
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = PoolMgr.GetInstance()

	var_3_0:GetPrefab("ui/cysx_fk", "cysx_fk", true, function(arg_4_0)
		var_3_0:ReturnPrefab("ui/cysx_fk", "cysx_fk", arg_4_0)
		arg_3_1()
	end)
end

function var_0_0.init(arg_5_0)
	var_0_0.super.init(arg_5_0)
	setText(arg_5_0.rankTF:Find("title/Text"), i18n("word_billboard"))

	arg_5_0.loader = AutoLoader.New()
end

function var_0_0.didEnter(arg_6_0)
	var_0_0.super.didEnter(arg_6_0)
	arg_6_0.loader:GetPrefab("ui/cysx_fk", "cysx_fk", function(arg_7_0)
		setParent(arg_7_0, arg_6_0.left)
		setAnchoredPosition(arg_7_0, Vector2(69, 295))
		arg_7_0.transform:SetAsFirstSibling()
	end)
end

function var_0_0.UpdateRank(arg_8_0, arg_8_1)
	arg_8_1 = arg_8_1 or {}

	for iter_8_0 = 1, #arg_8_0.rankList do
		local var_8_0 = arg_8_0.rankList[iter_8_0]

		setActive(var_8_0, iter_8_0 <= #arg_8_1)

		if iter_8_0 <= #arg_8_1 then
			local var_8_1 = var_8_0:Find("name/Text")

			setText(var_8_1, tostring(arg_8_1[iter_8_0].name))
			setText(var_8_0:Find("num/Text"), "NO." .. iter_8_0)
		end
	end
end

function var_0_0.UpdateDropItems(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.contextData.DisplayItems or {}) do
		local var_9_0 = arg_9_0.barList[iter_9_0]:Find("milestone/item")
		local var_9_1 = {
			type = arg_9_0.contextData.DisplayItems[5 - iter_9_0][1],
			id = arg_9_0.contextData.DisplayItems[5 - iter_9_0][2],
			count = arg_9_0.contextData.DisplayItems[5 - iter_9_0][3]
		}

		updateDrop(var_9_0, var_9_1)
		onButton(arg_9_0, var_9_0, function()
			arg_9_0:emit(var_0_0.ON_DROP, var_9_1)
		end, SFX_PANEL)
	end
end

function var_0_0.willExit(arg_11_0)
	var_0_0.super.willExit(arg_11_0)
	arg_11_0.loader:Clear()
end

return var_0_0
