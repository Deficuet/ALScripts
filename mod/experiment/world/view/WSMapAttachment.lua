local var_0_0 = class("WSMapAttachment", import(".WSMapTransform"))

var_0_0.Fields = {
	cell = "table",
	lurkTimer = "table",
	map = "table",
	isFighting = "boolean",
	attachment = "table",
	twTimer = "userdata",
	twBreathId = "number",
	spineChar = "table",
	isInit = "boolean"
}
var_0_0.Listeners = {
	onUpdate = "Update"
}
var_0_0.CharBasePos = Vector2.zero
var_0_0.IconBasePos = Vector2(0, 10)

function var_0_0.GetResName(arg_1_0)
	if arg_1_0.type == WorldMapAttachment.TypeEvent then
		if arg_1_0:GetReplaceDisplayEnemyConfig() then
			return "enemy_tpl"
		else
			return "event_tpl"
		end
	elseif arg_1_0.type == WorldMapAttachment.TypeBox then
		return "event_tpl"
	elseif WorldMapAttachment.IsEnemyType(arg_1_0.type) then
		return "enemy_tpl"
	elseif arg_1_0.type == WorldMapAttachment.TypePort then
		return "blank_tpl"
	elseif arg_1_0.type == WorldMapAttachment.TypeTransportFleet then
		return "transport_tpl"
	elseif arg_1_0.type == WorldMapAttachment.TypeTrap then
		return "event_tpl"
	else
		assert(false, "invalid attachment type: " .. tostring(arg_1_0.type))
	end
end

