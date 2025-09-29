local var_0_0 = class("IslandNormalHudPanel", import("Mod.Island.Core.View.IslandBaseHudPanel"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandNormalNpcHud"
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	var_0_0.super.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)

	arg_2_0.hud_name_range = pg.island_set.hud_name_range.key_value_int
	arg_2_0.currentTaskType = -1
	arg_2_0.currentTaskId = -1
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.npcId = tonumber(arg_3_0.param1)
	arg_3_0.hudImageTF = arg_3_0._tf:Find("hud_bg/hudImage")
	arg_3_0.hudImageBg = arg_3_0._tf:Find("hud_bg")

	local var_3_0 = pg.island_npc_hud[arg_3_0.npcId]

	arg_3_0.hudImageIcon = var_3_0.icon
	arg_3_0.hudTitle = arg_3_0._tf:Find("title")
	arg_3_0.hudName = arg_3_0._tf:Find("name")

	setText(arg_3_0.hudTitle, var_3_0.title)
	setText(arg_3_0.hudName, var_3_0.name)

	arg_3_0.playerTF = arg_3_0:GetPlayer()

	arg_3_0:CheckPlayer()
end

function var_0_0.CheckPlayer(arg_4_0)
	arg_4_0.isNear = arg_4_0:CheckIsNear()

	setActive(arg_4_0.hudTitle, arg_4_0.isNear)
	setActive(arg_4_0.hudName, arg_4_0.isNear)
	arg_4_0:UpdateTaskDisplay()
end

function var_0_0.OnDispose(arg_5_0)
	var_0_0.super.OnDispose(arg_5_0)
end

function var_0_0.GetPlayer(arg_6_0)
	local var_6_0 = GameObject.Find("Root"):GetComponentsInChildren(typeof(WorldObjectItem)):ToTable()

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		if iter_6_1.isPlayer then
			arg_6_0.hasPlayer = true

			return iter_6_1.gameObject.transform
		end
	end

	return nil
end

function var_0_0.CheckIsNear(arg_7_0)
	local var_7_0 = arg_7_0.view:GetUnitModuleWithType(arg_7_0.unitType, arg_7_0.unitId)
	local var_7_1 = var_7_0 and var_7_0._go or nil

	if not var_7_0 or IsNil(var_7_1) or IsNil(var_7_1.transform) then
		return false
	end

	if IsNil(arg_7_0.playerTF) then
		return false
	end

	if (arg_7_0.playerTF.position - var_7_1.transform.position).magnitude < arg_7_0.hud_name_range then
		return true
	end

	return false
end

function var_0_0.OnUpdate(arg_8_0)
	if not arg_8_0.hasPlayer then
		arg_8_0.playerTF = arg_8_0:GetPlayer()

		arg_8_0:CheckPlayer()
	else
		local var_8_0 = arg_8_0:CheckIsNear()

		if var_8_0 == arg_8_0.isNear then
			return
		end

		arg_8_0.isNear = var_8_0

		setActive(arg_8_0.hudTitle, arg_8_0.isNear)
		setActive(arg_8_0.hudName, arg_8_0.isNear)
	end
end

function var_0_0.RefreshHud(arg_9_0)
	arg_9_0:UpdateTaskDisplay()
end

function var_0_0.UpdateTaskDisplay(arg_10_0)
	local var_10_0, var_10_1 = IslandObjectTaskHudHelper.GetObjectTaskHud(arg_10_0.unitId)

	if arg_10_0.currentTaskId ~= var_10_1 then
		arg_10_0.currentTaskId = var_10_1

		if var_10_1 then
			local var_10_2, var_10_3 = IslandObjectTaskHudHelper.GetHudDislayInfoByTaskId(var_10_1)

			setActive(arg_10_0.hudImageBg, true)
			GetImageSpriteFromAtlasAsync("island/IslandHudIcon", var_10_2, arg_10_0.hudImageBg)
			setImageColor(arg_10_0.hudImageTF, Color.NewHex(var_10_3))
		else
			setActive(arg_10_0.hudImageBg, arg_10_0.hudImageIcon ~= "")
			GetImageSpriteFromAtlasAsync("island/IslandHudIcon", "hud_main", arg_10_0.hudImageBg)
			setImageColor(arg_10_0.hudImageTF, Color.NewHex("78787a"))
		end
	end

	if var_10_0 ~= arg_10_0.currentTaskType then
		arg_10_0.currentTaskType = var_10_0

		local var_10_4 = IslandObjectTaskHudHelper.TaskProcessToHudIcon[var_10_0] or arg_10_0.hudImageIcon

		setActive(arg_10_0.hudImageBg, var_10_4 ~= "")

		if var_10_4 ~= "" then
			GetImageSpriteFromAtlasAsync("island/IslandHudIcon", var_10_4, arg_10_0.hudImageTF)
		end
	end
end

return var_0_0
