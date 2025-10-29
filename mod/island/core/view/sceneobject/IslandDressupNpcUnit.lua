local var_0_0 = class("IslandDressupNpcUnit", import(".IslandNpcUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
end

function var_0_0.SetShipDressHelper(arg_2_0, arg_2_1)
	arg_2_0.shipDressHelper = arg_2_1
end

function var_0_0.OnDetach(arg_3_0)
	if arg_3_0.shipDressHelper then
		arg_3_0.shipDressHelper:Destroy()
	end
end

function var_0_0.OnCharacterChangeDress(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_1 then
		local var_4_0 = {}

		local function var_4_1()
			arg_4_0._animator = arg_4_0._tf:GetChild(0):GetComponent(typeof(Animator))

			for iter_5_0, iter_5_1 in ipairs(var_4_0) do
				arg_4_0._animator:Play(iter_5_1.shortNameHash, iter_5_0 - 1, iter_5_1.normalizedTime)
			end

			arg_4_0._tf:GetComponent(typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)):StartBehaviour()
		end

		arg_4_0._tf:GetComponent(typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)):PauseBehaviour()

		local var_4_2 = 0

		normalizedTime = arg_4_0._animator:GetCurrentAnimatorStateInfo(var_4_2).normalizedTime % 1

		for iter_4_0 = 1, arg_4_0._animator.layerCount do
			local var_4_3 = iter_4_0 - 1
			local var_4_4 = arg_4_0._animator:GetCurrentAnimatorStateInfo(var_4_3)

			table.insert(var_4_0, {
				shortNameHash = var_4_4.shortNameHash,
				normalizedTime = var_4_4.normalizedTime
			})
		end

		arg_4_0:DestroyInteractiveTools()

		arg_4_0._animator = nil

		if #arg_4_2 == 0 and #arg_4_3 == 0 then
			arg_4_0.shipDressHelper:ChangeModelTransfromByUnitId(arg_4_1, var_4_1)
		else
			arg_4_0.shipDressHelper:ChangeModelTransfromByUnitIdAndChangeDress(arg_4_1, arg_4_2, arg_4_3, var_4_1)
		end
	else
		for iter_4_1, iter_4_2 in ipairs(arg_4_2) do
			local var_4_5 = pg.island_dress_template[iter_4_2].type

			arg_4_0.shipDressHelper:ChangeDressByType(var_4_5, {
				id = 0,
				colorId = 0
			})
		end

		for iter_4_3, iter_4_4 in ipairs(arg_4_3) do
			local var_4_6 = pg.island_dress_template[iter_4_4].type

			arg_4_0.shipDressHelper:ChangeDressByType(var_4_6, {
				colorId = 0,
				id = iter_4_4
			})
		end
	end
end

return var_0_0
