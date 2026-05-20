ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleBuffEvent
local var_0_2 = var_0_0.Battle.BattleUnitEvent
local var_0_3 = var_0_0.Battle.BattleResourceManager
local var_0_4 = var_0_0.Battle.BattleDataFunction

var_0_0.Battle.BattleEffectComponent = class("BattleEffectComponent")

local var_0_5 = var_0_0.Battle.BattleEffectComponent

var_0_5.__name = "BattleEffectComponent"

function var_0_5.Ctor(arg_1_0, arg_1_1)
	var_0_0.EventListener.AttachEventListener(arg_1_0)

	arg_1_0._owner = arg_1_1
	arg_1_0._blinkIDList = {}
	arg_1_0._buffLastEffects = {}
	arg_1_0._currentLastFXID = nil
	arg_1_0._effectIndex = 0
	arg_1_0._effectList = {}
end

function var_0_5.SwitchOwner(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._owner = arg_2_1

	for iter_2_0, iter_2_1 in pairs(arg_2_0._blinkIDList) do
		if arg_2_2[iter_2_1] then
			arg_2_0._blinkIDList[iter_2_0] = arg_2_2[iter_2_1]
		end
	end
end

function var_0_5.ClearEffect(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(arg_3_0._blinkIDList) do
		arg_3_0._owner:RemoveBlink(iter_3_1)
	end

	arg_3_0._blinkIDList = {}
end

function var_0_5.Dispose(arg_4_0)
	for iter_4_0, iter_4_1 in pairs(arg_4_0._blinkIDList) do
		arg_4_0._owner:RemoveBlink(iter_4_1)
	end

	arg_4_0._effectList = nil
	arg_4_0._buffLastEffects = nil

	var_0_0.EventListener.DetachEventListener(arg_4_0)
end

function var_0_5.GetFXPool(arg_5_0)
	return var_0_0.Battle.BattleFXPool.GetInstance()
end

function var_0_5.SetUnitDataEvent(arg_6_0, arg_6_1)
	arg_6_1:RegisterEventListener(arg_6_0, var_0_1.BUFF_CAST, arg_6_0.onBuffCast)
	arg_6_1:RegisterEventListener(arg_6_0, var_0_1.BUFF_ATTACH, arg_6_0.onBuffAdd)
	arg_6_1:RegisterEventListener(arg_6_0, var_0_1.BUFF_STACK, arg_6_0.onBuffStack)
	arg_6_1:RegisterEventListener(arg_6_0, var_0_1.BUFF_REMOVE, arg_6_0.onBuffRemove)
	arg_6_1:RegisterEventListener(arg_6_0, var_0_2.ADD_EFFECT, arg_6_0.onAddEffect)
	arg_6_1:RegisterEventListener(arg_6_0, var_0_2.CANCEL_EFFECT, arg_6_0.onCancelEffect)
	arg_6_1:RegisterEventListener(arg_6_0, var_0_2.DEACTIVE_EFFECT, arg_6_0.onDeactiveEffect)
end

function var_0_5.RemoveUnitEvent(arg_7_0, arg_7_1)
	arg_7_1:UnregisterEventListener(arg_7_0, var_0_1.BUFF_ATTACH)
	arg_7_1:UnregisterEventListener(arg_7_0, var_0_1.BUFF_CAST)
	arg_7_1:UnregisterEventListener(arg_7_0, var_0_1.BUFF_STACK)
	arg_7_1:UnregisterEventListener(arg_7_0, var_0_1.BUFF_REMOVE)
	arg_7_1:UnregisterEventListener(arg_7_0, var_0_2.ADD_EFFECT)
	arg_7_1:UnregisterEventListener(arg_7_0, var_0_2.CANCEL_EFFECT)
	arg_7_1:UnregisterEventListener(arg_7_0, var_0_2.DEACTIVE_EFFECT)
end

function var_0_5.Update(arg_8_0, arg_8_1)
	arg_8_0._dir = arg_8_0._owner:GetUnitData():GetDirection()

	for iter_8_0, iter_8_1 in pairs(arg_8_0._effectList) do
		iter_8_1.currentTime = arg_8_1 - iter_8_1.startTime

		arg_8_0:updateEffect(iter_8_1)
	end
end

function var_0_5.onAddEffect(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.Data

	arg_9_0:addEffect(var_9_0)
end

function var_0_5.onCancelEffect(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.Data

	arg_10_0:cancelEffect(var_10_0)
end

function var_0_5.onDeactiveEffect(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.Data

	arg_11_0:deactiveEffect(var_11_0)
end

function var_0_5.onBuffAdd(arg_12_0, arg_12_1)
	arg_12_0:DoWhenAddBuff(arg_12_1)
end

function var_0_5.onBuffCast(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1.Data.buff_id

	arg_13_0:addBlink(var_13_0)
end

function var_0_5.DoWhenAddBuff(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.Data.buff_id
	local var_14_1 = arg_14_1.Data.buff_level

	arg_14_0:addInitFX(var_14_0)
	arg_14_0:addLastFX(var_14_0)
	arg_14_0:updateLastFXStackText(var_14_0)
end

function var_0_5.onBuffStack(arg_15_0, arg_15_1)
	arg_15_0:DoWhenStackBuff(arg_15_1)
end

function var_0_5.DoWhenStackBuff(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.Data.buff_id

	arg_16_0:addInitFX(var_16_0)

	local var_16_1 = arg_16_1.Data.stack_count
	local var_16_2 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(var_16_0)

	if var_16_2.last_effect_stack_list and arg_16_0:checkLastFXID(var_16_0, var_16_1) ~= arg_16_0._currentLastFXID then
		arg_16_0:switchLastFX(var_16_0, var_16_1)
	end

	if var_16_2.last_effect ~= "" and var_16_2.last_effect_stack then
		local var_16_3 = #arg_16_0._buffLastEffects[var_16_0]

		if var_16_3 < var_16_1 then
			arg_16_0:addLastFX(var_16_0)
		elseif var_16_1 < var_16_3 then
			local var_16_4 = var_16_3 - var_16_1

			while var_16_4 > 0 do
				arg_16_0:removeLastFX(var_16_0)

				var_16_4 = var_16_4 - 1
			end
		end
	end

	arg_16_0:updateLastFXStackText(var_16_0)
end

function var_0_5.onBuffRemove(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1.Data.buff_id

	if arg_17_0._buffLastEffects[var_17_0] then
		local var_17_1 = #arg_17_0._buffLastEffects[var_17_0]

		while var_17_1 > 0 do
			arg_17_0:removeLastFX(var_17_0)

			var_17_1 = var_17_1 - 1
		end
	end

	local var_17_2 = arg_17_0._blinkIDList[var_17_0]

	if var_17_2 then
		arg_17_0._owner:RemoveBlink(var_17_2)

		arg_17_0._blinkIDList[var_17_0] = nil
	end
end

function var_0_5.addInitFX(arg_18_0, arg_18_1)
	local var_18_0 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(arg_18_1)

	if var_18_0.init_effect and var_18_0.init_effect ~= "" then
		local var_18_1 = var_18_0.init_effect

		if var_18_0.skin_adapt then
			var_18_1 = var_0_4.SkinAdaptFXID(var_18_1, arg_18_0._owner:GetUnitData():GetSkinID())
		end

		arg_18_0._owner:AddFX(var_18_1)
	end
end

function var_0_5.removeLastFX(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0._buffLastEffects[arg_19_1]

	if var_19_0 ~= nil and #var_19_0 > 0 then
		local var_19_1 = table.remove(var_19_0)

		arg_19_0._owner:RemoveFX(var_19_1)
	end
end

function var_0_5.switchLastFX(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(arg_20_1)
	local var_20_1 = arg_20_0:checkLastFXID(arg_20_1, arg_20_2)

	if arg_20_0._currentLastFXID then
		arg_20_0:removeLastFX(arg_20_1)
	end

	if var_20_1 then
		local var_20_2 = arg_20_0:generateLastFX(var_20_0, var_20_1)
		local var_20_3 = arg_20_0._buffLastEffects[arg_20_1] or {}

		table.insert(var_20_3, var_20_2)

		arg_20_0._buffLastEffects[arg_20_1] = var_20_3
	end
end

function var_0_5.checkLastFXID(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(arg_21_1)
	local var_21_1

	for iter_21_0, iter_21_1 in pairs(var_21_0.last_effect_stack_list) do
		if iter_21_0 <= arg_21_2 then
			var_21_1 = iter_21_1
		end
	end

	return var_21_1
end

function var_0_5.addLastFX(arg_22_0, arg_22_1)
	local var_22_0 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(arg_22_1)

	if var_22_0.last_effect ~= nil and var_22_0.last_effect ~= "" then
		local var_22_1 = arg_22_0:generateLastFX(var_22_0, var_22_0.last_effect)
		local var_22_2 = arg_22_0._buffLastEffects[arg_22_1] or {}

		table.insert(var_22_2, var_22_1)

		arg_22_0._buffLastEffects[arg_22_1] = var_22_2
	end
end

function var_0_5.updateLastFXStackText(arg_23_0, arg_23_1)
	local var_23_0 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(arg_23_1).last_effect_stack_text

	if type(var_23_0) ~= "table" then
		return
	end

	local var_23_1 = var_23_0.node

	if type(var_23_1) ~= "string" or var_23_1 == "" then
		return
	end

	local var_23_2 = arg_23_0._owner:GetUnitData():GetBuff(arg_23_1)

	if not var_23_2 then
		return
	end

	local var_23_3 = var_23_2:GetStack() or 1
	local var_23_4 = "X" .. var_23_3
	local var_23_5 = arg_23_0._buffLastEffects[arg_23_1]

	if not var_23_5 then
		return
	end

	for iter_23_0, iter_23_1 in ipairs(var_23_5) do
		if iter_23_1 then
			local var_23_6 = iter_23_1.transform:Find(var_23_1)

			if var_23_6 then
				setText(var_23_6, var_23_4)
			end
		end
	end
end

function var_0_5.generateLastFX(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0._currentLastFXID = arg_24_2

	local var_24_0 = arg_24_0._owner:AddFX(arg_24_2)

	if arg_24_1.last_effect_cld_scale or arg_24_1.last_effect_cld_angle then
		local var_24_1
		local var_24_2 = arg_24_1[buffLv] or arg_24_1.effect_list

		for iter_24_0, iter_24_1 in ipairs(var_24_2) do
			if iter_24_1.arg_list.cld_data then
				var_24_1 = iter_24_1

				break
			end
		end

		if var_24_1 then
			if arg_24_1.last_effect_cld_scale then
				local var_24_3 = var_24_1.arg_list.cld_data.box
				local var_24_4 = var_24_0.transform.localScale

				if var_24_3.range then
					var_24_4.x = var_24_4.x * var_24_3.range
					var_24_4.y = var_24_4.y * var_24_3.range
					var_24_4.z = var_24_4.z * var_24_3.range
				else
					var_24_4.x = var_24_4.x * var_24_3[1]
					var_24_4.y = var_24_4.y * var_24_3[2]
					var_24_4.z = var_24_4.z * var_24_3[3]
				end

				var_24_0.transform.localScale = var_24_4
			end

			if arg_24_1.last_effect_cld_angle then
				local var_24_5 = var_24_1.arg_list.cld_data.angle
				local var_24_6 = var_24_0.transform:Find("scale/sector"):GetComponent(typeof(Renderer)).material
				local var_24_7 = (360 - var_24_5) * 0.5 - 5

				var_24_6:SetInt("_AngleControl", var_24_7)
			end

			if arg_24_1.last_effect_bound_bone then
				local var_24_8 = arg_24_0._owner:GetBoneList()[arg_24_1.last_effect_bound_bone]

				if var_24_8 then
					var_24_0.transform.localPosition = var_24_8[1]
				end
			end
		end
	end

	var_24_0:SetActive(true)

	return var_24_0
end

function var_0_5.addBlink(arg_25_0, arg_25_1)
	local var_25_0 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(arg_25_1)

	if var_25_0.blink then
		local var_25_1 = var_25_0.blink
		local var_25_2 = arg_25_0._owner:AddBlink(var_25_1[1], var_25_1[2], var_25_1[3], var_25_1[4], var_25_1[5])

		arg_25_0._blinkIDList[arg_25_1] = var_25_2
	end
end

function var_0_5.addEffect(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1.index or arg_26_0:getIndex()
	local var_26_1 = arg_26_0._effectList[var_26_0]

	if var_26_1 then
		local var_26_2 = var_26_1.effect_tf.localScale

		var_26_1.effect_go:SetActive(true)

		var_26_1.effect_tf.localScale = var_26_2
	else
		local var_26_3 = arg_26_0._owner:AddFX(arg_26_1.effect)

		if not var_26_3 then
			return
		end

		local var_26_4 = {
			currentTime = 0,
			effect_go = var_26_3,
			effect_tf = var_26_3.transform,
			posFun = arg_26_1.posFun,
			rotationFun = arg_26_1.rotationFun,
			startTime = pg.TimeMgr.GetInstance():GetCombatTime(),
			fillFunc = arg_26_1.fillFunc
		}

		arg_26_0._effectList[var_26_0] = var_26_4

		arg_26_0:updateEffect(var_26_4)
		pg.EffectMgr.GetInstance():PlayBattleEffect(var_26_3, var_26_3.transform.localPosition, false, function(arg_27_0)
			arg_26_0._owner:RemoveFX(var_26_3)

			arg_26_0._effectList[var_26_0] = nil
		end)
	end
end

function var_0_5.cancelEffect(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.index
	local var_28_1 = arg_28_0._effectList[var_28_0]

	if var_28_1 then
		arg_28_0._owner:RemoveFX(var_28_1.effect_go)

		arg_28_0._effectList[var_28_0] = nil
	end
end

function var_0_5.deactiveEffect(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1.index
	local var_29_1 = arg_29_0._effectList[var_29_0]

	if var_29_1 then
		var_29_1.effect_go:SetActive(false)
	end
end

function var_0_5.getIndex(arg_30_0)
	arg_30_0._effectIndex = arg_30_0._effectIndex + 1

	return arg_30_0._effectIndex
end

function var_0_5.updateEffect(arg_31_0, arg_31_1)
	if arg_31_1.posFun then
		local var_31_0 = arg_31_1.posFun(arg_31_1.currentTime)

		arg_31_1.effect_tf.localPosition = var_31_0
	end

	if arg_31_1.rotationFun then
		local var_31_1 = arg_31_1.rotationFun(arg_31_1.currentTime)

		if arg_31_0._dir == var_0_0.Battle.BattleConst.UnitDir.LEFT then
			var_31_1.y = var_31_1.y - 180
		end

		arg_31_1.effect_tf.localEulerAngles = var_31_1
	end

	if arg_31_1.fillFunc then
		arg_31_0._characterScaleX = arg_31_0._characterScaleX or arg_31_0._owner:GetTf().localScale.x
		arg_31_0._characterScaleZ = arg_31_0._characterScaleZ or arg_31_0._owner:GetTf().localScale.z

		local var_31_2, var_31_3, var_31_4 = arg_31_1.fillFunc()

		arg_31_1.effect_tf.position = var_31_2
		arg_31_1.effect_tf.localScale = Vector3(var_31_3 / arg_31_0._characterScaleX, 0, var_31_4 / arg_31_0._characterScaleZ)
	end
end
