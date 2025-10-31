local var_0_0 = class("IslandGrassLandSystem", import("Mod.Island.Core.View.SceneObject.IslandSceneUnit"))

function var_0_0.OnLaterAttach(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0._go.transform.position
	local var_1_1 = arg_1_0.data:GetSize()

	BLHX.Rendering.TerrainDetailTileMask.Instance:Init(var_1_0.x, var_1_0.z, var_1_1.x, var_1_1.y, 1)
end

function var_0_0.SetVisible(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_1:IsBuildingType() then
		return
	end

	local var_2_0 = arg_2_1:GetPosition()
	local var_2_1 = arg_2_1:GetSizeWithRotation()
	local var_2_2 = arg_2_0.data:MapPoint2GroundPoint(var_2_0)

	BLHX.Rendering.TerrainDetailTileMask.Instance:SetVisible(var_2_2.x, var_2_2.y, var_2_1.x, var_2_1.y, arg_2_2)
end

function var_0_0.OnDetach(arg_3_0)
	BLHX.Rendering.TerrainDetailTileMask.Instance:Dispose()
end

return var_0_0
