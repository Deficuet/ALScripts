local var_0_0 = class("AgoraTheme", import(".AgoraBaseTheme"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
	arg_1_0:Flush(arg_1_1, arg_1_2)
end

function var_0_0.Flush(arg_2_0, arg_2_1, arg_2_2)
	for iter_2_0, iter_2_1 in ipairs(arg_2_1:GetPlacedList()) do
		local var_2_0 = arg_2_2[iter_2_1.id]

		if var_2_0 then
			local var_2_1 = Clone(var_2_0)

			var_2_1:FlushDataFromPlacementData(iter_2_1)
			table.insert(arg_2_0.placedlist, var_2_1)
		end
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_1:GetFloorLayer()) do
		local var_2_2 = AgoraLayerCell.New(iter_2_3.position)

		var_2_2:Fill(iter_2_3.id, iter_2_3.shapeId)
		table.insert(arg_2_0.floorData, var_2_2)
	end

	for iter_2_4, iter_2_5 in ipairs(arg_2_1:GetTileLayer()) do
		local var_2_3 = AgoraLayerCell.New(iter_2_5.position)

		var_2_3:Fill(iter_2_5.id, iter_2_5.shapeId)
		table.insert(arg_2_0.tileData, var_2_3)
	end
end

return var_0_0
