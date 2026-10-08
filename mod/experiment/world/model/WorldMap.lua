local var_0_0 = class("WorldMap", import("...BaseEntity"))

var_0_0.Fields = {
	config = "table",
	cells = "table",
	gid = "number",
	isDelegated = "boolean",
	findex = "number",
	phaseDisplayList = "table",
	isPressing = "boolean",
	salvageAutoResult = "boolean",
	id = "number",
	valid = "boolean",
	clearFlag = "boolean",
	visionFlag = "boolean",
	isLoss = "boolean",
	bottom = "number",
	centerCellFOV = "table",
	typeAttachments = "table",
	isCost = "boolean",
	theme = "table",
	fleets = "table",
	left = "number",
	factionBuffs = "table",
	ports = "table",
	top = "number",
	active = "boolean",
	right = "number"
}
var_0_0.Listeners = {
	onUpdateAttachmentExist = "OnUpdateAttachmentExist"
}
var_0_0.EventUpdateActive = "WorldMap.EventUpdateActive"
var_0_0.EventUpdateFIndex = "WorldMap.EventUpdateFIndex"
var_0_0.EventUpdateMapBuff = "WorldMap.EventUpdateMapBuff"
var_0_0.EventUpdateFleetFOV = "WorldMap.EventUpdateFleetFOV"
var_0_0.EventUpdateMoveSpeed = "WorldMap.EventUpdateMoveSpeed"

function var_0_0.DebugPrint(arg_1_0)
	return string.format("地图 [%s] [id: %s] [gid: %s] [危险度: %s] [是否委派：%s] [是否压制：%s]", arg_1_0.config.name, arg_1_0.id, tostring(arg_1_0.gid), arg_1_0:GetDanger(), arg_1_0.isDelegated, arg_1_0.isPressing)
end

function var_0_0.Build(arg_2_0)
	arg_2_0.cells = {}
	arg_2_0.ports = {}
	arg_2_0.phaseDisplayList = {}
end

function var_0_0.Dispose(arg_3_0)
	arg_3_0:UnbindFleets()
	arg_3_0:DisposeTheme()
	arg_3_0:DisposeGrid()
	arg_3_0:DisposePort()
	arg_3_0:Clear()
end

function var_0_0.Setup(arg_4_0, arg_4_1)
	arg_4_0.id = arg_4_1

	assert(pg.world_chapter_random[arg_4_0.id], "world_chapter_random not exist: " .. tostring(arg_4_0.id))

	arg_4_0.config = setmetatable({}, {
		__index = function(arg_5_0, arg_5_1)
			return arg_4_0:GetConfig(arg_5_1)
		end
	})
end

function var_0_0.GetName(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1 and World.ReplacementMapType(arg_6_1, arg_6_0)

	if var_6_0 == "sairen_chapter" or var_6_0 == "teasure_chapter" then
		return arg_6_1:GetBaseMap():GetName() .. "-" .. arg_6_0.config.name
	else
		return arg_6_0.config.name
	end
end

function var_0_0.GetConfig(arg_7_0, arg_7_1)
	local var_7_0 = pg.world_chapter_random[arg_7_0.id]
	local var_7_1 = pg.world_chapter_template[arg_7_0.gid]
	local var_7_2 = var_7_0 and var_7_0[arg_7_1] or var_7_1 and var_7_1[arg_7_1] or nil

	assert(var_7_2 ~= nil, "can not find " .. arg_7_1 .. " in WorldMap " .. arg_7_0.id)

	return var_7_2
end

var_0_0.FactionSelf = 0
var_0_0.FactionEnemy = 1

function var_0_0.UpdateGridId(arg_8_0, arg_8_1)
	arg_8_0.gid = arg_8_1

	assert(pg.world_chapter_template[arg_8_0.gid], "world_chapter_template not exist: " .. tostring(arg_8_0.gid))
	arg_8_0:DisposeTheme()
	arg_8_0:DisposeGrid()
	arg_8_0:DisposePort()

	arg_8_0.factionBuffs = {
		[var_0_0.FactionSelf] = {},
		[var_0_0.FactionEnemy] = {}
	}

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.config.world_chapter_buff) do
		local var_8_0, var_8_1, var_8_2 = unpack(iter_8_1)

		arg_8_0:AddBuff(var_8_0, var_8_1, var_8_2)
	end

	arg_8_0:SetupTheme()
	arg_8_0:SetupGrid()
	arg_8_0:SetupPort()
end

function var_0_0.SetupTheme(arg_9_0)
	local var_9_0 = WPool:Get(WorldMapTheme)

	var_9_0:Setup(arg_9_0.config.theme)

	arg_9_0.theme = var_9_0
end

function var_0_0.DisposeTheme(arg_10_0)
	if arg_10_0.theme then
		WPool:Return(arg_10_0.theme)

		arg_10_0.theme = nil
	end
end

function var_0_0.SetupGrid(arg_11_0, arg_11_1)
	_.each(arg_11_0.config.grids, function(arg_12_0)
		local var_12_0 = WPool:Get(WorldMapCell)

		var_12_0:Setup(arg_12_0)

		if arg_11_0:AlwaysInFOV() then
			var_12_0.infov = bit.bor(var_12_0.infov, WorldConst.FOVMapSight)
		end

		local var_12_1 = WorldMapCell.GetName(var_12_0.row, var_12_0.column)

		arg_11_0.cells[var_12_1] = var_12_0

		if not arg_11_1 then
			var_12_0:AddListener(WorldMapCell.EventAddAttachment, arg_11_0.onUpdateAttachmentExist)
			var_12_0:AddListener(WorldMapCell.EventRemoveAttachment, arg_11_0.onUpdateAttachmentExist)
		end
	end)

	arg_11_0.left, arg_11_0.right = 999999, 0
	arg_11_0.top, arg_11_0.bottom = 999999, 0

	for iter_11_0 = 0, WorldConst.MaxRow do
		local var_11_0
		local var_11_1

		for iter_11_1 = 0, WorldConst.MaxColumn do
			local var_11_2 = arg_11_0:GetCell(iter_11_0, iter_11_1)

			if var_11_2 then
				if not var_11_0 then
					var_11_0 = iter_11_1
					var_11_2.dir = bit.bor(var_11_2.dir, bit.lshift(1, WorldConst.DirLeft))
				end

				var_11_1 = iter_11_1
			end
		end

		if var_11_1 then
			local var_11_3 = arg_11_0:GetCell(iter_11_0, var_11_1)

			var_11_3.dir = bit.bor(var_11_3.dir, bit.lshift(1, WorldConst.DirRight))
		end

		if var_11_0 then
			arg_11_0.left = math.min(arg_11_0.left, var_11_0)
		end

		if var_11_1 then
			arg_11_0.right = math.max(arg_11_0.right, var_11_1)
		end
	end

	for iter_11_2 = 0, WorldConst.MaxColumn do
		local var_11_4
		local var_11_5

		for iter_11_3 = 0, WorldConst.MaxRow do
			local var_11_6 = arg_11_0:GetCell(iter_11_3, iter_11_2)

			if var_11_6 then
				if not var_11_4 then
					var_11_4 = iter_11_3
					var_11_6.dir = bit.bor(var_11_6.dir, bit.lshift(1, WorldConst.DirUp))
				end

				var_11_5 = iter_11_3
			end
		end

		if var_11_5 then
			local var_11_7 = arg_11_0:GetCell(var_11_5, iter_11_2)

			var_11_7.dir = bit.bor(var_11_7.dir, bit.lshift(1, WorldConst.DirDown))
		end

		if var_11_4 then
			arg_11_0.top = math.min(arg_11_0.top, var_11_4)
		end

		if var_11_5 then
			arg_11_0.bottom = math.max(arg_11_0.bottom, var_11_5)
		end
	end
end

function var_0_0.DisposeGrid(arg_13_0, arg_13_1)
	if not arg_13_1 then
		for iter_13_0, iter_13_1 in pairs(arg_13_0.cells) do
			iter_13_1:RemoveListener(WorldMapCell.EventAddAttachment, arg_13_0.onUpdateAttachmentExist)
			iter_13_1:RemoveListener(WorldMapCell.EventRemoveAttachment, arg_13_0.onUpdateAttachmentExist)
		end
	end

	WPool:ReturnMap(arg_13_0.cells)

	arg_13_0.cells = {}
	arg_13_0.typeAttachments = {}
	arg_13_0.left = nil
	arg_13_0.top = nil
	arg_13_0.right = nil
	arg_13_0.bottom = nil
end

function var_0_0.SetupPort(arg_14_0)
	if #arg_14_0.config.port_id > 0 then
		local var_14_0 = WPool:Get(WorldMapPort)

		var_14_0:Setup(arg_14_0.config.port_id[1])

		local var_14_1, var_14_2 = unpack(arg_14_0.config.port_id[2])

		for iter_14_0 = var_14_1 - 1, var_14_1 + 1 do
			for iter_14_1 = var_14_2 - 1, var_14_2 + 1 do
				if iter_14_0 ~= var_14_1 or iter_14_1 ~= var_14_2 then
					local var_14_3 = arg_14_0:GetCell(iter_14_0, iter_14_1)

					if var_14_3 then
						var_14_3:AddAttachment(WorldMapAttachment.MakeFakePort(iter_14_0, iter_14_1, var_14_0.id))
					end
				end
			end
		end

		table.insert(arg_14_0.ports, var_14_0)
	end
