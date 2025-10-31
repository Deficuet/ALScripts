ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = class("BattleAOEData")

var_0_0.Battle.BattleAOEData = var_0_2
var_0_2.__name = "BattleAOEData"
var_0_2.ALIGNMENT_LEFT = "left"
var_0_2.ALIGNMENT_RIGHT = "right"
var_0_2.ALIGNMENT_MIDDLE = "middle"

function var_0_2.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0._areaUniqueID = arg_1_1
	arg_1_0._areaCldFunc = arg_1_3
	arg_1_0._endFunc = arg_1_4
	arg_1_0._IFF = arg_1_2
	arg_1_0._cldObjList = {}
	arg_1_0._cldObjDistanceList = {}

	arg_1_0:SetTickness(10)

	arg_1_0._alignment = Vector3.zero
	arg_1_0._angle = 0
	arg_1_0._component = {}
	arg_1_0._timeExemptKey = "aoe_" .. arg_1_0._areaUniqueID
end

function var_0_2.StartTimer(arg_2_0)
	if arg_2_0._lifeTime == -1 then
		arg_2_0._flag = false

		return
	end

	arg_2_0._flag = true

	if arg_2_0._lifeTime > 0 then
		arg_2_0._lifeTimer = pg.TimeMgr.GetInstance():AddBattleTimer("areaTimer", 0, arg_2_0._lifeTime, function()
			arg_2_0:RemoveTimer()
		end, true)
	end
end

function var_0_2.GetTimeRationExemptKey(arg_4_0)
	return arg_4_0._timeExemptKey
end

function var_0_2.RemoveTimer(arg_5_0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_5_0._lifeTimer)

	arg_5_0._lifeTimer = nil
	arg_5_0._flag = false
end

function var_0_2.ClearCLDList(arg_6_0)
	arg_6_0._cldObjList = {}
end

function var_0_2.AppendCldObj(arg_7_0, arg_7_1)
	arg_7_0._cldObjList[#arg_7_0._cldObjList + 1] = arg_7_1
end

function var_0_2.Settle(arg_8_0)
	arg_8_0.SortCldObjList(arg_8_0._cldObjList)
	arg_8_0._cldComponent:GetCldData().func(arg_8_0._cldObjList)
end

function var_0_2.SettleFinale(arg_9_0)
	if arg_9_0._endFunc then
		arg_9_0.SortCldObjList(arg_9_0._cldObjList)
		arg_9_0._endFunc(arg_9_0._cldObjList)
	end
end

function var_0_2.ForceExit(arg_10_0)
	return
end

function var_0_2.SortCldObjList(arg_11_0)
	table.sort(arg_11_0, var_0_2._Fun_SortCldObjList)
end

function var_0_2._Fun_SortCldObjList(arg_12_0, arg_12_1)
	if arg_12_0.IsBoss ~= arg_12_1.IsBoss then
		if arg_12_1.IsBoss then
			return true
		else
			return false
		end
	else
		return arg_12_0.UID < arg_12_1.UID
	end
end

function var_0_2.SetOpponentAffected(arg_13_0, arg_13_1)
	arg_13_0._opponentAffected = arg_13_1
end

function var_0_2.OpponentAffected(arg_14_0)
	return arg_14_0._opponentAffected
end

function var_0_2.SetIndiscriminate(arg_15_0, arg_15_1)
	arg_15_0._indicriminate = arg_15_1
end

function var_0_2.GetIndiscriminate(arg_16_0)
	return arg_16_0._indicriminate
end

function var_0_2.GetActiveFlag(arg_17_0)
	return arg_17_0._flag
end

function var_0_2.SetActiveFlag(arg_18_0, arg_18_1)
	arg_18_0._flag = arg_18_1
end

function var_0_2.Dispose(arg_19_0)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0._component) do
		iter_19_1:Dispose()
	end

	arg_19_0._component = nil

	arg_19_0:RemoveTimer()

	arg_19_0._cldObjList = nil
end

function var_0_2.GetUniqueID(arg_20_0)
	return arg_20_0._areaUniqueID
end

function var_0_2.GetIFF(arg_21_0)
	return arg_21_0._IFF
end

function var_0_2.GetAreaType(arg_22_0)
	return arg_22_0._areaType
end

function var_0_2.GetPosition(arg_23_0)
	return arg_23_0._pos
