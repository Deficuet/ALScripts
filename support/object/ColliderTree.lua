pg = pg or {}

local var_0_0 = math.max
local var_0_1 = math.min
local var_0_2 = pg
local var_0_3 = var_0_2.CldNode
local var_0_4 = table

var_0_2.CldArea = class("CldArea")

function var_0_2.CldArea.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.min = arg_1_1
	arg_1_0.max = arg_1_2
	arg_1_0.center = (arg_1_1 + arg_1_2):Mul(0.5)
	arg_1_0.father = arg_1_3

	if arg_1_3 then
		arg_1_0.level = arg_1_3.level + 1
	else
		arg_1_0.level = 1
	end

	arg_1_0.isLeaf = true
	arg_1_0.childs = {}
	arg_1_0.nodes = {}
end

function var_0_2.CldArea.AddNode(arg_2_0, arg_2_1)
	var_0_4.insert(arg_2_0.nodes, arg_2_1)

	arg_2_1.area = arg_2_0
end

function var_0_2.CldArea.InArea(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_1.x < arg_3_0.min.x or arg_3_1.y < arg_3_0.min.y then
		return false
	end

	if arg_3_2.x > arg_3_0.max.x or arg_3_2.y > arg_3_0.max.y then
		return false
	end

	return true
end

function var_0_2.CldArea.GetAreaIndex(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0.center
	local var_4_1 = arg_4_1.x >= var_4_0.x and 0 or 2
	local var_4_2 = arg_4_2.x >= var_4_0.x and 0 or 2

	if var_4_1 ~= var_4_2 then
		return 0
	end

	local var_4_3 = var_4_1 + (arg_4_1.z >= var_4_0.z and 1 or 2)

	return var_4_3 == var_4_2 + (arg_4_2.z >= var_4_0.z and 1 or 2) and var_4_3 or 0
end

local var_0_5 = class("ColliderTree")

var_0_2.ColliderTree = var_0_5
var_0_5.MaxLayer = 3

local var_0_6 = 6

function var_0_5.Ctor(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	arg_5_0.name = arg_5_1
	arg_5_0.root = var_0_2.CldArea.New(arg_5_2, arg_5_3, nil)
	arg_5_0.MaxLayer = arg_5_4
	arg_5_0.cldStack = {}
end

function var_0_5.Insert(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.area

	if var_6_0 then
		var_0_4.removebyvalue(var_6_0.nodes, arg_6_1)
	end

	arg_6_0:_insert(arg_6_1, arg_6_0:_findParent(arg_6_1, arg_6_0.root))
end

function var_0_5._findParent(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1.min
	local var_7_1 = arg_7_1.max
	local var_7_2

	while not arg_7_2.isLeaf do
		local var_7_3 = arg_7_2:GetAreaIndex(var_7_0, var_7_1)

		if var_7_3 < 1 then
			break
		end

		arg_7_2 = arg_7_2.childs[var_7_3]
	end

	return arg_7_2
end

function var_0_5._insert(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0

	if not arg_8_2.isLeaf or #arg_8_2.nodes < var_0_6 or arg_8_2.level >= arg_8_0.MaxLayer then
		arg_8_2:AddNode(arg_8_1)

		return
	end

	arg_8_2.isLeaf = false

	local var_8_1 = arg_8_2.center
	local var_8_2 = arg_8_2.max
	local var_8_3 = arg_8_2.min

	arg_8_2.childs[1] = var_0_2.CldArea.New(var_8_1, var_8_2, arg_8_2)
	arg_8_2.childs[2] = var_0_2.CldArea.New(Vector3(var_8_1.x, 0, var_8_3.z), Vector3(var_8_2.x, 0, var_8_1.z), arg_8_2)
	arg_8_2.childs[3] = var_0_2.CldArea.New(Vector3(var_8_3.x, 0, var_8_1.z), Vector3(var_8_1.x, 0, var_8_2.z), arg_8_2)
	arg_8_2.childs[4] = var_0_2.CldArea.New(var_8_3, var_8_1, arg_8_2)

	for iter_8_0 = #arg_8_2.nodes, 1, -1 do
		local var_8_4 = arg_8_2.nodes[iter_8_0]
		local var_8_5 = arg_8_2:GetAreaIndex(var_8_4.min, var_8_4.max)

		if var_8_5 > 0 then
			arg_8_2.childs[var_8_5]:AddNode(var_8_4)
			var_0_4.remove(arg_8_2.nodes, iter_8_0)
		end
	end

	local var_8_6 = arg_8_2:GetAreaIndex(arg_8_1.min, arg_8_1.max)

	if var_8_6 > 0 then
		arg_8_2.childs[var_8_6]:AddNode(arg_8_1)
	else
		arg_8_2:AddNode(arg_8_1)
	end
end

function var_0_5.Update(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.area

	if var_9_0 == nil then
		return
	end

	local var_9_1 = arg_9_1.min
	local var_9_2 = arg_9_1.max

	while var_9_0.father do
		if var_9_0:InArea(var_9_1, var_9_2) then
			break
		end

		var_9_0 = var_9_0.father
	end

	local var_9_3 = arg_9_0:_findParent(arg_9_1, var_9_0)

	if var_9_3 ~= arg_9_1.area then
		var_0_4.removebyvalue(arg_9_1.area.nodes, arg_9_1)
		arg_9_0:_insert(arg_9_1, var_9_3)
	end
end

function var_0_5.Remove(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.area

	if not var_10_0 then
		return
	end

	var_0_4.removebyvalue(var_10_0.nodes, arg_10_1)

	arg_10_1.area = nil
end

function var_0_5.Intersect(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	return arg_11_0.x <= arg_11_3.x and arg_11_1.x >= arg_11_2.x and arg_11_0.z <= arg_11_3.z and arg_11_1.z >= arg_11_2.z
end

function var_0_5.CylinderCheck(arg_12_0, arg_12_1)
	if not arg_12_0.cylinder and not arg_12_1.cylinder then
		return true
	end

	if arg_12_0.cylinder and arg_12_1.cylinder then
		local var_12_0 = arg_12_0.center.x - arg_12_1.center.x
		local var_12_1 = arg_12_0.center.z - arg_12_1.center.z
		local var_12_2 = arg_12_0.range + arg_12_1.range

		return var_12_0 * var_12_0 + var_12_1 * var_12_1 <= var_12_2 * var_12_2
	end

	local var_12_3 = arg_12_0.cylinder and arg_12_0 or arg_12_1
	local var_12_4 = var_12_3.range
	local var_12_5 = var_12_3.center.x
	local var_12_6 = var_12_3.center.z
	local var_12_7 = arg_12_0.cylinder and arg_12_1 or arg_12_0

	if var_12_5 >= var_12_7.min.x and var_12_5 <= var_12_7.max.x then
		return var_12_6 >= var_12_7.min.z - var_12_4 and var_12_6 <= var_12_7.max.z + var_12_4
	elseif var_12_6 >= var_12_7.min.z and var_12_6 <= var_12_7.max.z then
		return var_12_5 >= var_12_7.min.x - var_12_4 and var_12_5 <= var_12_7.max.x + var_12_4
	else
		local var_12_8
		local var_12_9

		if var_12_5 < var_12_7.min.x then
			var_12_8 = var_12_7.min.x - var_12_5
		else
			var_12_8 = var_12_7.max.x - var_12_5
		end

		if var_12_6 < var_12_7.min.z then
			var_12_9 = var_12_7.min.z - var_12_6
		else
			var_12_9 = var_12_7.max.z - var_12_6
		end

		return var_12_8 * var_12_8 + var_12_9 * var_12_9 < var_12_4 * var_12_4
	end
end

function var_0_5.getTime(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = 0

	if arg_13_2.x ~= 0 then
		var_13_0 = var_0_0(0, (var_0_0(arg_13_0.min.x, arg_13_1.min.x) - var_0_1(arg_13_0.max.x, arg_13_1.max.x)) / arg_13_2.x)
	end

	if arg_13_2.z ~= 0 then
		var_13_0 = var_0_0(var_13_0, (var_0_0(arg_13_0.min.z, arg_13_1.min.z) - var_0_1(arg_13_0.max.z, arg_13_1.max.z)) / arg_13_2.z)
	end

	return var_13_0
end

function var_0_5.GetCldList(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_1.min
	local var_14_1 = arg_14_1.max
	local var_14_2
	local var_14_3 = arg_14_0.root
	local var_14_4 = {}

	while not var_14_3.isLeaf do
		local var_14_5 = var_14_3:GetAreaIndex(var_14_0, var_14_1)

		if var_14_5 < 1 then
			break
		end

		for iter_14_0, iter_14_1 in ipairs(var_14_3.nodes) do
			if var_0_5.Intersect(iter_14_1.min, iter_14_1.max, var_14_0, var_14_1) and var_0_5.CylinderCheck(arg_14_1, iter_14_1) then
				var_0_4.insert(var_14_4, iter_14_1)
			end
		end

		var_14_3 = var_14_3.childs[var_14_5]
	end

	local var_14_6 = arg_14_0.cldStack

	var_0_4.insert(var_14_6, var_14_3)

	while #var_14_6 > 0 do
		local var_14_7 = var_0_4.remove(var_14_6)

		for iter_14_2, iter_14_3 in ipairs(var_14_7.nodes) do
			if var_0_5.Intersect(iter_14_3.min, iter_14_3.max, var_14_0, var_14_1) and var_0_5.CylinderCheck(arg_14_1, iter_14_3) then
				var_0_4.insert(var_14_4, iter_14_3)
			end
		end

		for iter_14_4, iter_14_5 in pairs(var_14_7.childs) do
			if iter_14_5 ~= null and var_0_5.Intersect(iter_14_5.min, iter_14_5.max, var_14_0, var_14_1) then
				var_0_4.insert(var_14_6, iter_14_5)
			end
		end
	end

	return var_14_4
end

function var_0_5.GetCldListGradient(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = Vector3(math.cos(arg_15_1), 0, math.sin(arg_15_1))
	local var_15_1 = Vector3.Cross(var_15_0, Vector3.up)
	local var_15_2 = {
		1,
		2,
		3,
		4,
		[1] = arg_15_4 + var_15_1 * (arg_15_2 * -0.5),
		[2] = arg_15_4 + var_15_1 * (arg_15_2 * 0.5)
	}
	local var_15_3 = var_15_0 * arg_15_3

	var_15_2[3] = var_15_2[2] + var_15_3
	var_15_2[4] = var_15_2[1] + var_15_3

	local var_15_4 = var_0_2.CldNode.New()
	local var_15_5 = Vector3(var_0_1(var_15_2[1].x, var_15_2[2].x, var_15_2[3].x, var_15_2[4].x), 0, var_0_1(var_15_2[1].z, var_15_2[2].z, var_15_2[3].z, var_15_2[4].z))
	local var_15_6 = Vector3(var_0_0(var_15_2[1].x, var_15_2[2].x, var_15_2[3].x, var_15_2[4].x), 0, var_0_0(var_15_2[1].z, var_15_2[2].z, var_15_2[3].z, var_15_2[4].z))

	var_15_4:UpdateStaticBox(var_15_5, var_15_6)

	local var_15_7 = arg_15_0:GetCldList(var_15_4, nil)
	local var_15_8 = var_15_0.x * var_15_0.z

	if var_15_8 == 0 then
		return var_15_7
	end

	local var_15_9
	local var_15_10
	local var_15_11
	local var_15_12

	for iter_15_0 = #var_15_7, 1, -1 do
		local var_15_13 = var_15_7[iter_15_0]

		if var_15_8 > 0 then
			var_15_9 = var_15_13.min
			var_15_10 = var_15_13.max
			var_15_11 = Vector3(var_15_9.x, 0, var_15_10.z)
			var_15_12 = Vector3(var_15_10.x, 0, var_15_9.z)
		else
			var_15_11 = var_15_13.min
			var_15_12 = var_15_13.max
			var_15_9 = Vector3(var_15_11.x, 0, var_15_12.z)
			var_15_10 = Vector3(var_15_12.x, 0, var_15_11.z)
		end

		repeat
			local var_15_14 = Vector3.Dot(var_15_0, var_15_9 - var_15_2[1])
			local var_15_15 = Vector3.Dot(var_15_0, var_15_10 - var_15_2[1])

			if var_15_14 < 0 and var_15_15 < 0 or arg_15_3 < var_15_14 and arg_15_3 < var_15_15 then
				var_0_4.remove(var_15_7, iter_15_0)

				break
			end

			local var_15_16 = Vector3.Dot(var_15_1, var_15_11 - var_15_2[1])
			local var_15_17 = Vector3.Dot(var_15_1, var_15_12 - var_15_2[1])

			if var_15_16 < 0 and var_15_17 < 0 or arg_15_2 < var_15_16 and arg_15_2 < var_15_17 then
				var_0_4.remove(var_15_7, iter_15_0)
			end

			break
		until true
	end

	return var_15_7
end

function var_0_5.GetCldListEllipse(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_3.x
	local var_16_1 = arg_16_3.z
	local var_16_2 = var_0_2.CldNode.New()

	var_16_2:UpdateStaticBox(Vector3(var_16_0 - arg_16_1, 0, var_16_1 - arg_16_2), Vector3(var_16_0 + arg_16_1, 0, var_16_1 + arg_16_2))

	local var_16_3 = arg_16_0:GetCldList(var_16_2, nil)
	local var_16_4 = {}

	for iter_16_0, iter_16_1 in ipairs(var_16_3) do
		if ellipseIntersectsRect(var_16_0, var_16_1, arg_16_1, arg_16_2, iter_16_1.min, iter_16_1.max) then
			var_0_4.insert(var_16_4, iter_16_1)
		end
	end

	return var_16_4
end

function var_0_5.pointInEllipse(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5)
	local var_17_0 = arg_17_0 - arg_17_2
	local var_17_1 = arg_17_1 - arg_17_3

	return var_17_0 * var_17_0 / (arg_17_4 * arg_17_4) + var_17_1 * var_17_1 / (arg_17_5 * arg_17_5) <= 1
end

function var_0_5.lineIntersectsEllipse(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4, arg_18_5, arg_18_6, arg_18_7)
	arg_18_0, arg_18_1 = arg_18_0 - arg_18_4, arg_18_1 - arg_18_5
	arg_18_2, arg_18_3 = arg_18_2 - arg_18_4, arg_18_3 - arg_18_5

	local var_18_0 = arg_18_2 - arg_18_0
	local var_18_1 = arg_18_3 - arg_18_1
	local var_18_2 = var_18_0 * var_18_0 / (arg_18_6 * arg_18_6) + var_18_1 * var_18_1 / (arg_18_7 * arg_18_7)
	local var_18_3 = 2 * (arg_18_0 * var_18_0 / (arg_18_6 * arg_18_6) + arg_18_1 * var_18_1 / (arg_18_7 * arg_18_7))
	local var_18_4 = arg_18_0 * arg_18_0 / (arg_18_6 * arg_18_6) + arg_18_1 * arg_18_1 / (arg_18_7 * arg_18_7) - 1
	local var_18_5 = var_18_3 * var_18_3 - 4 * var_18_2 * var_18_4

	if var_18_5 < 0 then
		return false
	end

	local var_18_6 = math.sqrt(var_18_5)
	local var_18_7 = (-var_18_3 - var_18_6) / (2 * var_18_2)
	local var_18_8 = (-var_18_3 + var_18_6) / (2 * var_18_2)

	return var_18_7 >= 0 and var_18_7 <= 1 or var_18_8 >= 0 and var_18_8 <= 1
end

function var_0_5.ellipseIntersectsRect(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
	local var_19_0 = arg_19_0 - arg_19_2
	local var_19_1 = arg_19_0 + arg_19_2
	local var_19_2 = arg_19_1 - arg_19_3
	local var_19_3 = arg_19_1 + arg_19_3

	if var_19_0 > arg_19_5.x or var_19_1 < arg_19_4.x or var_19_2 > arg_19_5.z or var_19_3 < arg_19_4.z then
		return false
	end

	local var_19_4 = {
		{
			arg_19_4.x,
			arg_19_4.z
		},
		{
			arg_19_5.x,
			arg_19_4.z
		},
		{
			arg_19_5.x,
			arg_19_5.z
		},
		{
			arg_19_4.x,
			arg_19_5.z
		}
	}

	for iter_19_0, iter_19_1 in ipairs(var_19_4) do
		if var_0_5.pointInEllipse(iter_19_1[1], iter_19_1[2], arg_19_0, arg_19_1, arg_19_2, arg_19_3) then
			return true
		end
	end

	if arg_19_0 >= arg_19_4.x and arg_19_0 <= arg_19_5.x and arg_19_1 >= arg_19_4.z and arg_19_1 <= arg_19_5.z then
		return true
	end

	for iter_19_2 = 1, 4 do
		local var_19_5 = var_19_4[iter_19_2]
		local var_19_6 = var_19_4[iter_19_2 % 4 + 1]

		if var_0_5.lineIntersectsEllipse(var_19_5[1], var_19_5[2], var_19_6[1], var_19_6[2], arg_19_0, arg_19_1, arg_19_2, arg_19_3) then
			return true
		end
	end

	return false
end
