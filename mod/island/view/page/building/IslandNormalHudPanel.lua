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

	arg_3_0.playerTF = arg_3_0:GetPlayer().transform
	arg_3_0.isNear = arg_3_0:CheckIsNear()

	setActive(arg_3_0.hudTitle, arg_3_0.isNear)
	setActive(arg_3_0.hudName, arg_3_0.isNear)
	arg_3_0:UpdateTaskDisplay()
end

function var_0_0.OnDispose(arg_4_0)
	var_0_0.super.OnDispose(arg_4_0)
end

function var_0_0.GetPlayer(arg_5_0)
	local var_5_0 = GameObject.Find("Root"):GetComponentsInChildren(typeof("WorldObjectItem")):ToTable()

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		if iter_5_1.isPlayer then
			return iter_5_1.gameObject
		end
	end

	return nil
end

function var_0_0.CheckIsNear(arg_6_0)
	local var_6_0 = arg_6_0.view:GetUnitModuleWithType(arg_6_0.unitType, arg_6_0.unitId)
	local var_6_1 = var_6_0 and var_6_0._go or nil

	if not var_6_0 or IsNil(var_6_1) then
		return false
	end

	if (arg_6_0.playerTF.position - var_6_1.transform.position).magnitude < arg_6_0.hud_name_range then
		return true
	end

	return false
end

function var_0_0.OnUpdate(arg_7_0)
	local var_7_0 = arg_7_0:CheckIsNear()

	if var_7_0 == arg_7_0.isNear then
		return
	end

	arg_7_0.isNear = var_7_0

	setActive(arg_7_0.hudTitle, arg_7_0.isNear)
	setActive(arg_7_0.hudName, arg_7_0.isNear)
end

function var_0_0.RefreshHud(arg_8_0)
	arg_8_0:UpdateTaskDisplay()
end

function var_0_0.UpdateTaskDisplay(arg_9_0)
	local var_9_0, var_9_1 = IslandObjectTaskHudHelper.GetObjectTaskHud(arg_9_0.unitId)

	if arg_9_0.currentTaskId ~= var_9_1 then
		arg_9_0.currentTaskId = var_9_1

		if var_9_1 then
			local var_9_2, var_9_3 = IslandObjectTaskHudHelper.GetHudDislayInfoByTaskId(var_9_1)

			setActive(arg_9_0.hudImageBg, true)
			GetImageSpriteFromAtlasAsync("island/IslandHudIcon", var_9_2, arg_9_0.hudImageBg)
			setImageColor(arg_9_0.hudImageTF, Color.NewHex(var_9_3))
		else
			setActive(arg_9_0.hudImageBg, arg_9_0.hudImageIcon ~= "")
			GetImageSpriteFromAtlasAsync("island/IslandHudIcon", "hud_main", arg_9_0.hudImageBg)
			setImageColor(arg_9_0.hudImageTF, Color.NewHex("78787a"))
		end
	end

	if var_9_0 ~= arg_9_0.currentTaskType then
		arg_9_0.currentTaskType = var_9_0

		local var_9_4 = IslandObjectTaskHudHelper.TaskProcessToHudIcon[var_9_0] or arg_9_0.hudImageIcon

		setActive(arg_9_0.hudImageBg, var_9_4 ~= "")

		if var_9_4 ~= "" then
			GetImageSpriteFromAtlasAsync("island/IslandHudIcon", var_9_4, arg_9_0.hudImageTF)
		end
	end
end

return var_0_0