end

function var_0_0.DisposePort(arg_15_0)
	WPool:ReturnArray(arg_15_0.ports)

	arg_15_0.ports = {}
end

function var_0_0.IsValid(arg_16_0)
	return arg_16_0.valid
end

function var_0_0.SetValid(arg_17_0, arg_17_1)
	arg_17_0.valid = arg_17_1

	if arg_17_1 and arg_17_0.fleets then
		for iter_17_0, iter_17_1 in ipairs(arg_17_0:GetNormalFleets()) do
			arg_17_0.centerCellFOV = {
				row = iter_17_1.row,
				column = iter_17_1.column
			}

			if arg_17_0:GetFleetTerrain(iter_17_1) ~= WorldMapCell.TerrainFog then
				WorldConst.RangeCheck(iter_17_1, arg_17_0:GetFOVRange(iter_17_1), function(arg_18_0, arg_18_1)
					local var_18_0 = arg_17_0.cells[WorldMapCell.GetName(arg_18_0, arg_18_1)]

					if var_18_0 then
						var_18_0:ChangeInLight(true)
					end
				end)
			elseif arg_17_0.findex == iter_17_0 then
				local var_17_0 = {}

				WorldConst.RangeCheck(iter_17_1, arg_17_0:GetFOVRange(iter_17_1), function(arg_19_0, arg_19_1)
					local var_19_0 = WorldMapCell.GetName(arg_19_0, arg_19_1)

					if arg_17_0.cells[var_19_0] then
						var_17_0[var_19_0] = true
					end
				end)

				local var_17_1 = arg_17_0:IsFleetTerrainSairenFog(iter_17_1)

				for iter_17_2, iter_17_3 in pairs(arg_17_0.cells) do
					iter_17_3:UpdateFog(true, var_17_0[iter_17_2], var_17_1)
				end
			end
		end
	end
end

function var_0_0.IsMapOpen(arg_20_0)
	return nowWorld():GetProgress() >= arg_20_0:GetOpenProgress()
end

function var_0_0.GetOpenProgress(arg_21_0)
	local var_21_0 = nowWorld():GetRealm()

	return var_21_0 > 0 and arg_21_0.config.open_stage[var_21_0] or 9999
end

function var_0_0.RemoveAllCellDiscovered(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.cells) do
		iter_22_1:UpdateDiscovered(false)
	end
end

function var_0_0.GetDanger(arg_23_0)
	return arg_23_0.config.hazard_level
end

function var_0_0.BindFleets(arg_24_0, arg_24_1)
	arg_24_0.fleets = arg_24_1
end

function var_0_0.UnbindFleets(arg_25_0)
	arg_25_0.fleets = nil
end

function var_0_0.GetFleets(arg_26_0)
	return underscore.to_array(arg_26_0.fleets)
end

function var_0_0.GetFleet(arg_27_0, arg_27_1)
	return arg_27_1 and _.detect(arg_27_0.fleets, function(arg_28_0)
		return arg_28_0.id == arg_27_1
	end) or arg_27_0.fleets[arg_27_0.findex]
end

function var_0_0.GetNormalFleets(arg_29_0)
	return _.filter(arg_29_0.fleets, function(arg_30_0)
		return arg_30_0:GetFleetType() == FleetType.Normal
	end)
end

function var_0_0.GetSubmarineFleet(arg_31_0)
	return _.detect(arg_31_0.fleets, function(arg_32_0)
		return arg_32_0:GetFleetType() == FleetType.Submarine
	end)
end

function var_0_0.FindFleet(arg_33_0, arg_33_1, arg_33_2)
	return _.detect(arg_33_0.fleets, function(arg_34_0)
		return arg_34_0.row == arg_33_1 and arg_34_0.column == arg_33_2
	end)
end

function var_0_0.CheckFleetMovable(arg_35_0, arg_35_1)
	return arg_35_0:GetCell(arg_35_1.row, arg_35_1.column):CanLeave()
end

function var_0_0.GetFleetTerrain(arg_36_0, arg_36_1)
	return arg_36_0:GetCell(arg_36_1.row, arg_36_1.column):GetTerrain()
end

function var_0_0.IsFleetTerrainSairenFog(arg_37_0, arg_37_1)
	return arg_37_0:GetCell(arg_37_1.row, arg_37_1.column):IsTerrainSairenFog()
end

function var_0_0.RemoveFleetsCarries(arg_38_0, arg_38_1)
	arg_38_1 = arg_38_1 or arg_38_0.fleets

	_.each(arg_38_1, function(arg_39_0)
		arg_39_0:RemoveAllCarries()
	end)
end

function var_0_0.UpdateFleetIndex(arg_40_0, arg_40_1)
	if arg_40_0.findex ~= arg_40_1 then
		arg_40_0:CheckSelectFleetUpdateFog(function()
			arg_40_0.findex = arg_40_1
		end)
		arg_40_0:DispatchEvent(var_0_0.EventUpdateFIndex)
	end
end

function var_0_0.UpdateActive(arg_42_0, arg_42_1)
	local var_42_0 = nowWorld():GetAtlas()

	if arg_42_0.active ~= arg_42_1 then
		arg_42_0.active = arg_42_1

		if arg_42_1 then
			arg_42_0:SetValid(false)
			var_42_0:SetActiveMap(arg_42_0)

			arg_42_0.isCost = true

			var_42_0:UpdateCostMap(arg_42_0.id, arg_42_0.isCost)
		elseif arg_42_0:NeedClear() then
			arg_42_0:RemoveAllCellDiscovered()

			arg_42_0.clearFlag = false
			arg_42_0.isCost = false

			var_42_0:UpdateCostMap(arg_42_0.id, arg_42_0.isCost)
		end

		arg_42_0:DispatchEvent(var_0_0.EventUpdateActive)
	end
end

