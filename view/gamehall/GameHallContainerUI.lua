local var_0_0 = class("GameHallContainerUI")
local var_0_1 = 4
local var_0_2 = Vector3(0.7, 0.7, 0.7)
local var_0_3 = "mingshi"
local var_0_4 = 0.1
local var_0_5 = 100
local var_0_6 = 4
local var_0_7
local var_0_8
local var_0_9 = 3256
local var_0_10 = 1920
local var_0_11 = {
	{
		"item3",
		"item3/spine"
	}
}
local var_0_12 = {
	{
		bound = "item1/spine/bound",
		pos = "item1/spine/pos",
		spine = "item1/spine"
	},
	{
		bound = "item2/spine2/bound",
		pos = "item2/spine2/pos",
		spine = "item2/spine2"
	},
	{
		bound = "item2/spine3/bound",
		pos = "item2/spine3/pos",
		spine = "item2/spine3"
	},
	{
		bound = "item4/spine1/bound",
		pos = "item4/spine1/pos",
		spine = "item4/spine1"
	},
	{
		bound = "item4/spine2/bound",
		pos = "item4/spine2/pos",
		spine = "item4/spine2"
	},
	{
		bound = "item6/spine1/bound",
		pos = "item6/spine1/pos",
		spine = "item6/spine1"
	},
	{
		bound = "item6/spine2/bound",
		pos = "item6/spine2/pos",
		spine = "item6/spine2"
	}
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	local var_1_0 = pg.UIMgr.GetInstance().uiCamera.gameObject.transform:Find("Canvas").sizeDelta.x - var_0_10
	local var_1_1 = var_0_10 - var_0_9 + var_1_0

	var_0_7 = {
		var_1_1,
		0
	}
	var_0_8 = {
		0,
		0
	}
	arg_1_0.container = arg_1_1
	arg_1_0.content = findTF(arg_1_0.container, "content")
	arg_1_0.pos = findTF(arg_1_0.content, "pos")
	arg_1_0.boundContainer = findTF(arg_1_0.content, "bound")
	arg_1_0.charContentEvents = {}
	arg_1_0.charContentCollider = {}
	arg_1_0.items = {}

	for iter_1_0 = 0, arg_1_0.pos.childCount - 1 do
		table.insert(arg_1_0.items, arg_1_0.pos:GetChild(iter_1_0))
	end

	arg_1_0.sitItems = {}

	for iter_1_1 = 1, #var_0_12 do
		local var_1_2 = var_0_12[iter_1_1]
		local var_1_3 = findTF(arg_1_0.pos, var_1_2.pos)
		local var_1_4 = GetComponent(findTF(arg_1_0.pos, var_1_2.spine), typeof(SpineAnimUI))
		local var_1_5 = GetComponent(findTF(arg_1_0.pos, var_1_2.bound), typeof(BoxCollider2D))
		local var_1_6 = arg_1_0.pos:InverseTransformPoint(var_1_5.bounds.min)
		local var_1_7 = arg_1_0.pos:InverseTransformPoint(var_1_5.bounds.max)

		table.insert(arg_1_0.sitItems, {
			sit = false,
			pos = var_1_3,
			min = var_1_6,
			max = var_1_7,
			anim = var_1_4
		})
	end

	local var_1_8 = getProxy(BayProxy):getShips()
	local var_1_9 = {}

	for iter_1_2 = 1, #var_1_8 do
		if not table.contains(var_1_9, var_1_8[iter_1_2].name) then
			table.insert(var_1_9, var_1_8[iter_1_2]:getPrefab())
		end
	end

	if var_0_1 > #var_1_9 then
		var_0_1 = #var_1_9
	end

	arg_1_0.chars = {}

	for iter_1_3 = 1, var_0_1 do
		local var_1_10 = iter_1_3
		local var_1_11 = table.remove(var_1_9, math.random(1, #var_1_9))
		local var_1_12 = SpineAnimChar.New()

		var_1_12:SetPaint(var_1_11)
		var_1_12:Load(true, function(arg_2_0)
			arg_2_0:SetAction("stand2", 0)
			arg_2_0:SetParent(arg_1_0.pos)
			arg_2_0:SetLocalScale(var_0_2)

			local var_2_0 = findTF(arg_1_0.boundContainer, tostring(var_1_10))
			local var_2_1 = GetComponent(var_2_0, typeof(BoxCollider2D))
			local var_2_2 = arg_1_0.pos:InverseTransformPoint(var_2_1.bounds.min)
			local var_2_3 = arg_1_0.pos:InverseTransformPoint(var_2_1.bounds.max)

			arg_2_0:SetAnchoredPosition(arg_1_0:getTargetPos(var_2_2, var_2_3))
			table.insert(arg_1_0.chars, {
				model = arg_2_0,
				vel = Vector2(0, 0),
				bound = {
					var_2_2.x,
					var_2_2.y,
					var_2_3.x,
					var_2_3.y
				},
				min = var_2_2,
				max = var_2_3,
				pos = arg_2_0:GetAnchoredPosition(),
				curScale = arg_2_0:GetLocalScale()
			})
			table.insert(arg_1_0.items, tf(arg_2_0:GetModel()))
		end)
	end

	arg_1_0.bataiTf = findTF(arg_1_0.pos, "batai")
	arg_1_0.coinChar = nil

	PoolMgr.GetInstance():GetSpineChar(var_0_3, true, function(arg_3_0)
		arg_1_0.coinChar = tf(arg_3_0)

		tf(arg_3_0):GetComponent(typeof(SpineAnimUI)):SetAction("stand2", 0)
		setParent(tf(arg_3_0), findTF(arg_1_0.bataiTf, "char"))
		setLocalScale(arg_3_0, var_0_2)
	end)

	arg_1_0.content.anchoredPosition = Vector2(0, 0)

	local var_1_13 = GetOrAddComponent(arg_1_0.content, typeof(EventTriggerListener))

	arg_1_0.velocityXSmoothing = Vector2(0, 0)
	arg_1_0.offsetPosition = arg_1_0.content.anchoredPosition

	var_1_13:AddBeginDragFunc(function(arg_4_0, arg_4_1)
		arg_1_0.prevPosition = arg_4_1.position
		arg_1_0.scenePosition = arg_1_0.content.anchoredPosition
		arg_1_0.velocityXSmoothing = Vector2(0, 0)
		arg_1_0.offsetPosition = arg_1_0.content.anchoredPosition
	end)
	var_1_13:AddDragFunc(function(arg_5_0, arg_5_1)
		arg_1_0.offsetPosition.x = arg_5_1.position.x - arg_1_0.prevPosition.x + arg_1_0.scenePosition.x
		arg_1_0.offsetPosition.y = arg_5_1.position.y - arg_1_0.prevPosition.y + arg_1_0.scenePosition.y
		arg_1_0.offsetPosition.x = arg_1_0.offsetPosition.x > var_0_7[2] and var_0_7[2] or arg_1_0.offsetPosition.x
		arg_1_0.offsetPosition.x = arg_1_0.offsetPosition.x < var_0_7[1] and var_0_7[1] or arg_1_0.offsetPosition.x
		arg_1_0.offsetPosition.y = arg_1_0.offsetPosition.y > var_0_8[2] and var_0_8[2] or arg_1_0.offsetPosition.y
		arg_1_0.offsetPosition.y = arg_1_0.offsetPosition.y < var_0_8[1] and var_0_8[1] or arg_1_0.offsetPosition.y
	end)
	var_1_13:AddDragEndFunc(function(arg_6_0, arg_6_1)
		return
	end)

	arg_1_0.clickItems = {}

	for iter_1_4 = 1, #var_0_11 do
		local var_1_14 = findTF(arg_1_0.pos, var_0_11[iter_1_4][1])
		local var_1_15 = GetComponent(findTF(arg_1_0.pos, var_0_11[iter_1_4][2]), typeof(SpineAnimUI))

		table.insert(arg_1_0.clickItems, {
			time = 0,
			tf = var_1_14,
			anim = var_1_15
		})
		onButton(arg_1_0._event, var_1_14, function()
			if arg_1_0:checkClickTime(var_1_15) then
				arg_1_0:setAnimAction(var_1_15, "action", 1, "normal")
			end
		end)
	end
end

function var_0_0.setCharSit(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1.sitFlag or arg_8_2.sitFlag then
		return
	end

	local var_8_0 = arg_8_1.model
	local var_8_1 = arg_8_2.pos
	local var_8_2 = arg_8_2.anim

	arg_8_1.model:SetLocalScale(var_0_2)
	arg_8_0:setCharAction(var_8_0, "sit", 0, nil)
	arg_8_0:setAnimAction(var_8_2, "sit", 0, nil)

	arg_8_1.curAction = "sit"
	arg_8_2.curAction = "sit"
	arg_8_1.target = nil
	arg_8_1.sitItem = arg_8_2
	arg_8_1.sitFlag = true
	arg_8_1.time = math.random(10, 20)
	arg_8_1.vel = Vector2(0, 0)
	arg_8_2.sitFlag = true

	arg_8_1.model:SetParent(var_8_1)
	arg_8_1.model:SetAnchoredPosition(Vector2(0, 0))
end

function var_0_0.stopCharSit(arg_9_0, arg_9_1)
	arg_9_1.sitItem.sitFlag = false

	arg_9_0:setCharAction(arg_9_1.model, "walk", 0, nil)
	arg_9_0:setAnimAction(arg_9_1.sitItem.anim, "normal", 0, nil)

	arg_9_1.sitItem = nil
	arg_9_1.sitFlag = false

	arg_9_1.model:SetParent(arg_9_0.pos)
	arg_9_1.model:SetAnchoredPosition(arg_9_1.pos)
end

function var_0_0.checkClickTime(arg_10_0, arg_10_1)
	for iter_10_0 = 1, #arg_10_0.clickItems do
		if arg_10_0.clickItems[iter_10_0].anim == arg_10_1 and (arg_10_0.clickItems[iter_10_0].time == 0 or Time.realtimeSinceStartup > arg_10_0.clickItems[iter_10_0].time) then
			arg_10_0.clickItems[iter_10_0].time = Time.realtimeSinceStartup + 2

			return true
		end
	end

	return false
end

function var_0_0.step(arg_11_0)
	arg_11_0.content.anchoredPosition, arg_11_0.velocityXSmoothing = Vector2.SmoothDamp(arg_11_0.content.anchoredPosition, arg_11_0.offsetPosition, arg_11_0.velocityXSmoothing, var_0_4)

	for iter_11_0 = 1, #arg_11_0.chars do
		local var_11_0 = arg_11_0.chars[iter_11_0]
		local var_11_1 = var_11_0.time
		local var_11_2 = var_11_0.pos

		if not var_11_1 or var_11_1 <= 0 then
			if var_11_0.sitFlag then
				arg_11_0:stopCharSit(var_11_0)
			elseif math.random(1, 10) > 5 then
				local var_11_3 = arg_11_0:getTargetPos(var_11_0.min, var_11_0.max)

				var_11_0.vel, var_11_0.target = arg_11_0:getVel(var_11_2, var_11_3), var_11_3
			end

			var_11_0.time = math.random(1, var_0_6)
		end

		if var_11_0.target and not var_11_0.sitFlag then
			local var_11_4 = {
				var_11_0.vel.x * var_0_5 * Time.deltaTime,
				var_11_0.vel.y * var_0_5 * Time.deltaTime
			}

			if var_11_4[1] ~= 0 then
				var_11_0.pos.x = var_11_0.pos.x + var_11_4[1]
			end

			if var_11_4[2] ~= 0 then
				var_11_0.pos.y = var_11_0.pos.y + var_11_4[2]
			end

			local var_11_5 = var_11_0.bound

			if var_11_0.pos.x < var_11_5[1] then
				var_11_0.pos.x = var_11_5[1]
				var_11_0.vel.x = 0
			end

			if var_11_0.pos.x > var_11_5[3] then
				var_11_0.pos.x = var_11_5[3]
				var_11_0.vel.x = 0
			end

			if var_11_0.pos.y < var_11_5[2] then
				var_11_0.pos.y = var_11_5[2]
				var_11_0.vel.y = 0
			end

			if var_11_0.pos.y > var_11_5[4] then
				var_11_0.pos.y = var_11_5[4]
				var_11_0.vel.y = 0
			end

			var_11_0.model:SetAnchoredPosition(var_11_0.pos)

			local var_11_6 = var_11_0.target

			if math.abs(var_11_0.target.x - var_11_0.pos.x) < 10 then
				var_11_0.vel.x = 0
			end

			if math.abs(var_11_0.target.y - var_11_0.pos.y) < 10 then
				var_11_0.vel.y = 0
			end
		end

		local var_11_7 = true
		local var_11_8 = var_11_0.sitFlag

		if var_11_0.vel.x == 0 and var_11_0.vel.y == 0 then
			var_11_0.time = var_11_0.time - Time.deltaTime
			var_11_7 = false
		end

		if not var_11_7 and var_11_0.target then
			var_11_0.target = nil
		end

		if not var_11_0.sitFlag and not var_11_7 then
			var_11_0.ableSit = true
		end

		if var_11_0.vel.x ~= 0 then
			local var_11_9 = var_11_0.vel.x > 0 and 1 or -1

			if math.sign(var_11_0.curScale.x) ~= var_11_9 then
				var_11_0.curScale.x = var_11_9 * var_0_2.x

				var_11_0.model:SetLocalScale(var_11_0.curScale)
			end
		end

		if var_11_7 then
			if var_11_0.curAction ~= "walk" then
				var_11_0.curAction = "walk"

				var_11_0.model:SetAction("walk", 0)
			end
		elseif var_11_8 then
			if var_11_0.curAction ~= "sit" then
				var_11_0.curAction = "sit"

				var_11_0.model:SetAction("sit", 0)
			end
		elseif var_11_0.curAction ~= "stand2" then
			var_11_0.curAction = "stand2"

			var_11_0.model:SetAction("stand2", 0)
		end

		if var_11_7 then
			arg_11_0:checkCharSit(var_11_0)
		end
	end

	table.sort(arg_11_0.items, function(arg_12_0, arg_12_1)
		if arg_12_0.anchoredPosition.y < arg_12_1.anchoredPosition.y then
			return true
		end
	end)

	for iter_11_1, iter_11_2 in ipairs(arg_11_0.items) do
		iter_11_2:SetAsFirstSibling()
	end
end

function var_0_0.checkCharSit(arg_13_0, arg_13_1)
	if not arg_13_1.ableSit then
		return
	end

	local var_13_0 = arg_13_1.pos

	for iter_13_0 = 1, #arg_13_0.sitItems do
		local var_13_1 = arg_13_0.sitItems[iter_13_0]
		local var_13_2 = var_13_1.min
		local var_13_3 = var_13_1.max

		if var_13_0.x > var_13_2.x and var_13_0.x < var_13_3.x and var_13_0.y > var_13_2.y and var_13_0.y < var_13_3.y then
			if math.random(1, 10) > 7 then
				print("角色想坐下")
				arg_13_0:setCharSit(arg_13_1, var_13_1)
			else
				arg_13_1.ableSit = false

				print("角色不想坐下")
			end
		end
	end
end

function var_0_0.getVel(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = math.atan(math.abs(arg_14_2.y - arg_14_1.y) / math.abs(arg_14_2.x - arg_14_1.x))
	local var_14_1 = arg_14_2.x > arg_14_1.x and 1 or -1
	local var_14_2 = arg_14_2.y > arg_14_1.y and 1 or -1
	local var_14_3 = math.cos(var_14_0) * var_14_1
	local var_14_4 = math.sin(var_14_0) * var_14_2

	return Vector2(var_14_3, var_14_4)
end

function var_0_0.setCharAction(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	arg_15_1:SetActionCallBack(nil)
	arg_15_1:SetAction(arg_15_2, 0)
	arg_15_1:SetActionCallBack(function(arg_16_0)
		if arg_16_0 == "finish" and arg_15_3 == 1 then
			arg_15_1:SetActionCallBack(nil)
			arg_15_1:SetAction(arg_15_4, 0)
		end
	end)
end

function var_0_0.setAnimAction(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	arg_17_1:SetActionCallBack(nil)
	arg_17_1:SetAction(arg_17_2, 0)
	arg_17_1:SetActionCallBack(function(arg_18_0)
		if arg_18_0 == "finish" and arg_17_3 == 1 then
			arg_17_1:SetActionCallBack(nil)
			arg_17_1:SetAction(arg_17_4, 0)
		end
	end)
end

function var_0_0.getTargetPos(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = tonumber(arg_19_2.x) - tonumber(arg_19_1.x)
	local var_19_1 = tonumber(arg_19_2.y) - tonumber(arg_19_1.y)

	return Vector2(arg_19_1.x + math.random(1, var_19_0), arg_19_1.y + math.random(1, var_19_1))
end

function var_0_0.isPointInMatrix(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5)
	return arg_20_0:getCross(arg_20_1, arg_20_2, arg_20_5) * arg_20_0:getCross(arg_20_3, arg_20_4, arg_20_5) >= 0 and arg_20_0:getCross(arg_20_2, arg_20_3, arg_20_5) * arg_20_0:getCross(arg_20_4, arg_20_1, arg_20_5) >= 0
end

function var_0_0.Dispose(arg_21_0)
	if arg_21_0.coinChar then
		PoolMgr.GetInstance():ReturnSpineChar(var_0_3, go(arg_21_0.coinChar))

		arg_21_0.coinChar = nil
	end

	if arg_21_0.chars and #arg_21_0.chars > 0 then
		for iter_21_0 = 1, #arg_21_0.chars do
			arg_21_0.chars[iter_21_0].model:Dispose()
		end

		arg_21_0.chars = nil
	end
end

return var_0_0