end

function var_0_2.GetTickness(arg_24_0)
	return arg_24_0._tickness
end

function var_0_2.GetLifeTime(arg_25_0)
	return arg_25_0._lifeTime
end

function var_0_2.GetFieldType(arg_26_0)
	return arg_26_0._fieldType
end

function var_0_2.GetDiveFilter(arg_27_0)
	return arg_27_0._diveFilter
end

function var_0_2.GetCldFunc(arg_28_0)
	return arg_28_0._areaCldFunc
end

function var_0_2.GetHeight(arg_29_0)
	return arg_29_0._height
end

function var_0_2.GetWidth(arg_30_0)
	return arg_30_0._width
end

function var_0_2.GetAngle(arg_31_0)
	return arg_31_0._angle
end

function var_0_2.GetRange(arg_32_0)
	return arg_32_0._range
end

function var_0_2.GetSectorAngle(arg_33_0)
	return arg_33_0._sectorAngle
end

function var_0_2.SetAreaType(arg_34_0, arg_34_1)
	arg_34_0._areaType = arg_34_1

	arg_34_0:InitCldComponent()
end

function var_0_2.SetDiveFilter(arg_35_0, arg_35_1)
	arg_35_0._diveFilter = arg_35_1
end

function var_0_2.SetPosition(arg_36_0, arg_36_1)
	arg_36_0._pos = arg_36_1
end

function var_0_2.SetTickness(arg_37_0, arg_37_1)
	arg_37_0._tickness = arg_37_1
end

function var_0_2.SetFieldType(arg_38_0, arg_38_1)
	arg_38_0._fieldType = arg_38_1
end

function var_0_2.SetLifeTime(arg_39_0, arg_39_1)
	arg_39_0._lifeTime = arg_39_1
end

function var_0_2.SetHeight(arg_40_0, arg_40_1)
	arg_40_0._height = arg_40_1
end

function var_0_2.SetWidth(arg_41_0, arg_41_1)
	arg_41_0._width = arg_41_1
end

function var_0_2.SetAngle(arg_42_0, arg_42_1)
	arg_42_0._angle = arg_42_1
end

function var_0_2.SetRange(arg_43_0, arg_43_1)
	arg_43_0._range = arg_43_1
end

function var_0_2.SetSectorAngle(arg_44_0, arg_44_1, arg_44_2)
	arg_44_0._sectorAngle = arg_44_1
	arg_44_0._sectorDir = arg_44_2

	local var_44_0 = arg_44_0._sectorAngle / 2

	arg_44_0._upperEdge = math.deg2Rad * var_44_0
	arg_44_0._lowerEdge = -1 * arg_44_0._upperEdge

	local var_44_1 = 0

	if arg_44_2 == var_0_1.UnitDir.LEFT then
		arg_44_0._normalizeOffset = math.pi - var_44_1
	elseif arg_44_2 == var_0_1.UnitDir.RIGHT then
		arg_44_0._normalizeOffset = var_44_1
	end

	arg_44_0._wholeCircle = math.pi - arg_44_0._normalizeOffset
	arg_44_0._negativeCircle = -math.pi - arg_44_0._normalizeOffset
	arg_44_0._wholeCircleNormalizeOffset = arg_44_0._normalizeOffset - math.pi * 2
	arg_44_0._negativeCircleNormalizeOffset = arg_44_0._normalizeOffset + math.pi * 2
end

function var_0_2.SetAnchorPointAlignment(arg_45_0, arg_45_1)
	if arg_45_1 == var_0_2.ALIGNMENT_LEFT then
		arg_45_0._alignment = Vector3(arg_45_0._width * 0.5, 0, 0)
	elseif arg_45_1 == var_0_2.ALIGNMENT_RIGHT then
		arg_45_0._alignment = Vector3(arg_45_0._width * -0.5, 0, 0)
	end
end

function var_0_2.GetAnchorPointAlignment(arg_46_0)
	return arg_46_0._alignment
end

function var_0_2.GetFXStatic(arg_47_0)
	return arg_47_0._fxStatic
end

function var_0_2.SetFXStatic(arg_48_0, arg_48_1)
	arg_48_0._fxStatic = arg_48_1
end

function var_0_2.AppendComponent(arg_49_0, arg_49_1)
	table.insert(arg_49_0._component, arg_49_1)
