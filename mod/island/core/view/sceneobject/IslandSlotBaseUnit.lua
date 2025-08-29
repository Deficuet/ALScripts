local var_0_0 = class("IslandSlotBaseUnit", import(".IslandSceneUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
end

function var_0_0.OnInit(arg_2_0, arg_2_1, arg_2_2)
	var_0_0.super.OnInit(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:LoadProductItem()
end

function var_0_0.LoadProductItem(arg_3_0)
	local var_3_0 = arg_3_0.data:GetProductModelId()

	if not var_3_0 then
		if arg_3_0.productItemGo then
			arg_3_0:UnLoadProductItemRes()
		end

		return
	end

	arg_3_0.productItemPath = pg.island_unit_item[var_3_0].model

	local function var_3_1(arg_4_0)
		setParent(arg_4_0, arg_3_0:GetView().root)

		arg_4_0.transform.position = arg_3_0.position
		arg_4_0.transform.eulerAngles = arg_3_0.rotation
		arg_3_0.productItemGo = arg_4_0
	end

	arg_3_0:LoadProductItemRes(var_3_1)
end

function var_0_0.ChangeModel(arg_5_0)
	if arg_5_0.data:ChangeModel() then
		if arg_5_0.productItemGo then
			arg_5_0:UnLoadProductItemRes()
		end

		arg_5_0:LoadProductItem()
	end
end

function var_0_0.OnUpdate(arg_6_0)
	arg_6_0:ChangeModel()
end

function var_0_0.OnDispose(arg_7_0)
	var_0_0.super.OnDispose(arg_7_0)

	if arg_7_0.productItemGo then
		arg_7_0:UnLoadProductItemRes()
	end
end

function var_0_0.GetHudInfo(arg_8_0)
	local var_8_0 = {}

	var_8_0.needShowHud = true

	return var_8_0
end

function var_0_0.LoadProductItemRes(arg_9_0, arg_9_1)
	arg_9_0:GetPoolMgr():GetSceneProductItem(arg_9_0.productItemPath, arg_9_1)
end

function var_0_0.UnLoadProductItemRes(arg_10_0)
	arg_10_0:GetPoolMgr():ReturnSceneProductItem(arg_10_0.productItemPath, arg_10_0.productItemGo)
end

function var_0_0.LoadEffectItemRes(arg_11_0, arg_11_1)
	arg_11_0:GetPoolMgr():GetSceneProductEffect(arg_11_0.effectPath, arg_11_1)
end

function var_0_0.UnLoadEffectItemRes(arg_12_0)
	arg_12_0:GetPoolMgr():ReturnSceneProductEffect(arg_12_0.effectPath, arg_12_0.effectGo)
end

function var_0_0.OnDetach(arg_13_0)
	arg_13_0:GetPoolMgr():ClearSceneProductItem()
	arg_13_0:GetPoolMgr():ClearSceneProductEffect()
end

return var_0_0