function var_0_0.InPort(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_0:GetPort()

	if not var_43_0 or arg_43_2 and var_43_0.config.port_camp ~= arg_43_2 then
		return false
	end

	local var_43_1 = arg_43_0:GetFleet(arg_43_1)

	if var_43_1:GetFleetType() == FleetType.Submarine then
		return var_43_0.id
	else
		local var_43_2 = arg_43_0:GetCell(var_43_1.row, var_43_1.column):GetAliveAttachment()

		if var_43_2 and var_43_2.type == WorldMapAttachment.TypePort then
			return var_43_2.id
		end
	end

	return false
end

function var_0_0.canExit(arg_44_0)
	return arg_44_0.gid and pg.world_chapter_template_reset[arg_44_0.gid] ~= nil
end

function var_0_0.CheckAttachmentTransport(arg_45_0)
	local var_45_0 = WorldConst.GetTransportBlockEvent()
	local var_45_1 = arg_45_0:FindAttachments(WorldMapAttachment.TypeEvent)

	for iter_45_0, iter_45_1 in ipairs(var_45_1) do
		if iter_45_1:IsAlive() and var_45_0[iter_45_1.id] then
			return "block"
		end
	end

	local var_45_2 = WorldConst.GetTransportStoryEvent()

	for iter_45_2, iter_45_3 in ipairs(var_45_1) do
		if iter_45_3:IsAlive() and var_45_2[iter_45_3.id] then
			return "story"
		end
	end
end

function var_0_0.GetPort(arg_46_0, arg_46_1)
	return arg_46_1 and _.detect(arg_46_0.ports, function(arg_47_0)
		return arg_47_0.id == arg_46_1
	end) or arg_46_0.ports[1]
end

function var_0_0.GetCell(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = WorldMapCell.GetName(arg_48_1, arg_48_2)

	return arg_48_0.cells[var_48_0]
end

function var_0_0.CalcTransportPos(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = calcPositionAngle(arg_49_1.config.area_pos[1] - arg_49_2.config.area_pos[1], arg_49_1.config.area_pos[2] - arg_49_2.config.area_pos[2])
	local var_49_1 = false

	if not arg_49_0.gid then
		var_49_1 = true
		arg_49_0.gid = arg_49_0.config.template_id[1][1]

		arg_49_0:SetupGrid(var_49_1)
	end

	local var_49_2 = {
		row = (arg_49_0.top + arg_49_0.bottom) / 2,
		column = (arg_49_0.left + arg_49_0.right) / 2
	}
	local var_49_3
	local var_49_4 = 4294967295
	local var_49_5

	for iter_49_0 = arg_49_0.left + 1, arg_49_0.right - 1 do
		local var_49_6 = math.abs(calcPositionAngle(iter_49_0 - var_49_2.column, var_49_2.row - arg_49_0.top) - var_49_0)

		if var_49_6 < var_49_4 then
			var_49_3 = {
				row = arg_49_0.top,
				column = iter_49_0
			}
			var_49_4 = var_49_6
		end

		local var_49_7 = math.abs(calcPositionAngle(iter_49_0 - var_49_2.column, var_49_2.row - arg_49_0.bottom) - var_49_0)

		if var_49_7 < var_49_4 then
			var_49_3 = {
				row = arg_49_0.bottom,
				column = iter_49_0
			}
			var_49_4 = var_49_7
		end
	end

	for iter_49_1 = arg_49_0.top + 1, arg_49_0.bottom - 1 do
		local var_49_8 = math.abs(calcPositionAngle(arg_49_0.left - var_49_2.column, var_49_2.row - iter_49_1) - var_49_0)

		if var_49_8 < var_49_4 then
			var_49_3 = {
				row = iter_49_1,
				column = arg_49_0.left
			}
			var_49_4 = var_49_8
		end

		local var_49_9 = math.abs(calcPositionAngle(arg_49_0.right - var_49_2.column, var_49_2.row - iter_49_1) - var_49_0)

		if var_49_9 < var_49_4 then
			var_49_3 = {
				row = iter_49_1,
				column = arg_49_0.right
			}
			var_49_4 = var_49_9
		end
	end

	if var_49_1 then
		arg_49_0:DisposeGrid(var_49_1)

		arg_49_0.gid = nil
	end

	return var_49_3
end

function var_0_0.AnyFleetInEdge(arg_50_0)
	return arg_50_0.active and _.any(arg_50_0:GetNormalFleets(), function(arg_51_0)
		return arg_51_0.row == arg_50_0.top or arg_51_0.row == arg_50_0.bottom or arg_51_0.column == arg_50_0.left or arg_51_0.column == arg_50_0.right
	end)
end

function var_0_0.CheckInteractive(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0:FindAttachments(WorldMapAttachment.TypeEvent)

	for iter_52_0, iter_52_1 in ipairs(var_52_0) do
		if iter_52_1:RemainOpEffect() then
			return iter_52_1
		end
	end

	for iter_52_2, iter_52_3 in ipairs(var_52_0) do
		if iter_52_3:IsAlive() then
			local var_52_1 = iter_52_3:GetEventEffect()

			if var_52_1 and var_52_1.autoactivate > 0 then
				return iter_52_3
			end
		end
	end

	arg_52_1 = arg_52_1 or arg_52_0:GetFleet()

	local var_52_2 = arg_52_0:GetCell(arg_52_1.row, arg_52_1.column)

	if var_52_2.discovered then
		local var_52_3 = var_52_2:GetAliveAttachments()

		for iter_52_4, iter_52_5 in ipairs(var_52_3) do
			if WorldMapAttachment.IsInteractiveType(iter_52_5.type) and not iter_52_5:IsTriggered() then
				if iter_52_5:IsSign() then
					return nil
				elseif iter_52_5.type == WorldMapAttachment.TypeEvent then
					local var_52_4 = iter_52_5:GetEventEffect()

					if var_52_4 and (var_52_4.effective_num <= 1 or arg_52_0:CountEventEffectKeys(var_52_4) >= var_52_4.effective_num) then
						return iter_52_5
					end
				else
					return iter_52_5
				end
			end
		end
	end
end

function var_0_0.CheckDiscover(arg_53_0)
	local var_53_0 = {}
	local var_53_1 = arg_53_0.theme

	for iter_53_0, iter_53_1 in pairs(arg_53_0.cells) do
		if not iter_53_1.discovered and iter_53_1:GetInFOV() then
			table.insert(var_53_0, {
				row = iter_53_1.row,
				column = iter_53_1.column
			})
		end
	end

	return var_53_0
end

function var_0_0.CheckDisplay(arg_54_0, arg_54_1)
	if arg_54_1.type == WorldMapAttachment.TypeTrap then
		return true
	end

	return arg_54_0:GetCell(arg_54_1.row, arg_54_1.column):GetDisplayAttachment() == arg_54_1
end

function var_0_0.GetFOVRange(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	arg_55_2 = arg_55_2 or arg_55_1.row
	arg_55_3 = arg_55_3 or arg_55_1.column

	local var_55_0 = arg_55_0:GetCell(arg_55_2, arg_55_3)

	return var_55_0:GetTerrain() == WorldMapCell.TerrainFog and var_55_0.terrainStrong or arg_55_1:GetFOVRange()
end

function var_0_0.UpdateVisionFlag(arg_56_0, arg_56_1)
	arg_56_0.visionFlag = arg_56_1

	arg_56_0:OrderAROpenFOV(arg_56_0.visionFlag)
end

function var_0_0.UpdateDeteagtedMark(arg_57_0, arg_57_1)
	if tobool(arg_57_0.isDelegated) ~= tobool(arg_57_1) then
		arg_57_0.isDelegated = arg_57_1
	end
end

function var_0_0.UpdatePressingMark(arg_58_0, arg_58_1)
	if tobool(arg_58_0.isPressing) ~= tobool(arg_58_1) then
		arg_58_0.isPressing = arg_58_1

		nowWorld():GetTaskProxy():doUpdateTaskByMap(arg_58_0.id, arg_58_1)
	end
end

function var_0_0.ExistAny(arg_59_0, arg_59_1, arg_59_2)
	return arg_59_0:GetCell(arg_59_1, arg_59_2):GetAliveAttachment() or arg_59_0:ExistFleet(arg_59_1, arg_59_2)
end

function var_0_0.ExistFleet(arg_60_0, arg_60_1, arg_60_2)
	return tobool(arg_60_0:FindFleet(arg_60_1, arg_60_2))
end

function var_0_0.CalcFleetSpeed(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_1:GetSpeed()

	if arg_61_0:GetCell(arg_61_1.row, arg_61_1.column):GetTerrain() == WorldMapCell.TerrainFog then
		var_61_0 = math.min(var_61_0, 1)
	end

	return var_61_0
end

function var_0_0.FindPath(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	local var_62_0 = var_0_0.pathFinder

	if not var_62_0 then
		var_62_0 = PathFinding.New({}, WorldConst.MaxRow, WorldConst.MaxColumn)
		var_0_0.pathFinder = var_62_0
	end

	local var_62_1 = {}

	for iter_62_0 = 0, WorldConst.MaxRow - 1 do
		if not var_62_1[iter_62_0] then
			var_62_1[iter_62_0] = {}
		end

		for iter_62_1 = 0, WorldConst.MaxColumn - 1 do
			local var_62_2 = PathFinding.PrioForbidden

			if arg_62_0:IsWalkable(iter_62_0, iter_62_1) and (not arg_62_3 or arg_62_0:GetCell(iter_62_0, iter_62_1):GetInFOV()) then
				var_62_2 = PathFinding.PrioNormal

				if iter_62_0 == arg_62_2.row and iter_62_1 == arg_62_2.column then
					if not arg_62_0:IsStayPoint(iter_62_0, iter_62_1) then
						var_62_2 = PathFinding.PrioObstacle
					end
				elseif arg_62_0:IsObstacle(iter_62_0, iter_62_1) then
					var_62_2 = PathFinding.PrioObstacle
				end
			end

			var_62_1[iter_62_0][iter_62_1] = var_62_2
		end
	end

	var_62_0.cells = var_62_1

	return var_62_0:Find(arg_62_1, arg_62_2)
end

function var_0_0.FindAIPath(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = var_0_0.pathFinder

	if not var_63_0 then
		var_63_0 = PathFinding.New({}, WorldConst.MaxRow, WorldConst.MaxColumn)
		var_0_0.pathFinder = var_63_0
	end

	local var_63_1 = {}

	for iter_63_0 = 0, WorldConst.MaxRow - 1 do
		if not var_63_1[iter_63_0] then
			var_63_1[iter_63_0] = {}
		end

		for iter_63_1 = 0, WorldConst.MaxColumn - 1 do
			local var_63_2 = PathFinding.PrioForbidden

			if arg_63_0:IsWalkable(iter_63_0, iter_63_1) then
				var_63_2 = PathFinding.PrioNormal

				if (iter_63_0 ~= arg_63_2.row or iter_63_1 ~= arg_63_2.column) and arg_63_0:ExistFleet(iter_63_0, iter_63_1) then
					var_63_2 = PathFinding.PrioObstacle
				end
			end

			var_63_1[iter_63_0][iter_63_1] = var_63_2
		end
	end

	var_63_0.cells = var_63_1

	return var_63_0:Find(arg_63_1, arg_63_2)
end

function var_0_0.GetMoveRange(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_1.row
	local var_64_1 = arg_64_1.column
	local var_64_2 = arg_64_0:CalcFleetSpeed(arg_64_1)
	local var_64_3 = {}

	for iter_64_0 = 0, WorldConst.MaxRow - 1 do
		if not var_64_3[iter_64_0] then
			var_64_3[iter_64_0] = {}
		end

		for iter_64_1 = 0, WorldConst.MaxColumn - 1 do
			var_64_3[iter_64_0][iter_64_1] = arg_64_0:IsWalkable(iter_64_0, iter_64_1)
		end
	end

	local var_64_4 = {}
	local var_64_5 = {
		{
			step = 0,
			row = var_64_0,
			column = var_64_1
		}
	}

	var_64_3[var_64_0][var_64_1] = false

	while #var_64_5 > 0 do
		local var_64_6 = table.remove(var_64_5, 1)

		table.insert(var_64_4, var_64_6)

		local var_64_7 = {
			{
				row = 1,
				column = 0
			},
			{
				row = -1,
				column = 0
			},
			{
				row = 0,
				column = 1
			},
			{
				row = 0,
				column = -1
			}
		}

		_.each(var_64_7, function(arg_65_0)
			arg_65_0.row = var_64_6.row + arg_65_0.row
			arg_65_0.column = var_64_6.column + arg_65_0.column
			arg_65_0.step = var_64_6.step + 1

			if arg_65_0.row >= 0 and arg_65_0.row < WorldConst.MaxRow and arg_65_0.column >= 0 and arg_65_0.column < WorldConst.MaxColumn and arg_65_0.step <= var_64_2 and var_64_3[arg_65_0.row][arg_65_0.column] then
				var_64_3[arg_65_0.row][arg_65_0.column] = false

				if arg_64_0:IsObstacle(arg_65_0.row, arg_65_0.column) then
					table.insert(var_64_4, arg_65_0)
				else
					table.insert(var_64_5, arg_65_0)
				end
			end
		end)
	end

	var_64_4 = _.filter(var_64_4, function(arg_66_0)
		return arg_64_0:IsStayPoint(arg_66_0.row, arg_66_0.column)
	end)

	return var_64_4
end

function var_0_0.BuildLongMoveInfos(arg_67_0)
	local var_67_0 = {}

	for iter_67_0 = 0, WorldConst.MaxRow - 1 do
		var_67_0[iter_67_0] = var_67_0[iter_67_0] or {}

		for iter_67_1 = 0, WorldConst.MaxColumn - 1 do
			if arg_67_0:IsWalkable(iter_67_0, iter_67_1) and arg_67_0:GetCell(iter_67_0, iter_67_1):GetInFOV() then
				var_67_0[iter_67_0][iter_67_1] = {
					isMark = false,
					isFinish = false,
					row = iter_67_0,
					column = iter_67_1,
					dp = {},
					last = {},
					isStayPoint = arg_67_0:IsStayPoint(iter_67_0, iter_67_1),
					isObstacle = arg_67_0:IsObstacle(iter_67_0, iter_67_1)
				}
			end
		end
	end

	return var_67_0
end

function var_0_0.GetLongMoveRange(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_1.row
	local var_68_1 = arg_68_1.column
	local var_68_2 = arg_68_0:CalcFleetSpeed(arg_68_1)
	local var_68_3 = arg_68_0:BuildLongMoveInfos()
	local var_68_4 = {}
	local var_68_5 = {}
	local var_68_6 = {
		{
			row = 1,
			column = 0
		},
		{
			row = -1,
			column = 0
		},
		{
			row = 0,
			column = 1
		},
		{
			row = 0,
			column = -1
		}
	}

	local function var_68_7(arg_69_0, arg_69_1, arg_69_2)
		return arg_69_0 < arg_69_1 or arg_69_2 < arg_69_0
	end

	local function var_68_8(arg_70_0)
		if not arg_70_0 then
			return
		end

		arg_70_0.isFinish = true

		table.insert(var_68_4, arg_70_0)

		if arg_70_0.isStayPoint then
			local var_70_0 = arg_70_0.dp

			for iter_70_0 = 1, var_68_2 do
				if var_70_0[iter_70_0] and (not var_70_0[0] or var_70_0[0] > var_70_0[iter_70_0] + 1) then
					var_70_0[0] = var_70_0[iter_70_0] + 1
					arg_70_0.last[0] = arg_70_0.last[iter_70_0]
				end
			end
		end
	end

	local var_68_9 = var_68_3[var_68_0][var_68_1]

	var_68_9.dp[0] = 0
	var_68_9.isMark = true

	var_68_8(var_68_9)

	while var_68_9 do
		_.each(var_68_6, function(arg_71_0)
			if var_68_7(var_68_9.row + arg_71_0.row, 0, WorldConst.MaxRow - 1) or var_68_7(var_68_9.column + arg_71_0.column, 0, WorldConst.MaxColumn - 1) then
				return
			end

			local var_71_0 = var_68_3[var_68_9.row + arg_71_0.row][var_68_9.column + arg_71_0.column]

			if var_71_0 and not var_71_0.isFinish then
				for iter_71_0 = 1, var_68_2 do
					if var_68_9.dp[iter_71_0 - 1] and (not var_71_0.dp[iter_71_0] or var_71_0.dp[iter_71_0] > var_68_9.dp[iter_71_0 - 1]) then
						var_71_0.dp[iter_71_0] = var_68_9.dp[iter_71_0 - 1]
						var_71_0.last[iter_71_0] = {
							var_68_9,
							iter_71_0 - 1
						}

						if not var_71_0.isMark then
							var_71_0.isMark = true

							table.insert(var_68_5, var_71_0)
						end
					end
				end
			end
		end)

		repeat
			var_68_9 = table.remove(var_68_5, 1)

			var_68_8(var_68_9)
		until not var_68_9 or not var_68_9.isObstacle
	end

	local var_68_10 = {}

	for iter_68_0, iter_68_1 in ipairs(var_68_4) do
		if iter_68_1.dp[0] and iter_68_1.dp[0] > 0 then
			table.insert(var_68_10, {
				row = iter_68_1.row,
				column = iter_68_1.column,
				stay = iter_68_1.dp[0]
			})
		end
	end

	return var_68_10, var_68_3
end

function var_0_0.IsWalkable(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = arg_72_0:GetCell(arg_72_1, arg_72_2)

	return var_72_0 and var_72_0.walkable and (var_72_0:CanLeave() or arg_72_0:IsStayPoint(arg_72_1, arg_72_2))
end

function var_0_0.IsStayPoint(arg_73_0, arg_73_1, arg_73_2)
	return arg_73_0:GetCell(arg_73_1, arg_73_2):CanArrive() and not arg_73_0:ExistFleet(arg_73_1, arg_73_2)
end

function var_0_0.IsObstacle(arg_74_0, arg_74_1, arg_74_2)
	return not arg_74_0:GetCell(arg_74_1, arg_74_2):CanPass()
end

function var_0_0.IsSign(arg_75_0, arg_75_1, arg_75_2)
	return arg_75_0:GetCell(arg_75_1, arg_75_2):IsSign()
end

function var_0_0.FindNearestBlankPoint(arg_76_0, arg_76_1, arg_76_2)
	local var_76_0 = {}

	for iter_76_0 = 0, WorldConst.MaxRow - 1 do
		if not var_76_0[iter_76_0] then
			var_76_0[iter_76_0] = {}
		end

		for iter_76_1 = 0, WorldConst.MaxColumn - 1 do
			var_76_0[iter_76_0][iter_76_1] = arg_76_0:IsWalkable(iter_76_0, iter_76_1)
		end
	end

	local var_76_1 = {
		row = arg_76_1,
		column = arg_76_2
	}
	local var_76_2 = {}

	while #var_76_1 > 0 do
		local var_76_3 = table.remove(var_76_1, 1)

		table.insert(var_76_2, var_76_3)

		local var_76_4 = {
			{
				row = 1,
				column = 0
			},
			{
				row = -1,
				column = 0
			},
			{
				row = 0,
				column = 1
			},
			{
				row = 0,
				column = -1
			}
		}

		_.each(var_76_4, function(arg_77_0)
			arg_77_0.row = var_76_3.row + arg_77_0.row
			arg_77_0.column = var_76_3.column + arg_77_0.column

			if arg_77_0.row >= 0 and arg_77_0.row < WorldConst.MaxRow and arg_77_0.column >= 0 and arg_77_0.column < WorldConst.MaxColumn and not (_.any(var_76_1, function(arg_78_0)
				return arg_78_0.row == arg_77_0.row and arg_78_0.column == arg_77_0.column
			end) or _.any(var_76_2, function(arg_79_0)
				return arg_79_0.row == arg_77_0.row and arg_79_0.column == arg_77_0.column
			end)) and var_76_0[arg_77_0.row][arg_77_0.column] then
				if arg_76_0:ExistAny(arg_77_0.row, arg_77_0.column) then
					table.insert(var_76_1, arg_77_0)
				else
					return arg_77_0
				end
			end
		end)
	end
end

function var_0_0.WriteBack(arg_80_0, arg_80_1, arg_80_2)
	local var_80_0 = arg_80_0:GetFleet()
	local var_80_1 = {}

	for iter_80_0, iter_80_1 in ipairs(var_80_0:GetShips(true)) do
		table.insert(var_80_1, iter_80_1)
	end

	if arg_80_2.statistics.submarineAid then
		local var_80_2 = arg_80_0:GetSubmarineFleet()

		assert(var_80_2, "submarine fleet not exist.")

		local var_80_3 = var_80_2:GetTeamShips(TeamType.Submarine, true)

		for iter_80_2, iter_80_3 in ipairs(var_80_3) do
			table.insert(var_80_1, iter_80_3)
		end

		var_80_2:UseAmmo()
		var_80_2:AddDefeatEnemies(arg_80_1)
	end

	var_80_0:AddDefeatEnemies(arg_80_1)
	_.each(var_80_1, function(arg_81_0)
		local var_81_0 = arg_80_2.statistics[arg_81_0.id]

		if var_81_0 then
			arg_81_0.hpRant = var_81_0.bp
		end

		if arg_81_0.hpRant <= 0 then
			arg_81_0:Rebirth()
		end
	end)

	local var_80_4 = arg_80_0:GetCell(var_80_0.row, var_80_0.column):GetStageEnemy()

	assert(var_80_4)

	if arg_80_1 then
		var_80_4:UpdateFlag(1)

		arg_80_0.phaseDisplayList = table.mergeArray(arg_80_0.phaseDisplayList, var_80_4:SetHP(0))

		local var_80_5 = false

		_.each(arg_80_0:GetFleets(), function(arg_82_0)
			var_80_5 = var_80_5 or arg_82_0:HasDamageLevel()

			arg_82_0:ClearDamageLevel()
		end)

		if var_80_5 then
			table.insert(arg_80_0.phaseDisplayList, 1, {
				story = "W1500",
				hp = var_80_4:GetMaxHP()
			})
		end
	else
		arg_80_0.isLoss = true

		var_80_0:IncDamageLevel(var_80_4)
		var_80_4:UpdateData(var_80_4.data - 1)

		arg_80_0.phaseDisplayList = table.mergeArray(arg_80_0.phaseDisplayList, var_80_4:SetHP(arg_80_2.statistics._maxBossHP))

		local var_80_6 = nowWorld()

		if var_80_6.isAutoFight then
			var_80_6:TriggerAutoFight(false)
			pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_tip_bigworld_dead"))
		end
	end

	_.each(arg_80_2.hpDropInfo, function(arg_83_0)
		local var_83_0 = #arg_80_0.phaseDisplayList + 1

		for iter_83_0, iter_83_1 in ipairs(arg_80_0.phaseDisplayList) do
			if iter_83_1.hp < arg_83_0.hp then
				var_83_0 = iter_83_0

				break
			end
		end

		arg_80_0:AddPhaseDisplay({
			hp = arg_83_0.hp,
			drops = PlayerConst.addTranDrop(arg_83_0.drop_info)
		}, var_83_0)
	end)
end

function var_0_0.AddPhaseDisplay(arg_84_0, arg_84_1, arg_84_2)
	if arg_84_2 then
		table.insert(arg_84_0.phaseDisplayList, arg_84_2, arg_84_1)
	else
		table.insert(arg_84_0.phaseDisplayList, arg_84_1)
	end
end

function var_0_0.FindAttachments(arg_85_0, arg_85_1, arg_85_2)
	local var_85_0 = {}

	for iter_85_0, iter_85_1 in pairs(arg_85_0.typeAttachments) do
		if not arg_85_1 or arg_85_1 == iter_85_0 then
			for iter_85_2, iter_85_3 in ipairs(iter_85_1) do
				if not arg_85_2 or iter_85_3.id == arg_85_2 then
					table.insert(var_85_0, iter_85_3)
				end
			end
		end
	end

	return var_85_0
end

function var_0_0.FindEnemys(arg_86_0)
	local var_86_0 = {}

	for iter_86_0, iter_86_1 in pairs(arg_86_0.typeAttachments) do
		if WorldMapAttachment.IsEnemyType(iter_86_0) then
			var_86_0 = table.mergeArray(var_86_0, iter_86_1)
		end
	end

	return var_86_0
end

function var_0_0.GetMapMinMax(arg_87_0)
	local var_87_0 = Vector2(WorldConst.MaxColumn, WorldConst.MaxRow)
	local var_87_1 = Vector2(-WorldConst.MaxColumn, -WorldConst.MaxRow)

	for iter_87_0 = 0, WorldConst.MaxRow - 1 do
		for iter_87_1 = 0, WorldConst.MaxColumn - 1 do
			if arg_87_0:GetCell(iter_87_0, iter_87_1) then
				var_87_0.x = math.min(var_87_0.x, iter_87_1)
				var_87_0.y = math.min(var_87_0.y, iter_87_0)
				var_87_1.x = math.max(var_87_1.x, iter_87_1)
				var_87_1.y = math.max(var_87_1.y, iter_87_0)
			end
		end
	end

	return var_87_0.y, var_87_1.y, var_87_0.x, var_87_1.x
end

function var_0_0.GetMapSize(arg_88_0)
	local var_88_0, var_88_1, var_88_2, var_88_3 = arg_88_0:GetMapMinMax()

	return var_88_1 - var_88_0 + 1, var_88_3 - var_88_2 + 1
end

function var_0_0.CountEventEffectKeys(arg_89_0, arg_89_1)
	local var_89_0 = 0

	for iter_89_0, iter_89_1 in ipairs(arg_89_0:GetNormalFleets()) do
		local var_89_1 = arg_89_0:GetCell(iter_89_1.row, iter_89_1.column):GetAliveAttachment()

		if var_89_1 and var_89_1.type == WorldMapAttachment.TypeEvent and var_89_1:GetEventEffect() == arg_89_1 then
			var_89_0 = var_89_0 + 1
		end
	end

	return var_89_0
end

function var_0_0.EventEffectOpenFOV(arg_90_0, arg_90_1)
	assert(arg_90_1.effect_type == WorldMapAttachment.EffectEventFOV)

	local var_90_0, var_90_1 = unpack(arg_90_1.effect_paramater)
	local var_90_2 = var_90_1 >= 0

	var_90_1 = var_90_2 and var_90_1 or math.abs(var_90_1) - 1

	local var_90_3 = arg_90_0:FindAttachments(WorldMapAttachment.TypeEvent, var_90_0)

	_.each(var_90_3, function(arg_91_0)
		arg_90_0.centerCellFOV = {
			row = arg_91_0.row,
			column = arg_91_0.column
		}

		for iter_91_0 = math.max(arg_91_0.row - var_90_1, 0), math.min(arg_91_0.row + var_90_1, WorldConst.MaxRow - 1) do
			for iter_91_1 = math.max(arg_91_0.column - var_90_1, 0), math.min(arg_91_0.column + var_90_1, WorldConst.MaxColumn - 1) do
				if WorldConst.InFOVRange(arg_91_0.row, arg_91_0.column, iter_91_0, iter_91_1, var_90_1) then
					local var_91_0 = arg_90_0:GetCell(iter_91_0, iter_91_1)

					if var_91_0 then
						if var_90_2 then
							var_91_0:UpdateInFov(bit.bor(var_91_0.infov, WorldConst.FOVEventEffect))
						else
							var_91_0:UpdateInFov(bit.band(var_91_0.infov, WorldConst.Flag16Max - WorldConst.FOVEventEffect))
						end
					end
				end
			end
		end
	end)
end

function var_0_0.OrderAROpenFOV(arg_92_0, arg_92_1)
	if arg_92_1 then
		local var_92_0 = arg_92_0:GetFleet()

		arg_92_0.centerCellFOV = {
			row = var_92_0.row,
			column = var_92_0.column
		}
	end

	for iter_92_0, iter_92_1 in pairs(arg_92_0.cells) do
		if arg_92_1 then
			iter_92_1:UpdateInFov(bit.bor(iter_92_1.infov, WorldConst.FOVEventEffect))
		else
			iter_92_1:UpdateInFov(bit.band(iter_92_1.infov, WorldConst.Flag16Max - WorldConst.FOVEventEffect))
		end
	end
end

function var_0_0.GetMaxDistanceCell(arg_93_0, arg_93_1, arg_93_2)
	local var_93_0
	local var_93_1 = 0
	local var_93_2 = {
		{
			row = arg_93_0.top,
			column = arg_93_0.left
		},
		{
			row = arg_93_0.bottom,
			column = arg_93_0.left
		},
		{
			row = arg_93_0.top,
			column = arg_93_0.right
		},
		{
			row = arg_93_0.bottom,
			column = arg_93_0.right
		}
	}

	for iter_93_0, iter_93_1 in pairs(var_93_2) do
		local var_93_3 = (iter_93_1.row - arg_93_1) * (iter_93_1.row - arg_93_1) + (iter_93_1.column - arg_93_2) * (iter_93_1.column - arg_93_2)

		if var_93_1 < var_93_3 then
			var_93_0 = iter_93_1
			var_93_1 = var_93_3
		end
	end

	return var_93_0, math.sqrt(var_93_1)
end

function var_0_0.GetCellsInFOV(arg_94_0)
	local var_94_0 = {}

	for iter_94_0, iter_94_1 in pairs(arg_94_0.cells) do
		if iter_94_1:GetInFOV() then
			table.insert(var_94_0, iter_94_1)
		end
	end

	return var_94_0
end

function var_0_0.AlwaysInFOV(arg_95_0)
	return arg_95_0.config.map_sight == 1
end

function var_0_0.GetEventTipWord(arg_96_0)
	local var_96_0 = arg_96_0:FindAttachments(WorldMapAttachment.TypeEvent)
	local var_96_1 = ""
	local var_96_2 = 0

	for iter_96_0, iter_96_1 in ipairs(var_96_0) do
		local var_96_3 = pg.world_event_desc[iter_96_1.id]

		if iter_96_1:IsAlive() and var_96_3 and var_96_2 < var_96_3.hint_pri then
			var_96_2 = var_96_3.hint_pri
			var_96_1 = var_96_3.hint
		end
	end

	return var_96_1, var_96_2
end

function var_0_0.GetEventPoisonRate(arg_97_0)
	local var_97_0 = arg_97_0:FindAttachments(WorldMapAttachment.TypeEvent)
	local var_97_1 = 0

	for iter_97_0, iter_97_1 in ipairs(var_97_0) do
		if iter_97_1:IsAlive() then
			var_97_1 = var_97_1 + iter_97_1.config.infection_value
		end
	end

	return var_97_1, arg_97_0.config.is_sairen
end

function var_0_0.GetPressingLevel(arg_98_0)
	return arg_98_0.config.complete_effect
end

function var_0_0.CheckMapPressing(arg_99_0)
	return arg_99_0:GetPressingLevel() > 0 and not arg_99_0.isPressing and arg_99_0:GetEventPoisonRate() == 0
end

function var_0_0.CheckMapPressingDisplay(arg_100_0)
	return arg_100_0:GetPressingLevel() > 1
end

function var_0_0.UpdateClearFlag(arg_101_0, arg_101_1)
	arg_101_0.clearFlag = tobool(arg_101_1)
end

function var_0_0.IsUnlockFleetMode(arg_102_0)
	if arg_102_0.config.move_switch == 1 then
		return true
	elseif arg_102_0.config.move_switch == 0 then
		return false
	else
		assert(false, "config error")
	end
end

function var_0_0.CheckFleetSalvage(arg_103_0, arg_103_1)
	local var_103_0 = underscore.detect(arg_103_0:GetFleets(), function(arg_104_0)
		return arg_104_0:IsCatSalvage() and (arg_103_1 or arg_104_0:IsSalvageFinish() or arg_103_0.salvageAutoResult or arg_104_0.catSalvageFrom ~= arg_103_0.id)
	end)

	if var_103_0 then
		return var_103_0.id
	else
		arg_103_0.salvageAutoResult = false
	end
end

function var_0_0.GetChapterAuraBuffs(arg_105_0)
	local var_105_0 = {}

	for iter_105_0, iter_105_1 in ipairs(arg_105_0.fleets) do
		local var_105_1 = iter_105_1:getMapAura()

		for iter_105_2, iter_105_3 in ipairs(var_105_1) do
			table.insert(var_105_0, iter_105_3)
		end
	end

	return var_105_0
end

function var_0_0.GetChapterAidBuffs(arg_106_0)
	local var_106_0 = {}

	for iter_106_0, iter_106_1 in ipairs(arg_106_0.fleets) do
		if iter_106_0 ~= arg_106_0.findex then
			local var_106_1 = iter_106_1:getMapAid()

			for iter_106_2, iter_106_3 in pairs(var_106_1) do
				var_106_0[iter_106_2] = iter_106_3
			end
		end
	end

	return var_106_0
end

function var_0_0.getFleetBattleBuffs(arg_107_0, arg_107_1, arg_107_2)
	local var_107_0 = {}

	underscore.each(arg_107_1:GetBuffList(), function(arg_108_0)
		local var_108_0 = arg_108_0.config.lua_id

		if var_108_0 ~= 0 then
			table.insert(var_107_0, var_108_0)
		end
	end)

	local var_107_1 = {}

	if arg_107_2 and arg_107_1:IsCatSalvage() then
		-- block empty
	else
		var_107_1 = arg_107_0:BuildBattleBuffList(arg_107_1)
	end

	return var_107_0, var_107_1
end

function var_0_0.BuildBattleBuffList(arg_109_0, arg_109_1)
	local var_109_0 = {}
	local var_109_1, var_109_2 = arg_109_0:triggerSkill(arg_109_1, FleetSkill.TypeBattleBuff)

	if var_109_1 and #var_109_1 > 0 then
		local var_109_3 = {}

		for iter_109_0, iter_109_1 in ipairs(var_109_1) do
			local var_109_4 = var_109_2[iter_109_0]
			local var_109_5 = arg_109_1:findCommanderBySkillId(var_109_4.id)

			var_109_3[var_109_5] = var_109_3[var_109_5] or {}

			table.insert(var_109_3[var_109_5], iter_109_1)
		end

		for iter_109_2, iter_109_3 in pairs(var_109_3) do
			table.insert(var_109_0, {
				iter_109_2,
				iter_109_3
			})
		end
	end

	local var_109_6 = arg_109_1:getCommanders()

	for iter_109_4, iter_109_5 in pairs(var_109_6) do
		local var_109_7 = iter_109_5:getTalents()

		for iter_109_6, iter_109_7 in ipairs(var_109_7) do
			local var_109_8 = iter_109_7:getBuffsAddition()

			if #var_109_8 > 0 then
				local var_109_9

				for iter_109_8, iter_109_9 in ipairs(var_109_0) do
					if iter_109_9[1] == iter_109_5 then
						var_109_9 = iter_109_9[2]

						break
					end
				end

				if not var_109_9 then
					var_109_9 = {}

					table.insert(var_109_0, {
						iter_109_5,
						var_109_9
					})
				end

				for iter_109_10, iter_109_11 in ipairs(var_109_8) do
					table.insert(var_109_9, iter_109_11)
				end
			end
		end
	end

	return var_109_0
end

function var_0_0.CanLongMove(arg_110_0, arg_110_1)
	return arg_110_0:IsUnlockFleetMode() and not arg_110_1:HasTrapBuff() and arg_110_0:GetFleetTerrain(arg_110_1) ~= WorldMapCell.TerrainFog
end

function var_0_0.triggerSkill(arg_111_0, arg_111_1, arg_111_2)
	local var_111_0 = _.filter(arg_111_1:findSkills(arg_111_2), function(arg_112_0)
		local var_112_0 = arg_112_0:GetTriggers()

		return _.any(var_112_0, function(arg_113_0)
			return arg_113_0[1] == FleetSkill.TriggerInSubTeam and arg_113_0[2] == 1
		end) == (arg_111_1:GetFleetType() == FleetType.Submarine) and _.all(arg_112_0:GetTriggers(), function(arg_114_0)
			return arg_111_0:triggerCheck(arg_111_1, arg_112_0, arg_114_0)
		end)
	end)

	return _.reduce(var_111_0, nil, function(arg_115_0, arg_115_1)
		local var_115_0 = arg_115_1:GetType()
		local var_115_1 = arg_115_1:GetArgs()

		if var_115_0 == FleetSkill.TypeMoveSpeed or var_115_0 == FleetSkill.TypeHuntingLv or var_115_0 == FleetSkill.TypeTorpedoPowerUp then
			return (arg_115_0 or 0) + var_115_1[1]
		elseif var_115_0 == FleetSkill.TypeAmbushDodge or var_115_0 == FleetSkill.TypeAirStrikeDodge then
			return math.max(arg_115_0 or 0, var_115_1[1])
		elseif var_115_0 == FleetSkill.TypeAttack or var_115_0 == FleetSkill.TypeStrategy then
			arg_115_0 = arg_115_0 or {}

			table.insert(arg_115_0, var_115_1)

			return arg_115_0
		elseif var_115_0 == FleetSkill.TypeBattleBuff then
			arg_115_0 = arg_115_0 or {}

			table.insert(arg_115_0, var_115_1[1])

			return arg_115_0
		end
	end), var_111_0
end

function var_0_0.triggerCheck(arg_116_0, arg_116_1, arg_116_2, arg_116_3)
	local var_116_0 = arg_116_3[1]

	if var_116_0 == FleetSkill.TriggerDDHead then
		local var_116_1 = arg_116_1:GetTeamShipVOs(TeamType.Vanguard, false)

		return #var_116_1 > 0 and ShipType.IsTypeQuZhu(var_116_1[1]:getShipType())
	elseif var_116_0 == FleetSkill.TriggerVanCount then
		local var_116_2 = arg_116_1:GetTeamShipVOs(TeamType.Vanguard, false)

		return #var_116_2 >= arg_116_3[2] and #var_116_2 <= arg_116_3[3]
	elseif var_116_0 == FleetSkill.TriggerShipCount then
		local var_116_3 = _.filter(arg_116_1:GetShipVOs(false), function(arg_117_0)
			return table.contains(arg_116_3[2], arg_117_0:getShipType())
		end)

		return #var_116_3 >= arg_116_3[3] and #var_116_3 <= arg_116_3[4]
	elseif var_116_0 == FleetSkill.TriggerAroundEnemy then
		local var_116_4 = {
			row = arg_116_1.row,
			column = arg_116_1.column
		}
		local var_116_5 = {}
		local var_116_6 = arg_116_3[2]

		for iter_116_0 = -var_116_6, var_116_6 do
			local var_116_7 = var_116_6 - math.abs(iter_116_0)

			for iter_116_1 = -var_116_7, var_116_7 do
				local var_116_8 = arg_116_0:GetCell(var_116_4.row + iter_116_0, var_116_4.column + iter_116_1)

				table.insert(var_116_5, var_116_8)
			end
		end

		return underscore.any(var_116_5, function(arg_118_0)
			local var_118_0 = arg_118_0:ExistEnemy() and arg_118_0:GetStageEnemy().config.type or nil

			return type(arg_116_3[3]) == "number" and arg_116_3[3] == var_118_0 or type(arg_116_3[3]) == "table" and table.contains(arg_116_3[3], var_118_0)
		end)
	elseif var_116_0 == FleetSkill.TriggerNekoPos then
		local var_116_9 = arg_116_1:findCommanderBySkillId(arg_116_2.id)

		for iter_116_2, iter_116_3 in pairs(arg_116_1:getCommanders()) do
			if var_116_9.id == iter_116_3.id and iter_116_2 == arg_116_3[2] then
				return true
			end
		end
	elseif var_116_0 == FleetSkill.TriggerAroundLand then
		local var_116_10 = {
			row = arg_116_1.row,
			column = arg_116_1.column
		}
		local var_116_11 = arg_116_3[2]

		for iter_116_4 = -var_116_11, var_116_11 do
			local var_116_12 = var_116_11 - math.abs(iter_116_4)

			for iter_116_5 = -var_116_12, var_116_12 do
				local var_116_13 = var_116_10.row + iter_116_4
				local var_116_14 = var_116_10.column + iter_116_5

				if arg_116_0:GetCell(var_116_13, var_116_14) and not arg_116_0:IsWalkable(var_116_13, var_116_14) then
					return true
				end
			end
		end

		return false
	elseif var_116_0 == FleetSkill.TriggerAroundCombatAlly then
		local var_116_15 = {
			row = arg_116_1.row,
			column = arg_116_1.column
		}

		return _.any(arg_116_0.fleets, function(arg_119_0)
			return arg_116_1.id ~= arg_119_0.id and arg_119_0:GetFleetType() == FleetType.Normal and arg_116_0:GetCell(arg_119_0.line.row, arg_119_0.line.column):ExistEnemy() and ManhattonDist(var_116_15, {
				row = arg_119_0.line.row,
				column = arg_119_0.line.column
			}) <= arg_116_3[2]
		end)
	elseif var_116_0 == FleetSkill.TriggerInSubTeam then
		return true
	else
		assert(false, "invalid trigger type: " .. var_116_0)
	end
end

function var_0_0.OnUpdateAttachmentExist(arg_120_0, arg_120_1, arg_120_2, arg_120_3)
	local var_120_0 = arg_120_3.type

	arg_120_0.typeAttachments[var_120_0] = arg_120_0.typeAttachments[var_120_0] or {}

	if arg_120_1 == WorldMapCell.EventAddAttachment then
		table.insert(arg_120_0.typeAttachments[var_120_0], arg_120_3)
	elseif arg_120_1 == WorldMapCell.EventRemoveAttachment then
		table.removebyvalue(arg_120_0.typeAttachments[var_120_0], arg_120_3)
	end

	local var_120_1 = arg_120_3:GetVisionRadius()

	if var_120_1 > 0 then
		local var_120_2 = 0

		if arg_120_1 == WorldMapCell.EventAddAttachment then
			var_120_2 = var_120_2 + 1
		elseif arg_120_1 == WorldMapCell.EventRemoveAttachment then
			var_120_2 = var_120_2 - 1
		else
			assert(false, "listener event error: " .. arg_120_1)
		end

		arg_120_0.centerCellFOV = {
			row = arg_120_2.row,
			column = arg_120_2.column
		}

		for iter_120_0 = arg_120_2.row - var_120_1, arg_120_2.row + var_120_1 do
			for iter_120_1 = arg_120_2.column - var_120_1, arg_120_2.column + var_120_1 do
				local var_120_3 = arg_120_0:GetCell(iter_120_0, iter_120_1)

				if var_120_3 and WorldConst.InFOVRange(arg_120_2.row, arg_120_2.column, var_120_3.row, var_120_3.column, var_120_1) then
					var_120_3:ChangeInLight(var_120_2 > 0)
				end
			end
		end
	end

	local var_120_4 = arg_120_3:GetRadiationBuffs()

	if #var_120_4 > 0 then
		local var_120_5 = {}

		for iter_120_2, iter_120_3 in ipairs(var_120_4) do
			local var_120_6, var_120_7, var_120_8 = unpack(iter_120_3)

			if arg_120_1 == WorldMapCell.EventAddAttachment then
				var_120_5[var_120_6] = true

				arg_120_0:AddBuff(var_120_6, var_120_7, var_120_8)
			elseif arg_120_1 == WorldMapCell.EventRemoveAttachment then
				var_120_5[var_120_6] = true

				arg_120_0:RemoveBuff(var_120_6, var_120_7, var_120_8)
			end
		end

		for iter_120_4, iter_120_5 in pairs(var_120_5) do
			if iter_120_5 then
				arg_120_0:FlushFaction(iter_120_4)
			end
		end
	end
end

function var_0_0.GetBGM(arg_121_0)
	return arg_121_0.config.bgm
end

function var_0_0.NeedClear(arg_122_0)
	local var_122_0, var_122_1 = arg_122_0:GetEventPoisonRate()

	return var_122_1 > 0 and var_122_0 == 0 or arg_122_0.clearFlag or arg_122_0.config.is_clear > 0
end

function var_0_0.GetBuff(arg_123_0, arg_123_1, arg_123_2)
	if not arg_123_0.factionBuffs[arg_123_1][arg_123_2] then
		arg_123_0.factionBuffs[arg_123_1][arg_123_2] = WorldBuff.New()

		arg_123_0.factionBuffs[arg_123_1][arg_123_2]:Setup({
			floor = 0,
			id = arg_123_2
		})
	end

	return arg_123_0.factionBuffs[arg_123_1][arg_123_2]
end

function var_0_0.AddBuff(arg_124_0, arg_124_1, arg_124_2, arg_124_3)
	arg_124_0:GetBuff(arg_124_1, arg_124_2):AddFloor(arg_124_3)
end

function var_0_0.RemoveBuff(arg_125_0, arg_125_1, arg_125_2, arg_125_3)
	local var_125_0 = arg_125_0:GetBuff(arg_125_1, arg_125_2)

	if arg_125_3 then
		var_125_0:AddFloor(arg_125_3 * -1)
	else
		arg_125_0.factionBuffs[arg_125_1][arg_125_2] = nil
	end
end

function var_0_0.GetBuffList(arg_126_0, arg_126_1, arg_126_2)
	if arg_126_1 == var_0_0.FactionSelf then
		return underscore.filter(underscore.values(arg_126_0.factionBuffs[arg_126_1]), function(arg_127_0)
			return arg_127_0:GetFloor() > 0
		end)
	elseif arg_126_1 == var_0_0.FactionEnemy then
		if WorldMapAttachment.IsEnemyType(arg_126_2.type) or arg_126_2.type == WorldMapAttachment.TypeEvent and arg_126_2:GetSpEventType() == WorldMapAttachment.SpEventEnemy then
			return underscore.filter(underscore.values(arg_126_0.factionBuffs[arg_126_1]), function(arg_128_0)
				return arg_128_0:GetFloor() > 0
			end)
		else
			return {}
		end
	else
		assert(false, string.format("faction error: $d", arg_126_1))
	end
end

function var_0_0.FlushFaction(arg_129_0, arg_129_1)
	if arg_129_1 == var_0_0.FactionSelf then
		underscore.each(arg_129_0:GetFleets(), function(arg_130_0)
			arg_130_0:DispatchEvent(WorldMapFleet.EventUpdateBuff)
		end)
	elseif arg_129_1 == var_0_0.FactionEnemy then
		local var_129_0 = {}

		underscore.each(arg_129_0:FindEnemys(), function(arg_131_0)
			var_129_0[WorldMapCell.GetName(arg_131_0.row, arg_131_0.column)] = true
		end)
		underscore.each(arg_129_0:FindAttachments(WorldMapAttachment.TypeEvent), function(arg_132_0)
			if arg_132_0:GetSpEventType() == WorldMapAttachment.SpEventEnemy then
				var_129_0[WorldMapCell.GetName(arg_132_0.row, arg_132_0.column)] = true
			end
		end)

		for iter_129_0 in pairs(var_129_0) do
			arg_129_0.cells[iter_129_0]:DispatchEvent(var_0_0.EventUpdateMapBuff)
		end
	else
		assert(false, string.format("faction error: $d", arg_129_1))
	end
end

function var_0_0.GetBattleLuaBuffs(arg_133_0, arg_133_1, arg_133_2)
	local var_133_0 = {}

	underscore.each(arg_133_0:GetBuffList(arg_133_1, arg_133_2), function(arg_134_0)
		if arg_134_0.config.lua_id > 0 then
			table.insert(var_133_0, arg_134_0.config.lua_id)
		end
	end)

	return var_133_0
end

function var_0_0.UpdateFleetLocation(arg_135_0, arg_135_1, arg_135_2, arg_135_3)
	local var_135_0 = arg_135_0:GetFleet(arg_135_1)

	assert(var_135_0, "without this fleet : " .. arg_135_1)

	if var_135_0.row ~= arg_135_2 or var_135_0.column ~= arg_135_3 then
		arg_135_0:CheckFleetUpdateFOV(var_135_0, function()
			var_135_0.row = arg_135_2
			var_135_0.column = arg_135_3
		end)
		var_135_0:DispatchEvent(WorldMapFleet.EventUpdateLocation)
	end
end

function var_0_0.GetRangeDic(arg_137_0, arg_137_1)
	local var_137_0 = {}

	WorldConst.RangeCheck(arg_137_1, arg_137_0:GetFOVRange(arg_137_1), function(arg_138_0, arg_138_1)
		local var_138_0 = WorldMapCell.GetName(arg_138_0, arg_138_1)

		if arg_137_0.cells[var_138_0] then
			var_137_0[var_138_0] = defaultValue(var_137_0[var_138_0], 0) + 1
		end
	end)

	return var_137_0
end

function var_0_0.CheckFleetUpdateFOV(arg_139_0, arg_139_1, arg_139_2)
	if not arg_139_0:IsValid() then
		arg_139_2()

		return
	end

	local var_139_0 = arg_139_0:GetRangeDic(arg_139_1)
	local var_139_1 = arg_139_0:GetFleetTerrain(arg_139_1) == WorldMapCell.TerrainFog
	local var_139_2 = arg_139_0:IsFleetTerrainSairenFog(arg_139_1)
	local var_139_3 = arg_139_0:CalcFleetSpeed(arg_139_1)

	arg_139_2()

	local var_139_4 = arg_139_0:GetRangeDic(arg_139_1)
	local var_139_5 = arg_139_0:GetFleetTerrain(arg_139_1) == WorldMapCell.TerrainFog
	local var_139_6 = arg_139_0:IsFleetTerrainSairenFog(arg_139_1)
	local var_139_7 = arg_139_0:CalcFleetSpeed(arg_139_1)

	arg_139_0.centerCellFOV = {
		row = arg_139_1.row,
		column = arg_139_1.column
	}

	local var_139_8 = false
	local var_139_9 = false
	local var_139_10 = {}

	if not var_139_1 then
		for iter_139_0, iter_139_1 in pairs(var_139_0) do
			var_139_10[iter_139_0] = defaultValue(var_139_10[iter_139_0], 0) - iter_139_1
		end
	end

	if not var_139_5 then
		for iter_139_2, iter_139_3 in pairs(var_139_4) do
			var_139_10[iter_139_2] = defaultValue(var_139_10[iter_139_2], 0) + iter_139_3
		end
	end

	for iter_139_4, iter_139_5 in pairs(var_139_10) do
		if iter_139_5 ~= 0 then
			arg_139_0.cells[iter_139_4]:ChangeInLight(iter_139_5 > 0)

			var_139_8 = true
		end
	end

	if arg_139_0:GetFleet() == arg_139_1 then
		local var_139_11 = {}

		if var_139_1 then
			for iter_139_6, iter_139_7 in pairs(var_139_0) do
				var_139_11[iter_139_6] = defaultValue(var_139_11[iter_139_6], 0) - iter_139_7
			end
		end

		if var_139_5 then
			for iter_139_8, iter_139_9 in pairs(var_139_4) do
				var_139_11[iter_139_8] = defaultValue(var_139_11[iter_139_8], 0) + iter_139_9
			end
		end

		if var_139_1 ~= var_139_5 or var_139_2 ~= var_139_6 then
			for iter_139_10, iter_139_11 in pairs(arg_139_0.cells) do
				local var_139_12

				if var_139_11[iter_139_10] and var_139_11[iter_139_10] ~= 0 then
					var_139_12 = var_139_11[iter_139_10] > 0
				end

				iter_139_11:UpdateFog(var_139_5, var_139_12, var_139_6)
			end

			var_139_8 = true
		else
			for iter_139_12, iter_139_13 in pairs(var_139_11) do
				if iter_139_13 ~= 0 then
					arg_139_0.cells[iter_139_12]:UpdateFog(nil, iter_139_13 > 0, nil)

					var_139_8 = true
				end
			end
		end

		if var_139_3 ~= var_139_7 then
			var_139_9 = true
		end
	end

	if var_139_8 then
		arg_139_0:DispatchEvent(var_0_0.EventUpdateFleetFOV)
	end

	if var_139_9 then
		arg_139_0:DispatchEvent(var_0_0.EventUpdateMoveSpeed)
	end
end

function var_0_0.CheckSelectFleetUpdateFog(arg_140_0, arg_140_1)
	if not arg_140_0:IsValid() then
		arg_140_1()

		return
	end

	local var_140_0 = arg_140_0:GetFleet()
	local var_140_1 = arg_140_0:GetRangeDic(var_140_0)
	local var_140_2 = arg_140_0:GetFleetTerrain(var_140_0) == WorldMapCell.TerrainFog
	local var_140_3 = arg_140_0:IsFleetTerrainSairenFog(var_140_0)

	arg_140_1()

	local var_140_4 = arg_140_0:GetFleet()
	local var_140_5 = arg_140_0:GetRangeDic(var_140_4)
	local var_140_6 = arg_140_0:GetFleetTerrain(var_140_4) == WorldMapCell.TerrainFog
	local var_140_7 = arg_140_0:IsFleetTerrainSairenFog(var_140_4)

	arg_140_0.centerCellFOV = {
		row = var_140_4.row,
		column = var_140_4.column
	}

	local var_140_8 = {}

	if var_140_2 then
		for iter_140_0, iter_140_1 in pairs(var_140_1) do
			var_140_8[iter_140_0] = defaultValue(var_140_8[iter_140_0], 0) - iter_140_1
		end
	end

	if var_140_6 then
		for iter_140_2, iter_140_3 in pairs(var_140_5) do
			var_140_8[iter_140_2] = defaultValue(var_140_8[iter_140_2], 0) + iter_140_3
		end
	end

	if var_140_2 ~= var_140_6 or var_140_3 ~= var_140_7 then
		for iter_140_4, iter_140_5 in pairs(arg_140_0.cells) do
			local var_140_9

			if var_140_8[iter_140_4] and var_140_8[iter_140_4] ~= 0 then
				var_140_9 = var_140_8[iter_140_4] > 0
			end

			iter_140_5:UpdateFog(var_140_6, var_140_9, var_140_7)
		end
	else
		for iter_140_6, iter_140_7 in pairs(var_140_8) do
			if iter_140_7 ~= 0 then
				arg_140_0.cells[iter_140_6]:UpdateFog(nil, iter_140_7 > 0, nil)
			end
		end
	end

	arg_140_0:DispatchEvent(var_0_0.EventUpdateFleetFOV)
end

function var_0_0.CheckEventAutoTrigger(arg_141_0, arg_141_1)
	if arg_141_1:GetSpEventType() == WorldMapAttachment.SpEventConsumeItem then
		return getProxy(SettingsProxy):GetWorldFlag("consume_item")
	end

	local var_141_0 = arg_141_1:GetEventEffect()

	if var_141_0 then
		local var_141_1 = arg_141_0:GetFleet()
		local var_141_2 = var_141_0.effect_type

		if var_141_2 == WorldMapAttachment.EffectEventConsumeCarry then
			local var_141_3 = var_141_0.effect_paramater[1] or {}

			return not underscore.any(var_141_3, function(arg_142_0)
				return not var_141_1:ExistCarry(arg_142_0)
			end)
		elseif var_141_2 == WorldMapAttachment.EffectEventCatSalvage then
			return var_141_1:GetDisplayCommander() and not var_141_1:IsCatSalvage()
		end
	end

	return true
end

function var_0_0.CanAutoFight(arg_143_0)
	if arg_143_0.config.is_auto > 0 then
		for iter_143_0 = 1, arg_143_0.config.is_auto do
			if not nowWorld():IsSystemOpen(WorldConst["SystemAutoFight_" .. iter_143_0]) then
				return false
			end
		end

		return true
	else
		return false
	end
end

function var_0_0.CkeckTransport(arg_144_0)
	assert(arg_144_0:IsValid(), "without map info")

	if arg_144_0.config.is_transfer == 0 then
		return false, i18n("world_transport_disable")
	end

	if arg_144_0:CheckAttachmentTransport() == "block" then
		return false, i18n("world_movelimit_event_text")
	end

	if nowWorld():CheckTaskLockMap() then
		return false, i18n("world_task_maplock")
	end

	return true
end

return var_0_0
