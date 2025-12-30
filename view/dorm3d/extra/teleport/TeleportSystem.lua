local var_0_0 = class("TeleportSystem", import("view.dorm3d.Extra.BaseExtraSystem"))

var_0_0.MAX_DISTANCE = 1.5

function var_0_0.OnInit(arg_1_0)
	local var_1_0 = arg_1_0:GetRoom().id

	warning("TeleportSystem Init for room:", var_1_0)

	arg_1_0.configs = pg.dorm3d_teleport.get_id_list_by_room_id[var_1_0] or {}

	arg_1_0:BindClickFunc()
end

function var_0_0.BindClickFunc(arg_2_0)
	_.each(arg_2_0.configs, function(arg_3_0)
		local var_3_0 = pg.dorm3d_teleport[arg_3_0]

		warning(var_3_0)

		local var_3_1 = arg_2_0:GetSceneItem(var_3_0.item_path)

		if not var_3_1 then
			return
		end

		local var_3_2 = pg.dorm3d_zone_template[var_3_0.teleport_zone] and pg.dorm3d_zone_template[var_3_0.teleport_zone].watch_camera

		assert(var_3_2, "invalid zone:" .. tostring(var_3_0.teleport_zone))
		GetOrAddComponent(var_3_1, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_4_0, arg_4_1)
			if arg_2_0:Get("isInFurnitureSelect") then
				return
			end

			local var_4_0 = arg_4_1.position
			local var_4_1 = CameraMgr.instance:Raycast(arg_2_0:Get("sceneRaycaster"), var_4_0):ToTable()

			if #var_4_1 > 0 then
				if var_4_1[1].gameObject.transform ~= var_3_1.transform then
					return
				end

				local var_4_2 = arg_2_0:Get("player")

				if Vector3.Distance(var_4_2.transform.position, var_3_1.transform.position) > var_0_0.MAX_DISTANCE then
					return
				end

				arg_2_0:Emit(Dorm3dRoomTemplateScene.SHIFT_ZONE_SAFE, var_3_2)
			end
		end)
	end)
end

function var_0_0.RegisterEvents(arg_5_0)
	return
end

function var_0_0.OnHandleNotification(arg_6_0, arg_6_1, arg_6_2)
	return
end

function var_0_0.GetInterests()
	return {}
end

function var_0_0.OnDispose(arg_8_0)
	return
end

return var_0_0
