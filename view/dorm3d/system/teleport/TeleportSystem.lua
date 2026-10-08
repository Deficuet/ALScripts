local var_0_0 = class("TeleportSystem", import("view.dorm3d.Core.BaseSystem"))

var_0_0.MAX_DISTANCE = 1.5

function var_0_0.OnInit(arg_1_0)
	local var_1_0 = arg_1_0:GetRoom().id

	warning("TeleportSystem Init for room:", var_1_0)

	arg_1_0.configs = pg.dorm3d_teleport.get_id_list_by_room_id[var_1_0] or {}
	arg_1_0.boundTriggers = {}

	arg_1_0:BindClickFunc()
end

function var_0_0.BindClickFunc(arg_2_0)
	arg_2_0:ClearClickBindings()
	_.each(arg_2_0.configs, function(arg_3_0)
		local var_3_0 = pg.dorm3d_teleport[arg_3_0]

		warning(var_3_0)

		local var_3_1 = arg_2_0:GetSceneItem(var_3_0.item_path)

		if not var_3_1 then
			return
		end

		local var_3_2 = pg.dorm3d_zone_template[var_3_0.teleport_zone] and pg.dorm3d_zone_template[var_3_0.teleport_zone].watch_camera

		assert(var_3_2, "invalid zone:" .. tostring(var_3_0.teleport_zone))

		local var_3_3 = GetOrAddComponent(var_3_1, typeof(EventTriggerListener))

		var_3_3:AddPointClickFunc(function(arg_4_0, arg_4_1)
			if arg_2_0:GetIsInFurnitureSelect() then
				return
			end

			local var_4_0 = arg_4_1.position
			local var_4_1 = CameraMgr.instance:Raycast(arg_2_0:GetSceneRaycaster(), var_4_0):ToTable()

			if #var_4_1 > 0 then
				if var_4_1[1].gameObject.transform ~= var_3_1.transform then
					return
				end

				local var_4_2 = arg_2_0:GetPlayer()

				if Vector3.Distance(var_4_2.transform.position, var_3_1.transform.position) > var_0_0.MAX_DISTANCE then
					return
				end

				arg_2_0:Emit(Dorm3dRoomTemplateScene.SHIFT_ZONE_SAFE, var_3_2)
			end
		end)

		arg_2_0.boundTriggers[var_3_1] = var_3_3
	end)
end

function var_0_0.RegisterEvents(arg_5_0)
	arg_5_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_WILL_CHANGE, function()
		arg_5_0:ClearClickBindings()
	end)
	arg_5_0:Bind(Dorm3dRoomTemplateScene.ART_SCENE_CHANGED, function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_2 then
			arg_5_0:BindClickFunc()
		end
	end)
end

function var_0_0.OnHandleNotification(arg_8_0, arg_8_1, arg_8_2)
	return
end

function var_0_0.GetInterests()
	return {}
end

function var_0_0.OnDispose(arg_10_0)
	arg_10_0:ClearClickBindings()
end

function var_0_0.ClearClickBindings(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.boundTriggers or {}) do
		iter_11_1:RemovePointClickFunc()
	end

	arg_11_0.boundTriggers = {}
end

return var_0_0
