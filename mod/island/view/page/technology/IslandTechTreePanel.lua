local var_0_0 = class("IslandTechTreePanel", import("view.base.BaseSubView"))

var_0_0.VIEW_PADDING = 200
var_0_0.ELEMENT_SIZE = {
	x = 410,
	y = 180
}
var_0_0.LINE_TYPE = {
	C2 = 3,
	S = 1,
	C1 = 2
}
var_0_0.DEFAULT_MAX_Y = 10

function var_0_0.getUIName(arg_1_0)
	return "IslandTechTreePanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.treeView = arg_2_0._tf:Find("view")
	arg_2_0.showContent = arg_2_0.treeView:Find("content")
	arg_2_0.debugContainer = arg_2_0.showContent:Find("debug")
	arg_2_0.itemUIList = UIItemList.New(arg_2_0.showContent:Find("items"), arg_2_0.showContent:Find("items/tpl"))
	arg_2_0.lineContainer = arg_2_0.showContent:Find("lines")
	arg_2_0.lineTpls = {
		[var_0_0.LINE_TYPE.S] = arg_2_0._tf:Find("line_tpls/s"),
		[var_0_0.LINE_TYPE.C1] = arg_2_0._tf:Find("line_tpls/c1"),
		[var_0_0.LINE_TYPE.C2] = arg_2_0._tf:Find("line_tpls/c2")
	}
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.itemUIList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateItem(arg_4_1, arg_4_2)
		end
	end)

	arg_3_0.lineDatas = {}
	arg_3_0.displays = pg.island_technology_template.get_id_list_by_tech_belong[arg_3_0.contextData.type]
	arg_3_0.maxX, arg_3_0.maxY = 0, 0

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.displays) do
		local var_3_0 = pg.island_technology_template[iter_3_1].axis

		arg_3_0.maxX = math.max(arg_3_0.maxX, var_3_0[1])
		arg_3_0.maxY = math.max(arg_3_0.maxY, var_3_0[2])
	end

	arg_3_0.maxX = arg_3_0.maxX + 1
	arg_3_0.maxY = math.max(var_0_0.DEFAULT_MAX_Y, arg_3_0.maxY + 1)

	arg_3_0:InitTreeCS(arg_3_0.maxX, arg_3_0.maxY)
end

function var_0_0.UpdateItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.displays[arg_5_1 + 1]

	arg_5_2.name = var_5_0

	local var_5_1 = arg_5_0.techAgency:GetTechnology(var_5_0)

	setAnchoredPosition(arg_5_2, arg_5_0:GetPositionById(var_5_1.id))
	setActive(arg_5_2:Find("selected"), false)
	setText(arg_5_2:Find("name"), var_5_1:getConfig("tech_name"))

	local var_5_2 = var_5_1:GetStatus()
	local var_5_3 = var_5_2 == IslandTechnology.STATUS.FINISHED

	setTextColor(arg_5_2:Find("name"), Color.NewHex(var_5_3 and "1b3650" or "ffffff"))
	LoadImageSpriteAsync("island/IslandTechnology/" .. var_5_1:getConfig("tech_icon"), arg_5_2:Find("icon"), true)
	setImageColor(arg_5_2:Find("icon"), Color.NewHex(var_5_3 and "455a81" or "ffffff"))
	setActive(arg_5_2:Find("icon"), var_5_2 ~= IslandTechnology.STATUS.STUDYING and var_5_2 ~= IslandTechnology.STATUS.RECEIVE)
	eachChild(arg_5_2:Find("back"), function(arg_6_0)
		setActive(arg_6_0, arg_6_0.name == var_5_2)
	end)
	setActive(arg_5_2:Find("back/normal"), not var_5_3 and var_5_2 ~= IslandTechnology.STATUS.STUDYING)
	eachChild(arg_5_2:Find("front"), function(arg_7_0)
		setActive(arg_7_0, arg_7_0.name == var_5_2)
	end)
	onButton(arg_5_0, arg_5_2, function()
		local var_8_0 = arg_5_0._tf:InverseTransformPoint(arg_5_2.position)

		existCall(arg_5_0.contextData.onItemClick, var_5_1.id, var_8_0)
	end, SFX_PANEL)
end

function var_0_0.Show(arg_9_0)
	arg_9_0.super.Show(arg_9_0)
	arg_9_0:Flush()
end

