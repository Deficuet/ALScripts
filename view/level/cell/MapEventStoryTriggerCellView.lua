local var_0_0 = class("MapEventStoryTriggerCellView", import(".StaticCellView"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.chapter = nil
	arg_1_0.triggerUpper = nil
end

function var_0_0.GetOrder(arg_2_0)
	return ChapterConst.CellPriorityAttachment
end

function var_0_0.Update(arg_3_0)
	local var_3_0 = arg_3_0.info
	local var_3_1 = var_3_0.flag == ChapterConst.CellFlagTriggerActive and var_3_0.trait ~= ChapterConst.TraitLurk

	if IsNil(arg_3_0.go) then
		local var_3_2 = var_3_0.row
		local var_3_3 = var_3_0.column
		local var_3_4 = "story_" .. var_3_2 .. "_" .. var_3_3 .. "_" .. var_3_0.attachmentId

		arg_3_0:PrepareBase(var_3_4)

		local var_3_5 = pg.map_event_template[var_3_0.attachmentId].icon

		if IsNil(arg_3_0.triggerUpper) and var_3_5 and #var_3_5 > 0 and checkABExist("ui/" .. var_3_5 .. "_1shangceng") then
			arg_3_0.triggerUpper = HaloAttachmentView.New(arg_3_0.parent, var_3_2, var_3_3)

			arg_3_0.triggerUpper:SetLoader(arg_3_0.loader)
		end
	end

	local var_3_6 = pg.map_event_template[var_3_0.attachmentId].icon
	local var_3_7

	var_3_7 = var_3_6 and #var_3_6 > 0 and var_3_6 .. "_1" or nil

	local var_3_8 = ItemCell.TransformItemAsset(arg_3_0.chapter, var_3_7)

	if arg_3_0.assetName ~= var_3_8 then
		if var_3_8 == nil then
			arg_3_0:GetLoader():ClearRequest("ItemAsset")

			arg_3_0.assetName = var_3_8
		else
			arg_3_0:GetLoader():GetPrefab("ui/" .. var_3_8, var_3_8, function(arg_4_0)
				setParent(arg_4_0, arg_3_0.tf)
				arg_3_0:ResetCanvasOrder()

				arg_3_0.assetName = var_3_8
			end, "ItemAsset")
		end
	end

	setActive(arg_3_0.tf, var_3_1)

	if arg_3_0.triggerUpper then
		arg_3_0.triggerUpper.info = arg_3_0.info

		arg_3_0.triggerUpper:Update()
	end
end

function var_0_0.DestroyGO(arg_5_0)
	if arg_5_0.triggerUpper then
		arg_5_0.triggerUpper:Clear()
	end

	arg_5_0.triggerUpper = nil

	var_0_0.super.DestroyGO(arg_5_0)
end

return var_0_0
