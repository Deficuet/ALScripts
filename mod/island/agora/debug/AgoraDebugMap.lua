local var_0_0 = class("AgoraDebugMap", import("Mod.Island.Core.View.IslandBaseOpView"))
local var_0_1 = Color.New(1, 0, 0, 1)
local var_0_2 = Color.New(0, 1, 0, 1)

function var_0_0.GetUIName(arg_1_0)
	return "IslandAgoraDebugUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0._go = arg_2_1

	setParent(arg_2_1, pg.UIMgr.GetInstance().UIMain)

	arg_2_0.tpl = arg_2_1.transform:Find("Image")
	arg_2_0.items = {}
	arg_2_0.isInited = false

	arg_2_0:GenMap(arg_2_0.view.agora.map)
end

function var_0_0.GenMap(arg_3_0, arg_3_1)
	local var_3_0 = {}
	local var_3_1 = 0

	for iter_3_0, iter_3_1 in pairs(arg_3_1) do
		for iter_3_2, iter_3_3 in pairs(iter_3_1) do
			table.insert(var_3_0, function(arg_4_0)
				var_3_1 = var_3_1 + 1

				if arg_3_0.exited then
					arg_4_0()

					return
				end

				arg_3_0:CreateItem({
					position = Vector2(iter_3_0, iter_3_2),
					flag = iter_3_3
				})

				if var_3_1 % 50 == 0 then
					onNextTick(arg_4_0)
				else
					arg_4_0()
				end
			end)
		end
	end

	seriesAsync(var_3_0, function()
		arg_3_0.isInited = true

		arg_3_0:FlushAll(arg_3_1)
	end)
end

function var_0_0.FlushAll(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in pairs(arg_6_1) do
		for iter_6_2, iter_6_3 in pairs(iter_6_1) do
			arg_6_0:UpdateItem(Vector2(iter_6_0, iter_6_2), iter_6_3)
		end
	end
end

function var_0_0.CreateItem(arg_7_0, arg_7_1)
	local var_7_0 = cloneTplTo(arg_7_0.tpl, arg_7_0.tpl.transform.parent)

	var_7_0.name = arg_7_1.position.x .. "_" .. arg_7_1.position.y

	local var_7_1 = Vector3(10, 10, 0)

	var_7_0.transform.localPosition = Vector3(arg_7_1.position.x * var_7_1.x, arg_7_1.position.y * var_7_1.y, 0)

	if not arg_7_0.items[arg_7_1.position.x] then
		arg_7_0.items[arg_7_1.position.x] = {}
	end

	arg_7_0.items[arg_7_1.position.x][arg_7_1.position.y] = var_7_0
end

function var_0_0.UpdateItem(arg_8_0, arg_8_1, arg_8_2)
	if not arg_8_0.isInited then
		return
	end

	arg_8_0.items[arg_8_1.x][arg_8_1.y]:GetComponent(typeof(Image)).color = arg_8_2 and var_0_2 or var_0_1
end

function var_0_0.OnDestroy(arg_9_0)
	arg_9_0.exited = true
end

return var_0_0