function var_0_0.Setup(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(arg_2_0.worldMapAttachment == nil)

	arg_2_0.map = arg_2_1
	arg_2_0.cell = arg_2_2

	arg_2_0.cell:AddListener(WorldMapCell.EventUpdateInFov, arg_2_0.onUpdate)
	arg_2_0.cell:AddListener(WorldMap.EventUpdateMapBuff, arg_2_0.onUpdate)

	arg_2_0.attachment = arg_2_3

	arg_2_0:Init()
end

function var_0_0.Dispose(arg_3_0)
	arg_3_0.cell:RemoveListener(WorldMapCell.EventUpdateInFov, arg_3_0.onUpdate)
	arg_3_0.cell:RemoveListener(WorldMap.EventUpdateMapBuff, arg_3_0.onUpdate)

	if arg_3_0.twBreathId then
		LeanTween.cancel(arg_3_0.twBreathId)
	end

	if arg_3_0.lurkTimer then
		arg_3_0.lurkTimer:Stop()
	end

	arg_3_0.transform.localEulerAngles = Vector3.zero

	var_0_0.super.Dispose(arg_3_0)
end

function var_0_0.Init(arg_4_0)
	arg_4_0.transform.anchoredPosition3D = Vector3.zero
	arg_4_0.transform.localEulerAngles = Vector3.zero
	arg_4_0.transform.name = arg_4_0.attachment:GetDebugName()

	arg_4_0:SetModelOrder(arg_4_0.attachment:GetModelOrder(), arg_4_0.cell.row)
	arg_4_0:Update()
end

function var_0_0.LoadAvatar(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = {}

	if arg_5_1 and #arg_5_1 > 0 then
		table.insert(var_5_0, function(arg_6_0)
			arg_5_0:LoadModel(WorldConst.ModelSpine, arg_5_1, nil, true, function()
				arg_5_0.model:SetParent(arg_5_2, false)
				arg_6_0()
			end)
		end)
	end

	seriesAsync(var_5_0, arg_5_3)
end

function var_0_0.LoadBoxPrefab(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = {}

	if arg_8_1 and #arg_8_1 > 0 then
		table.insert(var_8_0, function(arg_9_0)
			arg_8_0:LoadModel(WorldConst.ModelPrefab, WorldConst.ResBoxPrefab .. arg_8_1, arg_8_1, true, function()
				arg_8_0.model:SetParent(arg_8_2, false)
				arg_9_0()
			end)
		end)
	end

	seriesAsync(var_8_0, arg_8_3)
end

function var_0_0.LoadChapterPrefab(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = {}

	if arg_11_1 and #arg_11_1 > 0 then
		table.insert(var_11_0, function(arg_12_0)
			arg_11_0:LoadModel(WorldConst.ModelPrefab, WorldConst.ResChapterPrefab .. arg_11_1, arg_11_1, true, function()
				arg_11_0.model:SetParent(arg_11_2, false)
				arg_12_0()
			end)
		end)
	end

	seriesAsync(var_11_0, arg_11_3)
end

function var_0_0.Update(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.attachment

	if var_14_0.type == WorldMapAttachment.TypeEvent then
		if var_14_0:GetReplaceDisplayEnemyConfig() then
			arg_14_0:UpdateEventEnemy(arg_14_1)
		else
			arg_14_0:UpdateEvent(arg_14_1)
		end
	elseif var_14_0.type == WorldMapAttachment.TypeBox then
		arg_14_0:UpdateBox(arg_14_1)
	elseif var_14_0.type == WorldMapAttachment.TypePort then
		arg_14_0:UpdatePort(arg_14_1)
	elseif WorldMapAttachment.IsEnemyType(var_14_0.type) then
		arg_14_0:UpdateEnemy(arg_14_1)
	elseif var_14_0.type == WorldMapAttachment.TypeTransportFleet then
		arg_14_0:UpdateTransportFleet(arg_14_1)
	elseif var_14_0.type == WorldMapAttachment.TypeTrap then
		arg_14_0:UpdateTrap(arg_14_1)
	else
		assert(false, "invalid attachment type: " .. var_14_0.type)
	end

	arg_14_0:UpdateBreathTween()
	arg_14_0:UpdateModelAngles(arg_14_0.attachment:GetMillor() and Vector3(0, 180, 0) or Vector3.zero)
	arg_14_0:UpdateModelScale(arg_14_0.attachment:GetScale())
end

function var_0_0.UpdateEvent(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.map
	local var_15_1 = arg_15_0.cell
	local var_15_2 = arg_15_0.attachment
	local var_15_3 = arg_15_0.transform
	local var_15_4 = var_15_0:CheckDisplay(var_15_2)

	setActive(var_15_3, var_15_4)

	if var_15_4 then
		local var_15_5 = var_15_2:IsAvatar()

		if arg_15_0.isInit and arg_15_1 == WorldMap.EventUpdateMapBuff then
			arg_15_0:UpdateMapBuff(var_15_3, var_15_2:GetRadiationBuffs(), var_15_0:GetBuffList(WorldMap.FactionEnemy, var_15_2))
		end

		if not arg_15_0.isInit then
			arg_15_0.isInit = true

			local var_15_6 = var_15_2.config
			local var_15_7 = var_15_3:Find("char")
			local var_15_8 = var_15_3:Find("icon")

			setActive(var_15_7, var_15_5)
			setActive(var_15_8, not var_15_5)

			if var_15_5 then
				arg_15_0:LoadAvatar(var_15_6.icon, var_15_7:Find("ship"), function()
					if #var_15_6.icon > 0 then
						setAnchoredPosition(arg_15_0.model, var_15_2:GetDeviation())
					end
				end)
			elseif math.floor(var_15_6.enemyicon / 2) == 2 then
				arg_15_0:LoadChapterPrefab(var_15_6.icon, var_15_8, function()
					if #var_15_6.icon > 0 then
						setAnchoredPosition(arg_15_0.model, var_15_2:GetDeviation())
					end
				end)
			elseif math.floor(var_15_6.enemyicon / 2) == 0 then
				arg_15_0:LoadBoxPrefab(var_15_6.icon, var_15_8, function()
					if #var_15_6.icon > 0 then
						setAnchoredPosition(arg_15_0.model, var_15_2:GetDeviation())
					end
				end)
			else
				assert(false, "enemyicon error from id: " .. var_15_2.id)
			end

			arg_15_0:UpdateBuffList(var_15_3, var_15_2:GetBuffList())
			arg_15_0:UpdateMapBuff(var_15_3, var_15_2:GetRadiationBuffs(), var_15_0:GetBuffList(WorldMap.FactionEnemy, var_15_2))
		end

		if arg_15_1 == WorldMapAttachment.EventUpdateLurk and var_15_1:GetInFOV() and not var_15_2.lurk then
			setActive(var_15_3:Find("effect_found"), true)

			arg_15_0.lurkTimer = Timer.New(function()
				setActive(var_15_3:Find("effect_found"), false)
			end, 3, 1)

			arg_15_0.lurkTimer:Start()
		else
			setActive(var_15_3:Find("effect_found"), false)
		end
	end
end

function var_0_0.UpdateEventEnemy(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.map
	local var_20_1 = arg_20_0.cell
	local var_20_2 = arg_20_0.attachment
	local var_20_3 = arg_20_0.transform
	local var_20_4 = var_20_3:Find("live")
	local var_20_5 = var_20_3:Find("dead")
	local var_20_6 = var_20_0:CheckDisplay(var_20_2)

	setActive(var_20_3, var_20_6)

	if var_20_6 then
		local var_20_7 = var_20_2:IsAlive()
		local var_20_8 = var_20_2:IsAvatar()

		if arg_20_0.isInit and arg_20_1 == WorldMap.EventUpdateMapBuff then
			arg_20_0:UpdateMapBuff(var_20_4, var_20_2:GetRadiationBuffs(), var_20_0:GetBuffList(WorldMap.FactionEnemy, var_20_2))
		end

		if not arg_20_0.isInit then
			arg_20_0.isInit = true

			local var_20_9 = var_20_2:GetReplaceDisplayEnemyConfig()
			local var_20_10 = var_20_4:Find("char")
			local var_20_11 = var_20_4:Find("icon")

			setActive(var_20_10, var_20_8)
			setActive(var_20_11, not var_20_8)

			if var_20_8 then
				arg_20_0:LoadAvatar(var_20_9.icon, var_20_10:Find("ship"))
			else
				GetImageSpriteFromAtlasAsync("enemies/" .. var_20_9.icon, "", var_20_11:Find("pic"))

				local var_20_12 = WorldConst.EnemySize[var_20_9.type]

				setActive(var_20_11:Find("size/bg_s"), var_20_12 == 1 or not var_20_12)
				setActive(var_20_11:Find("size/bg_m"), var_20_12 == 2)
				setActive(var_20_11:Find("size/bg_h"), var_20_12 == 3)
				setActive(var_20_11:Find("size/bg_boss"), var_20_12 == 99)

				if var_20_9.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
					setActive(var_20_11:Find("size/bg_boss"), false)
					setText(var_20_11:Find("lv/Text"), WorldConst.WorldLevelCorrect(var_20_0.config.expedition_level, var_20_9.type))
				else
					setText(var_20_11:Find("lv/Text"), var_20_9.level)
				end

				GetImageSpriteFromAtlasAsync("enemies/" .. var_20_9.icon .. "_d_blue", "", var_20_5:Find("icon"))
			end

			arg_20_0:UpdateHP(var_20_4:Find("hp"), var_20_2:GetHP(), var_20_2:GetMaxHP())
			arg_20_0:UpdateBuffList(var_20_4, var_20_2:GetBuffList())
			arg_20_0:UpdateMapBuff(var_20_4, var_20_2:GetRadiationBuffs(), var_20_0:GetBuffList(WorldMap.FactionEnemy, var_20_2))
		end

		setActive(var_20_4, var_20_7)
		setActive(var_20_5, false)
		setActive(var_20_4:Find("fighting"), false)

		if arg_20_1 == WorldMapAttachment.EventUpdateLurk and var_20_1:GetInFOV() and not var_20_2.lurk then
			setActive(var_20_4:Find("effect_found"), true)

			arg_20_0.lurkTimer = Timer.New(function()
				setActive(var_20_4:Find("effect_found"), false)
			end, 3, 1)

			arg_20_0.lurkTimer:Start()
		else
			setActive(var_20_4:Find("effect_found"), false)
		end
	end
end

function var_0_0.UpdateBox(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.map
	local var_22_1 = arg_22_0.cell
	local var_22_2 = arg_22_0.attachment
	local var_22_3 = arg_22_0.transform
	local var_22_4 = var_22_0:CheckDisplay(var_22_2)

	setActive(var_22_3, var_22_4)

	if var_22_4 then
		local var_22_5 = var_22_2:IsAvatar()

		if not arg_22_0.isInit then
			arg_22_0.isInit = true

			local var_22_6 = var_22_2.config
			local var_22_7 = var_22_3:Find("char")
			local var_22_8 = var_22_3:Find("icon")

			setActive(var_22_7, var_22_5)
			setActive(var_22_8, not var_22_5)
			setAnchoredPosition(var_22_7, var_0_0.CharBasePos)
			setAnchoredPosition(var_22_8, var_0_0.IconBasePos)

			if var_22_5 then
				arg_22_0:LoadAvatar(var_22_6.icon, var_22_7:Find("ship"))
			else
				arg_22_0:LoadBoxPrefab(var_22_6.icon, var_22_8)
			end

			arg_22_0:UpdateBuffList(var_22_3, {})
			arg_22_0:UpdateMapBuff(var_22_3, {}, {})
		end
	end
end

function var_0_0.UpdateEnemy(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.map
	local var_23_1 = arg_23_0.cell
	local var_23_2 = arg_23_0.attachment
	local var_23_3 = arg_23_0.transform
	local var_23_4 = var_23_3:Find("live")
	local var_23_5 = var_23_3:Find("dead")
	local var_23_6 = var_23_0:CheckDisplay(var_23_2)

	setActive(var_23_3, var_23_6)

	if var_23_6 then
		local var_23_7 = var_23_2:IsAlive()
		local var_23_8 = var_23_2:IsAvatar()

		if arg_23_0.isInit and arg_23_1 == WorldMap.EventUpdateMapBuff then
			arg_23_0:UpdateMapBuff(var_23_4, var_23_2:GetRadiationBuffs(), var_23_0:GetBuffList(WorldMap.FactionEnemy, var_23_2))
		end

		if not arg_23_0.isInit then
			arg_23_0.isInit = true

			local var_23_9 = var_23_2.config
			local var_23_10 = var_23_4:Find("char")
			local var_23_11 = var_23_4:Find("icon")

			setActive(var_23_10, var_23_8)
			setActive(var_23_11, not var_23_8)

			if var_23_8 then
				arg_23_0:LoadAvatar(var_23_9.icon, var_23_10:Find("ship"))
			else
				GetImageSpriteFromAtlasAsync("enemies/" .. var_23_9.icon, "", var_23_11:Find("pic"))

				local var_23_12 = WorldConst.EnemySize[var_23_9.type]

				setActive(var_23_11:Find("size/bg_s"), var_23_12 == 1 or not var_23_12)
				setActive(var_23_11:Find("size/bg_m"), var_23_12 == 2)
				setActive(var_23_11:Find("size/bg_h"), var_23_12 == 3)
				setActive(var_23_11:Find("size/bg_boss"), var_23_12 == 99)

				if var_23_9.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
					setActive(var_23_11:Find("size/bg_boss"), false)
					setText(var_23_11:Find("lv/Text"), WorldConst.WorldLevelCorrect(var_23_0.config.expedition_level, var_23_9.type))
				else
					setText(var_23_11:Find("lv/Text"), var_23_9.level)
				end

				GetImageSpriteFromAtlasAsync("enemies/" .. var_23_9.icon .. "_d_blue", "", var_23_5:Find("icon"))
			end

			arg_23_0:UpdateHP(var_23_4:Find("hp"), var_23_2:GetHP(), var_23_2:GetMaxHP())
			arg_23_0:UpdateBuffList(var_23_4, var_23_2:GetBuffList())
			arg_23_0:UpdateMapBuff(var_23_4, var_23_2:GetRadiationBuffs(), var_23_0:GetBuffList(WorldMap.FactionEnemy, var_23_2))
		end

		setActive(var_23_4, var_23_7)
		setActive(var_23_5, not var_23_8 and var_23_2.flag == 1)

		if var_23_7 then
			setActive(var_23_4:Find("fighting"), arg_23_0.isFighting)
		end
	end
end

function var_0_0.UpdatePort(arg_24_0, arg_24_1)
	setActive(arg_24_0.transform, false)
end

function var_0_0.UpdateTransportFleet(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.map
	local var_25_1 = arg_25_0.cell
	local var_25_2 = arg_25_0.attachment
	local var_25_3 = arg_25_0.transform
	local var_25_4 = var_25_0:CheckDisplay(var_25_2)

	setActive(var_25_3, var_25_4)

	if var_25_4 and not arg_25_0.isInit then
		arg_25_0.isInit = true

		local var_25_5 = var_25_2.config
		local var_25_6 = var_25_3:Find("ship/icon")

		GetImageSpriteFromAtlasAsync("enemies/" .. var_25_5.icon, "", var_25_6)
	end
end

function var_0_0.UpdateTrap(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.map
	local var_26_1 = arg_26_0.cell
	local var_26_2 = arg_26_0.attachment
	local var_26_3 = arg_26_0.transform
	local var_26_4 = var_26_0:CheckDisplay(var_26_2)

	setActive(var_26_3, var_26_4)

	if var_26_4 then
		local var_26_5 = var_26_2:IsAvatar()

		if not arg_26_0.isInit then
			arg_26_0.isInit = true

			local var_26_6 = var_26_2.config
			local var_26_7 = var_26_3:Find("char")
			local var_26_8 = var_26_3:Find("icon")

			setActive(var_26_7, var_26_5)
			setActive(var_26_8, not var_26_5)
			setAnchoredPosition(var_26_7, var_0_0.CharBasePos)
			setAnchoredPosition(var_26_8, var_0_0.IconBasePos)

			if var_26_5 then
				arg_26_0:LoadAvatar(var_26_6.trap_fx, var_26_7:Find("ship"))
			else
				arg_26_0:LoadBoxPrefab(var_26_6.trap_fx, var_26_8)
			end

			arg_26_0:UpdateBuffList(var_26_3, {})
			arg_26_0:UpdateMapBuff(var_26_3, {}, {})
		end
	end
end

function var_0_0.UpdateBuffList(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_1:Find("buffs")

	setActive(var_27_0, #arg_27_2 > 0)

	local var_27_1 = UIItemList.New(var_27_0, var_27_0:GetChild(0))

	var_27_1:make(function(arg_28_0, arg_28_1, arg_28_2)
		arg_28_1 = arg_28_1 + 1

		if arg_28_0 == UIItemList.EventUpdate then
			local var_28_0 = arg_27_2[arg_28_1]

			GetImageSpriteFromAtlasAsync("world/buff/" .. var_28_0.config.icon, "", arg_28_2)
		end
	end)
	var_27_1:align(#arg_27_2)
	setAnchoredPosition(var_27_0, {
		y = arg_27_0.modelType == WorldConst.ModelSpine and 100 or 0
	})
end

function var_0_0.UpdateMapBuff(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = arg_29_1:Find("map_buff")
	local var_29_1 = false

	if #arg_29_2 > 0 then
		var_29_1 = "wifi"

		local var_29_2, var_29_3, var_29_4 = unpack(arg_29_2[1])

		GetImageSpriteFromAtlasAsync("world/mapbuff/" .. pg.world_SLGbuff_data[var_29_3].icon, "", var_29_0:Find("Image"))
	elseif #arg_29_3 > 0 then
		var_29_1 = "arrow"

		local var_29_5 = arg_29_3[1]

		GetImageSpriteFromAtlasAsync("world/mapbuff/" .. var_29_5.config.icon, "", var_29_0:Find("Image"))
	end

	setActive(var_29_0:Find("wifi"), var_29_1 == "wifi")
	setActive(var_29_0:Find("arrow"), var_29_1 == "arrow")
	setActive(var_29_0, var_29_1)
end

function var_0_0.UpdateHP(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	setActive(arg_30_1, arg_30_2 and arg_30_3)

	if arg_30_2 and arg_30_3 then
		setSlider(arg_30_1, 0, arg_30_3, arg_30_2)
	end
end

function var_0_0.UpdateBreathTween(arg_31_0)
	local var_31_0 = arg_31_0.attachment

	if var_31_0:IsFloating() and var_31_0:IsAlive() and var_31_0:IsVisible() then
		if not arg_31_0.twBreathId then
			arg_31_0.transform.localPosition = Vector3(0, 40, 0)

			local var_31_1 = LeanTween.moveY(arg_31_0.transform, 50, 1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

			var_31_1.passed = arg_31_0.twTimer.passed
			var_31_1.direction = arg_31_0.twTimer.direction
			arg_31_0.twBreathId = var_31_1.uniqueId
		end
	elseif arg_31_0.twBreathId then
		LeanTween.cancel(arg_31_0.twBreathId)

		arg_31_0.twBreathId = nil
		arg_31_0.transform.localPosition = Vector3(0, 40, 0)
	end
end

function var_0_0.UpdateIsFighting(arg_32_0, arg_32_1)
	assert(WorldMapAttachment.IsEnemyType(arg_32_0.attachment.type))

	if arg_32_0.isFighting ~= arg_32_1 then
		arg_32_0.isFighting = arg_32_1

		arg_32_0:UpdateEnemy()
	end
end

function var_0_0.TrapAnimDisplay(arg_33_0, arg_33_1)
	local var_33_0 = {}
	local var_33_1 = arg_33_0.model:GetChild(0)

	table.insert(var_33_0, function(arg_34_0)
		var_33_1:GetComponent("DftAniEvent"):SetEndEvent(arg_34_0)
		var_33_1:GetComponent("Animator"):Play("disappear")
	end)
	table.insert(var_33_0, function(arg_35_0)
		local var_35_0 = arg_33_0.attachment:GetScale(arg_33_0.attachment.config.trap_range[1])

		arg_33_0:UpdateModelScale(var_35_0)
		var_33_1:GetComponent("DftAniEvent"):SetEndEvent(arg_35_0)
		var_33_1:GetComponent("Animator"):Play("vortexAnimation")
	end)
	table.insert(var_33_0, function(arg_36_0)
		arg_33_0:UpdateModelScale(Vector3.zero)
		var_33_1:GetComponent("Animator"):Play("loop")
		arg_36_0()
	end)
	seriesAsync(var_33_0, arg_33_1)
end

return var_0_0
