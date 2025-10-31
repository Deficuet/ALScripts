local var_0_0 = class("Fushun3MonsterController")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0._tpl = arg_1_1
	arg_1_0._parent = arg_1_2
	arg_1_0._event = arg_1_4
	arg_1_0._sceneTf = arg_1_3
	arg_1_0.monsterDatas = {}

	for iter_1_0 = 1, #Fushun3GameConst.monster_data do
		table.insert(arg_1_0.monsterDatas, Clone(Fushun3GameConst.monster_data[iter_1_0]))
	end

	arg_1_0.monsters = {}
	arg_1_0.monsterPool = {}
end

function var_0_0.setDiff(arg_2_0, arg_2_1)
	return
end

function var_0_0.start(arg_3_0)
	arg_3_0:clearMonster()
end

function var_0_0.step(arg_4_0)
	for iter_4_0 = 1, #arg_4_0.monsters do
		if not arg_4_0.monsters[iter_4_0].damage then
			arg_4_0.monsters[iter_4_0].rect:step()
		end
	end

	arg_4_0:removeOutMonster()
end

function var_0_0.removeOutMonster(arg_5_0)
	for iter_5_0 = #arg_5_0.monsters, 1, -1 do
		if arg_5_0.monsters[iter_5_0].tf.anchoredPosition.x <= math.abs(arg_5_0._sceneTf.anchoredPosition.x) - 1920 then
			arg_5_0:returnMonsterToPool(table.remove(arg_5_0.monsters, iter_5_0))
		end
	end
end

function var_0_0.createMonster(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.monsterDatas[math.random(1, #arg_6_0.monsterDatas)]
	local var_6_1 = arg_6_0:getOrCreateMonster(var_6_0.id)

	if var_6_1 then
		var_6_1.damage = false

		setActive(var_6_1.tf, true)

		var_6_1.tf.position = arg_6_1
	end
end

function var_0_0.getOrCreateMonster(arg_7_0, arg_7_1)
	local var_7_0

	for iter_7_0 = 1, #arg_7_0.monsterPool do
		if arg_7_0.monsterPool[iter_7_0].data.id == arg_7_1 then
			var_7_0 = table.remove(arg_7_0.monsterPool, iter_7_0)

			table.insert(arg_7_0.monsters, var_7_0)

			return var_7_0
		end
	end

	local var_7_1

	for iter_7_1 = 1, #arg_7_0.monsterDatas do
		if arg_7_0.monsterDatas[iter_7_1].id == arg_7_1 then
			var_7_1 = arg_7_0.monsterDatas[iter_7_1]
		end
	end

	if var_7_1 then
		local var_7_2 = var_7_1.name
		local var_7_3 = tf(instantiate(findTF(arg_7_0._tpl, var_7_2)))

		var_7_3.localScale = Fushun3GameConst.game_scale_v3

		local var_7_4 = RectCollider.New(var_7_3, {}, arg_7_0._event)

		var_7_4:addScript(FuShunMonsterScript.New())

		var_7_4:getCollisionInfo().config.moveSpeed = math.random(Fushun3GameConst.monster_speed[1], Fushun3GameConst.monster_speed[2])

		local var_7_5 = GetComponent(findTF(var_7_3, "anim"), typeof(Animator))

		setParent(var_7_3, arg_7_0._parent)

		local var_7_6 = GetComponent(findTF(var_7_3, "collider"), typeof(BoxCollider2D))

		findTF(var_7_3, "collider").gameObject.layer = LayerMask.NameToLayer("Character")
		findTF(var_7_3, "collider3D").gameObject.layer = LayerMask.NameToLayer("Character")
		var_7_3.gameObject.layer = LayerMask.NameToLayer("Character")
		var_7_0 = {
			tf = var_7_3,
			data = var_7_1,
			rect = var_7_4,
			animator = var_7_5,
			collider = var_7_6
		}

		GetComponent(findTF(var_7_3, "anim"), typeof(DftAniEvent)):SetEndEvent(function()
			arg_7_0:removeMonster(var_7_0)
		end)
		table.insert(arg_7_0.monsters, var_7_0)
	end

	return var_7_0
end

function var_0_0.checkPlayerDamage(arg_9_0, arg_9_1, arg_9_2)
	for iter_9_0 = 1, #arg_9_0.monsters do
		local var_9_0 = arg_9_0.monsters[iter_9_0]

		if var_9_0.tf == arg_9_1 and var_9_0.damage then
			arg_9_2(true)

			return
		end
	end

	arg_9_2(false)
end

function var_0_0.checkMonsterDamage(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = arg_10_1.bounds

	for iter_10_0 = 1, #arg_10_0.monsters do
		local var_10_1 = arg_10_0.monsters[iter_10_0]
		local var_10_2 = var_10_1.collider.bounds

		if not var_10_1.damage and Fushun3GameConst.CheckBoxCollider(var_10_0.min, var_10_2.min, var_10_0.size, var_10_2.size) then
			arg_10_0:damageMonster(var_10_1.tf, arg_10_3)

			if arg_10_2 then
				arg_10_2(true)
			end

			return
		end
	end

	if arg_10_2 then
		arg_10_2(false)
	end
end

function var_0_0.damageMonster(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	for iter_11_0 = #arg_11_0.monsters, 1, -1 do
		if arg_11_0.monsters[iter_11_0].tf == arg_11_1 then
			local var_11_0 = arg_11_0.monsters[iter_11_0]

			if not var_11_0.damage then
				var_11_0.damage = true

				if arg_11_2 == Fushun3GameEvent.power_damage_monster_call then
					var_11_0.animator:SetTrigger("dmg_ex")
				elseif arg_11_2 == Fushun3GameEvent.shot_damage_monster_call then
					var_11_0.animator:SetTrigger("dmg_la")
				elseif arg_11_2 == Fushun3GameEvent.kick_damage_monster_call then
					var_11_0.animator:SetTrigger("dmg_jump")
				elseif arg_11_2 == Fushun3GameEvent.attack_damdage_monster_call then
					var_11_0.animator:SetTrigger("dmg_attack")
				end

				arg_11_0._event:emit(Fushun3GameEvent.add_monster_score_call)

				if arg_11_3 then
					arg_11_3(true)
				end
			end

			return
		end
	end

	if arg_11_3 then
		arg_11_3(false)
	end
end

function var_0_0.removeMonster(arg_12_0, arg_12_1)
	for iter_12_0 = 1, #arg_12_0.monsters do
		if arg_12_0.monsters[iter_12_0] == arg_12_1 then
			arg_12_0:returnMonsterToPool(table.remove(arg_12_0.monsters, iter_12_0))

			return
		end
	end
end

function var_0_0.returnMonsterToPool(arg_13_0, arg_13_1)
	setActive(arg_13_1.tf, false)
	table.insert(arg_13_0.monsterPool, arg_13_1)
end

function var_0_0.clearMonster(arg_14_0)
	for iter_14_0 = #arg_14_0.monsters, 1, -1 do
		arg_14_0:returnMonsterToPool(table.remove(arg_14_0.monsters, iter_14_0))
	end
end

return var_0_0
