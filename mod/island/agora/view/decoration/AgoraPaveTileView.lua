local var_0_0 = class("AgoraPaveTileView", import("Mod.Island.Core.View.IslandBaseSubView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandAgoraPaveTileUI"
end

function var_0_0.FirstFlush(arg_2_0)
	arg_2_0.nameTxt = arg_2_0:findTF("name"):GetComponent(typeof(Text))
	arg_2_0.icon = arg_2_0:findTF("icon"):GetComponent(typeof(Image))
	arg_2_0.exitBtn = arg_2_0:findTF("exit")
	arg_2_0.rotation = arg_2_0:findTF("revert")
	arg_2_0.confirmBtn = arg_2_0:findTF("confirm")
	arg_2_0.mode = arg_2_0:findTF("mode")

	setText(arg_2_0:findTF("desc"), i18n("island_agora_pave_tip"))
	arg_2_0:RegisterEvent()
end

function var_0_0.RegisterEvent(arg_3_0)
	onButton(arg_3_0, arg_3_0.exitBtn, function()
		arg_3_0:Op("RevertPaveLayer")
		arg_3_0:GetView():ExitPaveTileMode()
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.mode, function(arg_5_0)
		arg_3_0:Op("ChangePaveMode", arg_5_0)
	end, true)
	onButton(arg_3_0, arg_3_0.rotation, function()
		if arg_3_0.shapeId == IslandConst.AGORA_TILE_SHAPE_ALL then
			return
		end

		arg_3_0.shapeId = arg_3_0.shapeId + 1

		if arg_3_0.shapeId > arg_3_0.maxShapeId then
			arg_3_0.shapeId = arg_3_0.minShapeId
		end

		arg_3_0:Op("ChangeSelectedShape", arg_3_0.shapeId)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		arg_3_0:GetView():ExitPaveTileMode()
	end, SFX_PANEL)
end

function var_0_0.Flush(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.shapeId = arg_8_2
	arg_8_0.minShapeId = arg_8_2
	arg_8_0.maxShapeId = arg_8_0.shapeId + 3
	arg_8_0.nameTxt.text = arg_8_1:GetName()

	LoadSpriteAsync("island/IslandFurnitureIcon/" .. arg_8_1:GetIcon(), function(arg_9_0)
		arg_8_0.icon.sprite = arg_9_0
	end)
	triggerToggle(arg_8_0.mode, false)
end

function var_0_0.OnDestroy(arg_10_0)
	return
end

return var_0_0