end

function var_0_2.InitCldComponent(arg_50_0)
	if arg_50_0._areaType == var_0_1.AreaType.CUBE or arg_50_0._areaType == var_0_1.AreaType.ELLIPSE then
		arg_50_0._cldComponent = var_0_0.Battle.BattleCubeCldComponent.New(arg_50_0._width, arg_50_0._tickness, arg_50_0._height, 0, 0)
	elseif arg_50_0._areaType == var_0_1.AreaType.COLUMN then
		arg_50_0._cldComponent = var_0_0.Battle.BattleColumnCldComponent.New(arg_50_0._range, arg_50_0._tickness)
	end

	local var_50_0 = {
		type = var_0_1.CldType.AOE,
		UID = arg_50_0:GetUniqueID(),
		IFF = arg_50_0:GetIFF(),
		func = arg_50_0:GetCldFunc()
	}

	arg_50_0._cldComponent:SetCldData(var_50_0)
	arg_50_0._cldComponent:SetActive(true)
end

function var_0_2.GetCldComponent(arg_51_0)
	return arg_51_0._cldComponent
end

function var_0_2.DeactiveCldBox(arg_52_0)
	arg_52_0._cldComponent:SetActive(false)
end

function var_0_2.GetCldBox(arg_53_0)
	return arg_53_0._cldComponent:GetCldBox(arg_53_0:GetPosition() + arg_53_0._alignment)
end

function var_0_2.GetCldData(arg_54_0)
	return arg_54_0._cldComponent:GetCldData()
end

function var_0_2.UpdateDistanceInfo(arg_55_0)
	for iter_55_0, iter_55_1 in ipairs(arg_55_0._cldObjList) do
		local var_55_0
		local var_55_1 = iter_55_1.LeftBound
		local var_55_2 = iter_55_1.RightBound
		local var_55_3 = iter_55_1.UpperBound
		local var_55_4 = iter_55_1.LowerBound
		local var_55_5 = arg_55_0._pos.x
		local var_55_6
		local var_55_7

		if var_55_1 <= var_55_5 and var_55_5 <= var_55_2 then
			var_55_6 = true
		elseif var_55_5 < var_55_1 then
			var_55_7 = var_55_1
		elseif var_55_2 < var_55_5 then
			var_55_7 = var_55_2
		end

		local var_55_8 = arg_55_0._pos.z
		local var_55_9
		local var_55_10

		if var_55_4 <= var_55_8 and var_55_8 <= var_55_3 then
			var_55_9 = true
		elseif var_55_8 < var_55_4 then
			var_55_10 = var_55_4
		elseif var_55_3 < var_55_8 then
			var_55_10 = var_55_3
		end

		if var_55_6 and var_55_9 then
			var_55_0 = 0
		elseif var_55_6 then
			var_55_0 = math.abs(var_55_10 - var_55_8)
		elseif var_55_9 then
			var_55_0 = math.abs(var_55_7 - var_55_5)
		else
			var_55_0 = math.sqrt((var_55_7 - var_55_5)^2 + (var_55_10 - var_55_8)^2)
		end

		arg_55_0._cldObjDistanceList[iter_55_1.UID] = var_55_0
	end
end

function var_0_2.GetDistance(arg_56_0, arg_56_1)
	return arg_56_0._cldObjDistanceList[arg_56_1]
end

function var_0_2.IsOutOfAngle(arg_57_0, arg_57_1)
	if not arg_57_0._sectorAngle or arg_57_0._sectorAngle >= 360 then
		return false
	else
		local var_57_0 = arg_57_1:GetPosition()
		local var_57_1 = math.atan2(var_57_0.z - arg_57_0._pos.z, var_57_0.x - arg_57_0._pos.x)

		if var_57_1 > arg_57_0._wholeCircle then
			var_57_1 = var_57_1 + arg_57_0._wholeCircleNormalizeOffset
		elseif var_57_1 < arg_57_0._negativeCircle then
			var_57_1 = var_57_1 + arg_57_0._negativeCircleNormalizeOffset
		else
			var_57_1 = var_57_1 + arg_57_0._normalizeOffset
		end

		if var_57_1 > arg_57_0._lowerEdge and var_57_1 < arg_57_0._upperEdge then
			return false
		else
			return true
		end
	end
end
