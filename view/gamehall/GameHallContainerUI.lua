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

function var_0_0.Ctor(arg_1_0)
	local var_1_0 = getProxy(BayProxy):getShips()

	arg_1_0.shipNames = {}

	for iter_1_0 = 1, #var_1_0 do
		if not table.contains(arg_1_0.shipNames, var_1_0[iter_1_0].name) then
			table.insert(arg_1_0.shipNames, var_1_0[iter_1_0]:getPrefab())
		end
	end

	if var_0_1 > #arg_1_0.shipNames then
		var_0_1 = #arg_1_0.shipNames
	end
end

function var_0_0.InitUI(arg_2_0, arg_2_1)
	arg_2_0.container = arg_2_1

	local var_2_0 = pg.UIMgr.GetInstance().uiCamera.gameObject.transform:Find("Canvas").sizeDelta.x - var_0_10
	local var_2_1 = var_0_10 - var_0_9 + var_2_0

	var_0_7 = {
		var_2_1,
		0
	}
	var_0_8 = {
		0,
		0
	}
	arg_2_0.container = arg_2_1
	arg_2_0.content = findTF(arg_2_0.container, "content")
	arg_2_0.pos = findTF(arg_2_0.content, "pos")
	arg_2_0.boundContainer = findTF(arg_2_0.content, "bound")
	arg_2_0.charContentEvents = {}
	arg_2_0.charContentCollider = {}
	arg_2_0.items = {}

	for iter_2_0 = 0, arg_2_0.pos.childCount - 1 do
		table.insert(arg_2_0.items, arg_2_0.pos:GetChild(iter_2_0))
	end

	arg_2_0.sitItems = {}

	for iter_2_1 = 1, #var_0_12 do
		local var_2_2 = var_0_12[iter_2_1]
		local var_2_3 = findTF(arg_2_0.pos, var_2_2.pos)
		local var_2_4 = GetComponent(findTF(arg_2_0.pos, var_2_2.spine), typeof(SpineAnimUI))
		local var_2_5 = GetComponent(findTF(arg_2_0.pos, var_2_2.bound), typeof(BoxCollider2D))
		local var_2_6 = arg_2_0.pos:InverseTransformPoint(var_2_5.bounds.min)
		local var_2_7 = arg_2_0.pos:InverseTransformPoint(var_2_5.bounds.max)

		table.insert(arg_2_0.sitItems, {
			sit = false,
			pos = var_2_3,
			min = var_2_6,
			max = var_2_7,
			anim = var_2_4
		})
	end

	arg_2_0.chars = {}

	for iter_2_2 = 1, var_0_1 do
		local var_2_8 = iter_2_2
		local var_2_9 = table.remove(arg_2_0.shipNames, math.random(1, #arg_2_0.shipNames))
		local var_2_10 = SpineAnimChar.New()

		var_2_10:SetPaint(var_2_9)
		var_2_10:Load(true, function(arg_3_0)
			arg_3_0:SetAction("stand2", 0)
			arg_3_0:SetParent(arg_2_0.pos)
			arg_3_0:SetLocalScale(var_0_2)

			local var_3_0 = findTF(arg_2_0.boundContainer, tostring(var_2_8))
			local var_3_1 = GetComponent(var_3_0, typeof(BoxCollider2D))
			local var_3_2 = arg_2_0.pos:InverseTransformPoint(var_3_1.bounds.min)
			local var_3_3 = arg_2_0.pos:InverseTransformPoint(var_3_1.bounds.max)

			arg_3_0:SetAnchoredPosition(arg_2_0:getTargetPos(var_3_2, var_3_3))
			table.insert(arg_2_0.chars, {
				model = arg_3_0,
				vel = Vector2(0, 0),
				bound = {
					var_3_2.x,
					var_3_2.y,
					var_3_3.x,
					var_3_3.y
				},
				min = var_3_2,
				max = var_3_3,
				pos = arg_3_0:GetAnchoredPosition(),
				curScale = arg_3_0:GetLocalScale()
			})
			table.insert(arg_2_0.items, tf(arg_3_0:GetModel()))
		end)
	end

	arg_2_0.bataiTf = findTF(arg_2_0.pos, "batai")
	arg_2_0.coinChar = nil

	PoolMgr.GetInstance():GetSpineChar(var_0_3, true, function(arg_4_0)
		arg_2_0.coinChar = tf(arg_4_0)

		tf(arg_4_0):GetComponent(typeof(SpineAnimUI)):SetAction("stand2", 0)
		setParent(tf(arg_4_0), findTF(arg_2_0.bataiTf, "char"))
		setLocalScale(arg_4_0, var_0_2)
	end)

	arg_2_0.content.anchoredPosition = Vector2(0, 0)

	local var_2_11 = GetOrAddComponent(arg_2_0.content, typeof(EventTriggerListener))

	arg_2_0.velocityXSmoothing = Vector2(0, 0)
	arg_2_0.offsetPosition = arg_2_0.content.anchoredPosition

	var_2_11:AddBeginDragFunc(function(arg_5_0, arg_5_1)
		arg_2_0.prevPosition = arg_5_1.position
		arg_2_0.scenePosition = arg_2_0.content.anchoredPosition
		arg_2_0.velocityXSmoothing = Vector2(0, 0)
		arg_2_0.offsetPosition = arg_2_0.content.anchoredPosition
	end)
	var_2_11:AddDragFunc(function(arg_6_0, arg_6_1)
		arg_2_0.offsetPosition.x = arg_6_1.position.x - arg_2_0.prevPosition.x + arg_2_0.scenePosition.x
		arg_2_0.offsetPosition.y = arg_6_1.position.y - arg_2_0.prevPosition.y + arg_2_0.scenePosition.y
		arg_2_0.offsetPosition.x = arg_2_0.offsetPosition.x > var_0_7[2] and var_0_7[2] or arg_2_0.offsetPosition.x
		arg_2_0.offsetPosition.x = arg_2_0.offsetPosition.x < var_0_7[1] and var_0_7[1] or arg_2_0.offsetPosition.x
		arg_2_0.offsetPosition.y = arg_2_0.offsetPosition.y > var_0_8[2] and var_0_8[2] or arg_2_0.offsetPosition.y
		arg_2_0.offsetPosition.y = arg_2_0.offsetPosition.y < var_0_8[1] and var_0_8[1] or arg_2_0.offsetPosition.y
	end)
	var_2_11:AddDragEndFunc(function(arg_7_0, arg_7_1)
		return
	end)

	arg_2_0.clickItems = {}

	for iter_2_3 = 1, #var_0_11 do
		local var_2_12 = findTF(arg_2_0.pos, var_0_11[iter_2_3][1])
		local var_2_13 = GetComponent(findTF(arg_2_0.pos, var_0_11[iter_2_3][2]), typeof(SpineAnimUI))

		table.insert(arg_2_0.clickItems, {
			time = 0,
			tf = var_2_12,
			anim = var_2_13
		})
		onButton(arg_2_0._event, var_2_12, function()
			if arg_2_0:checkClickTime(var_2_13) then
				arg_2_0:setAnimAction(var_2_13, "action", 1, "normal")
			end
		end)
	end
end

function var_0_0.setCharSit(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_1.sitFlag or arg_9_2.sitFlag then
		return
	end

	local var_9_0 = arg_9_1.model
	local var_9_1 = arg_9_2.pos
	local var_9_2 = arg_9_2.anim

	arg_9_1.model:SetLocalScale(var_0_2)
	arg_9_0:setCharAction(var_9_0, "sit", 0, nil)
	arg_9_0:setAnimAction(var_9_2, "sit", 0, nil)

	arg_9_1.curAction = "sit"
	arg_9_2.curAction = "sit"
	arg_9_1.target = nil
	arg_9_1.sitItem = arg_9_2
	arg_9_1.sitFlag = true
	arg_9_1.time = math.random(10, 20)
	arg_9_1.vel = Vector2(0, 0)
	arg_9_2.sitFlag = true

	arg_9_1.model:SetParent(var_9_1)
	arg_9_1.model:SetAnchoredPosition(Vector2(0, 0))
end

function var_0_0.stopCharSit(arg_10_0, arg_10_1)
	arg_10_1.sitItem.sitFlag = false

	arg_10_0:setCharAction(arg_10_1.model, "walk", 0, nil)
	arg_10_0:setAnimAction(arg_10_1.sitItem.anim, "normal", 0, nil)

	arg_10_1.sitItem = nil
	arg_10_1.sitFlag = false

	arg_10_1.model:SetParent(arg_10_0.pos)
	arg_10_1.model:SetAnchoredPosition(arg_10_1.pos)
end

function var_0_0.checkClickTime(arg_11_0, arg_11_1)
	for iter_11_0 = 1, #arg_11_0.clickItems do
		if arg_11_0.clickItems[iter_11_0].anim == arg_11_1 and (arg_11_0.clickItems[iter_11_0].time == 0 or Time.realtimeSinceStartup > arg_11_0.clickItems[iter_11_0].time) then
			arg_11_0.clickItems[iter_11_0].time = Time.realtimeSinceStartup + 2

			return true
		end
	end

	return false
end

function var_0_0.step(arg_12_0)
	arg_12_0.content.anchoredPosition, arg_12_0.velocityXSmoothing = Vector2.SmoothDamp(arg_12_0.content.anchoredPosition, arg_12_0.offsetPosition, arg_12_0.velocityXSmoothing, var_0_4)

	for iter_12_0 = 1, #arg_12_0.chars do
		local var_12_0 = arg_12_0.chars[iter_12_0]
		local var_12_1 = var_12_0.time
		local var_12_2 = var_12_0.pos

		if not var_12_1 or var_12_1 <= 0 then
			if var_12_0.sitFlag then
				arg_12_0:stopCharSit(var_12_0)
			elseif math.random(1, 10) > 5 then
				local var_12_3 = arg_12_0:getTargetPos(var_12_0.min, var_12_0.max)

				var_12_0.vel, var_12_0.target = arg_12_0:getVel(var_12_2, var_12_3), var_12_3
			end

			var_12_0.time = math.random(1, var_0_6)
		end

		if var_12_0.target and not var_12_0.sitFlag then
			local var_12_4 = {
				var_12_0.vel.x * var_0_5 * Time.deltaTime,
				var_12_0.vel.y * var_0_5 * Time.deltaTime
			}

			if var_12_4[1] ~= 0 then
				var_12_0.pos.x = var_12_0.pos.x + var_12_4[1]
			end

			if var_12_4[2] ~= 0 then
				var_12_0.pos.y = var_12_0.pos.y + var_12_4[2]
			end

			local var_12_5 = var_12_0.bound

			if var_12_0.pos.x < var_12_5[1] then
				var_12_0.pos.x = var_12_5[1]
				var_12_0.vel.x = 0
			end

			if var_12_0.pos.x > var_12_5[3] then
				var_12_0.pos.x = var_12_5[3]
				var_12_0.vel.x = 0
			end

			if var_12_0.pos.y < var_12_5[2] then
				var_12_0.pos.y = var_12_5[2]
				var_12_0.vel.y = 0
			end

			if var_12_0.pos.y > var_12_5[4] then
				var_12_0.pos.y = var_12_5[4]
				var_12_0.vel.y = 0
			end

			var_12_0.model:SetAnchoredPosition(var_12_0.pos)

			local var_12_6 = var_12_0.target

			if math.abs(var_12_0.target.x - var_12_0.pos.x) < 10 then
				var_12_0.vel.x = 0
			end

			if math.abs(var_12_0.target.y - var_12_0.pos.y) < 10 then
				var_12_0.vel.y = 0
			end
		end

		local var_12_7 = true
		local var_12_8 = var_12_0.sitFlag

		if var_12_0.vel.x == 0 and var_12_0.vel.y == 0 then
			var_12_0.time = var_12_0.time - Time.deltaTime
			var_12_7 = false
		end

		if not var_12_7 and var_12_0.target then
			var_12_0.target = nil
		end

		if not var_12_0.sitFlag and not var_12_7 then
			var_12_0.ableSit = true
		end

		if var_12_0.vel.x ~= 0 then
			local var_12_9 = var_12_0.vel.x > 0 and 1 or -1

			if math.sign(var_12_0.curScale.x) ~= var_12_9 then
				var_12_0.curScale.x = var_12_9 * var_0_2.x

				var_12_0.model:SetLocalScale(var_12_0.curScale)
			end
		end

		if var_12_7 then
			if var_12_0.curAction ~= "walk" then
				var_12_0.curAction = "walk"

				var_12_0.model:SetAction("walk", 0)
			end
		elseif var_12_8 then
			if var_12_0.curAction ~= "sit" then
				var_12_0.curAction = "sit"

				var_12_0.model:SetAction("sit", 0)
			end
		elseif var_12_0.curAction ~= "stand2" then
			var_12_0.curAction = "stand2"

			var_12_0.model:SetAction("stand2", 0)
		end

		if var_12_7 then
			arg_12_0:checkCharSit(var_12_0)
		end
	end

	table.sort(arg_12_0.items, function(arg_13_0, arg_13_1)
		if arg_13_0.anchoredPosition.y < arg_13_1.anchoredPosition.y then
			return true
		end
	end)

	for iter_12_1, iter_12_2 in ipairs(arg_12_0.items) do
		iter_12_2:SetAsFirstSibling()
	end
end

function var_0_0.checkCharSit(arg_14_0, arg_14_1)
	if not arg_14_1.ableSit then
		return
	end

	local var_14_0 = arg_14_1.pos

	for iter_14_0 = 1, #arg_14_0.sitItems do
		local var_14_1 = arg_14_0.sitItems[iter_14_0]
		local var_14_2 = var_14_1.min
		local var_14_3 = var_14_1.max

		if var_14_0.x > var_14_2.x and var_14_0.x < var_14_3.x and var_14_0.y > var_14_2.y and var_14_0.y < var_14_3.y then
			if math.random(1, 10) > 7 then
				print("角色想坐下")
				arg_14_0:setCharSit(arg_14_1, var_14_1)
			else
				arg_14_1.ableSit = false

				print("角色不想坐下")
			end
		end
	end
end

function var_0_0.getVel(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = math.atan(math.abs(arg_15_2.y - arg_15_1.y) / math.abs(arg_15_2.x - arg_15_1.x))
	local var_15_1 = arg_15_2.x > arg_15_1.x and 1 or -1
	local var_15_2 = arg_15_2.y > arg_15_1.y and 1 or -1
	local var_15_3 = math.cos(var_15_0) * var_15_1
	local var_15_4 = math.sin(var_15_0) * var_15_2

	return Vector2(var_15_3, var_15_4)
end

function var_0_0.setCharAction(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	arg_16_1:SetActionCallBack(nil)
	arg_16_1:SetAction(arg_16_2, 0)
	arg_16_1:SetActionCallBack(function(arg_17_0)
		if arg_17_0 == "finish" and arg_16_3 == 1 then
			arg_16_1:SetActionCallBack(nil)
			arg_16_1:SetAction(arg_16_4, 0)
		end
	end)
end

function var_0_0.setAnimAction(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	arg_18_1:SetActionCallBack(nil)
	arg_18_1:SetAction(arg_18_2, 0)
	arg_18_1:SetActionCallBack(function(arg_19_0)
		if arg_19_0 == "finish" and arg_18_3 == 1 then
			arg_18_1:SetActionCallBack(nil)
			arg_18_1:SetAction(arg_18_4, 0)
		end
	end)
end

function var_0_0.getTargetPos(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = tonumber(arg_20_2.x) - tonumber(arg_20_1.x)
	local var_20_1 = tonumber(arg_20_2.y) - tonumber(arg_20_1.y)

	return Vector2(arg_20_1.x + math.random(1, var_20_0), arg_20_1.y + math.random(1, var_20_1))
end

function var_0_0.isPointInMatrix(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4, arg_21_5)
	return arg_21_0:getCross(arg_21_1, arg_21_2, arg_21_5) * arg_21_0:getCross(arg_21_3, arg_21_4, arg_21_5) >= 0 and arg_21_0:getCross(arg_21_2, arg_21_3, arg_21_5) * arg_21_0:getCross(arg_21_4, arg_21_1, arg_21_5) >= 0
end

function var_0_0.Dispose(arg_22_0)
	if arg_22_0.coinChar then
		PoolMgr.GetInstance():ReturnSpineChar(var_0_3, go(arg_22_0.coinChar))

		arg_22_0.coinChar = nil
	end

	if arg_22_0.chars and #arg_22_0.chars > 0 then
		for iter_22_0 = 1, #arg_22_0.chars do
			arg_22_0.chars[iter_22_0].model:Dispose()
		end

		arg_22_0.chars = nil
	end
end

return var_0_0
