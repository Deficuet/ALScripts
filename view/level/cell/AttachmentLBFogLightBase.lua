local var_0_0 = class("AttachmentLBFogLightBase", import("view.level.cell.StaticCellView"))

var_0_0.StateLive = 1
var_0_0.StateDead = 2

function var_0_0.GetOrder(arg_1_0)
	return ChapterConst.CellPriorityAttachment
end

function var_0_0.Update(arg_2_0)
	local var_2_0 = arg_2_0.info

	if IsNil(arg_2_0.go) then
		arg_2_0:PrepareBase("landbase_" .. var_2_0.attachmentId)
	end

	local var_2_1 = arg_2_0.state

	if var_2_0.flag == ChapterConst.CellFlagActive and arg_2_0.state ~= var_0_0.StateLive then
		arg_2_0.state = var_0_0.StateLive
		arg_2_0.dead = nil

		arg_2_0:ClearLoader()

		local var_2_2 = pg.land_based_template[var_2_0.attachmentId]

		assert(var_2_2, "land_based_template not exist: " .. var_2_0.attachmentId)
		arg_2_0:GetLoader():GetPrefab("chapter/" .. var_2_2.prefab, "", function(arg_3_0)
			setParent(arg_3_0, arg_2_0.tf)

			arg_2_0.enemy = arg_3_0

			arg_2_0:ResetCanvasOrder()
			arg_2_0:Update()
		end)
	elseif var_2_0.flag == ChapterConst.CellFlagDisabled and arg_2_0.state ~= var_0_0.StateDead then
		arg_2_0.state = var_0_0.StateDead
		arg_2_0.enemy = nil

		arg_2_0:ClearLoader()

		local var_2_3 = pg.land_based_template[var_2_0.attachmentId]

		assert(var_2_3, "land_based_template not exist: " .. var_2_0.attachmentId)
		arg_2_0:GetLoader():GetPrefab("chapter/" .. var_2_3.prefab .. "_d_blue", "", function(arg_4_0)
			setParent(arg_4_0, arg_2_0.tf)

			arg_2_0.dead = arg_4_0

			arg_2_0:ResetCanvasOrder()
			arg_2_0:Update()
		end)
	end
end

return var_0_0
