local var_0_0 = class("IslandGroundSystemVO", import(".IslandSystemVO"))

function var_0_0.GetBehaviourTree(arg_1_0)
	return nil
end

function var_0_0.GetType(arg_2_0)
	return IslandConst.SYSTEM_TYPE_GROUND
end

function var_0_0.GetAssetPath(arg_3_0)
	return "ui/FloorTileRenderer"
end

function var_0_0.GetSize(arg_4_0)
	local var_4_0 = IslandConst.AGORA_LEVEL_2_SIZE[#IslandConst.AGORA_LEVEL_2_SIZE]

	return Vector2(var_4_0, var_4_0)
end

function var_0_0.GetMapLeftBottomPoint(arg_5_0)
	local var_5_0 = arg_5_0:GetSize()
	local var_5_1 = AgoraCalc.GetSizeCoord(var_5_0)

	return Vector2(var_5_1.x, var_5_1.w)
end

function var_0_0.GetPosition(arg_6_0)
	local var_6_0 = arg_6_0:GetMapLeftBottomPoint()

	return AgoraCalc.MapPosition2WorldPosition(var_6_0) + IslandConst.AGORA_POSITION_OFFSET + IslandConst.AGORA_GROUND_OFFSET
end

function var_0_0.MapPoint2GroundPoint(arg_7_0, arg_7_1)
	return arg_7_1 - arg_7_0:GetMapLeftBottomPoint()
end

return var_0_0