function var_0_0.Flush(arg_10_0)
	arg_10_0.techAgency = getProxy(IslandProxy):GetIsland():GetTechnologyAgency()

	arg_10_0.itemUIList:align(#arg_10_0.displays)
end

function var_0_0.InitTreeCS(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.gridSize = {
		x = var_0_0.ELEMENT_SIZE.x / 2,
		y = var_0_0.ELEMENT_SIZE.y / 2
	}

	setSizeDelta(arg_11_0.showContent, {
		x = arg_11_0.gridSize.x * arg_11_1 + var_0_0.VIEW_PADDING,
		y = arg_11_0.gridSize.y * arg_11_2
	})

	arg_11_0.idx2pos = {}

	for iter_11_0 = 0, arg_11_1 do
		for iter_11_1 = 0, arg_11_2 do
			local var_11_0 = iter_11_0 .. "_" .. iter_11_1

			arg_11_0.idx2pos[var_11_0] = {
				x = arg_11_0.gridSize.x * iter_11_0,
				y = -arg_11_0.gridSize.y * iter_11_1
			}

			local var_11_1 = cloneTplTo(arg_11_0.debugContainer:Find("tpl"), arg_11_0.debugContainer)

			var_11_1.name = var_11_0

			setLocalPosition(var_11_1, arg_11_0.idx2pos[var_11_0])
		end
	end

	for iter_11_2, iter_11_3 in pairs(arg_11_0:GetTechTreeLineData()) do
		for iter_11_4, iter_11_5 in ipairs(iter_11_3) do
			arg_11_0:UpdateLineTpl(iter_11_2, iter_11_5)
		end
	end
end

function var_0_0.GetPositionById(arg_12_0, arg_12_1)
	local var_12_0 = pg.island_technology_template[arg_12_1].axis

	return {
		x = arg_12_0.gridSize.x * var_12_0[1],
		y = -arg_12_0.gridSize.y * var_12_0[2]
	}
end

function var_0_0.UpdateLineTpl(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0:GetPositionById(arg_13_1)
	local var_13_1 = arg_13_0:GetPositionById(arg_13_2)
	local var_13_2 = arg_13_0:GetLineOutPutPos(var_13_0)
	local var_13_3 = arg_13_0:GetLineInPutPos(var_13_1)

	if var_13_0.y == var_13_1.y then
		local var_13_4 = cloneTplTo(arg_13_0.lineTpls[var_0_0.LINE_TYPE.S], arg_13_0.lineContainer)

		setLocalPosition(var_13_4, var_13_2)
		setSizeDelta(var_13_4, {
			x = var_13_3.x - var_13_2.x,
			y = var_13_4.sizeDelta.y
		})
	else
		local var_13_5 = math.abs(var_13_3.y - var_13_2.y)
		local var_13_6 = var_13_5 <= var_0_0.ELEMENT_SIZE.y / 2 and var_0_0.LINE_TYPE.C1 or var_0_0.LINE_TYPE.C2
		local var_13_7 = cloneTplTo(arg_13_0.lineTpls[var_13_6], arg_13_0.lineContainer)

		setLocalScale(var_13_7, {
			y = var_13_1.y > var_13_0.y and -1 or 1
		})
		setLocalPosition(var_13_7, var_13_2)
		setSizeDelta(var_13_7, {
			x = var_13_3.x - var_13_2.x,
			y = var_13_5 + 6
		})
	end
end

function var_0_0.GetLineOutPutPos(arg_14_0, arg_14_1)
	return {
		x = arg_14_1.x + 205,
		y = arg_14_1.y
	}
end

function var_0_0.GetLineInPutPos(arg_15_0, arg_15_1)
	return {
		x = arg_15_1.x - 210,
		y = arg_15_1.y
	}
end

function var_0_0.GetTechTreeLineData(arg_16_0)
	local var_16_0 = pg.island_technology_template
	local var_16_1 = {}

	for iter_16_0, iter_16_1 in ipairs(var_16_0.get_id_list_by_tech_belong[arg_16_0.contextData.type]) do
		local var_16_2 = var_16_0[iter_16_1]

		for iter_16_2, iter_16_3 in ipairs(var_16_2.ex_tech) do
			assert(var_16_0[iter_16_3], "配置了不存在的ex_tech: " .. iter_16_3)

			if not var_16_1[iter_16_3] then
				var_16_1[iter_16_3] = {}
			end

			if not table.contains(var_16_1[iter_16_3], iter_16_1) then
				table.insert(var_16_1[iter_16_3], iter_16_1)
			end
		end

		if not var_16_1[iter_16_1] then
			var_16_1[iter_16_1] = {}
		end

		var_16_1[iter_16_1] = table.mergeArray(var_16_1[iter_16_1], var_16_2.next_tech, true)

		local var_16_3 = var_16_2.axis[1]

		for iter_16_4, iter_16_5 in ipairs(var_16_1[iter_16_1]) do
			assert(var_16_0[iter_16_5], "配置了不存在的next_tech: " .. iter_16_5)

			local var_16_4 = var_16_0[iter_16_5].axis[1]

			assert(var_16_4 - var_16_3 > 2, string.format("岛屿科技树框体点位间隔过近,请检查配置: %d->%d", iter_16_1, iter_16_5))
		end
	end

	return var_16_1
end

function var_0_0.OnDestroy(arg_17_0)
	return
end

return var_0_0
