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
var_0_0.EDGE_X = 2
var_0_0.EDGE_Y = 1
var_0_0.FocusPriorities = {
	IslandTechnology.STATUS.RECEIVE,
	IslandTechnology.STATUS.STUDYING,
	IslandTechnology.STATUS.NORMAL,
	IslandTechnology.STATUS.LOCK,
	IslandTechnology.STATUS.FINISHED
}

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

	arg_3_0.maxX = arg_3_0.maxX + var_0_0.EDGE_X
	arg_3_0.maxY = math.max(var_0_0.DEFAULT_MAX_Y, arg_3_0.maxY + var_0_0.EDGE_Y)
end

function var_0_0.UpdateItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.displays[arg_5_1 + 1]

	arg_5_2.name = var_5_0

	local var_5_1 = arg_5_0.techAgency:GetTechnology(var_5_0)

	setAnchoredPosition(arg_5_2, arg_5_0:GetPositionById(var_5_1.id))
	setActive(arg_5_2:Find("selected"), false)
	var_0_0.SetTechName(arg_5_2:Find("name"), var_5_1:getConfig("tech_name"))

	local var_5_2 = var_5_1:GetStatus()
	local var_5_3 = var_5_2 == IslandTechnology.STATUS.FINISHED

	setTextColor(arg_5_2:Find("name/Text"), Color.NewHex(var_5_3 and "1b3650" or "ffffff"))
	setTextColor(arg_5_2:Find("name/ScrollText"), Color.NewHex(var_5_3 and "1b3650" or "ffffff"))
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
	arg_9_0:AutoFocus()
end

function var_0_0.Flush(arg_10_0)
	arg_10_0.techAgency = getProxy(IslandProxy):GetIsland():GetTechnologyAgency()

	if not arg_10_0.idx2pos then
		arg_10_0:InitTreeCS(arg_10_0.maxX, arg_10_0.maxY)
	end

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

	for iter_11_0, iter_11_1 in pairs(arg_11_0:GetTechTreeLineData()) do
		for iter_11_2, iter_11_3 in ipairs(iter_11_1) do
			arg_11_0:UpdateLineTpl(iter_11_0, iter_11_3)
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
		local var_16_3 = {}

		for iter_16_2, iter_16_3 in ipairs(var_16_2.sys_unlock) do
			if iter_16_3[1] == IslandTechnology.UNLOCK_TYPE.FINISH_TECHNOLOGY then
				table.insert(var_16_3, iter_16_3[2])
			end
		end

		for iter_16_4, iter_16_5 in ipairs(var_16_3) do
			assert(var_16_0[iter_16_5], iter_16_1 .. "科研配置了不存在的前置科研id: " .. iter_16_5)

			if var_16_0[iter_16_5].tech_belong == arg_16_0.contextData.type then
				if not var_16_1[iter_16_5] then
					var_16_1[iter_16_5] = {}
				end

				if not table.contains(var_16_1[iter_16_5], iter_16_1) then
					table.insert(var_16_1[iter_16_5], iter_16_1)
				end
			end
		end
	end

	return var_16_1
end

function var_0_0.AutoFocus(arg_17_0)
	local var_17_0 = arg_17_0:GetFocusTechId()
	local var_17_1 = math.max(arg_17_0:GetPositionById(var_17_0).x - var_0_0.ELEMENT_SIZE.x / 2, 0)

	scrollTo(arg_17_0.treeView, var_17_1 / arg_17_0.showContent.rect.width, 0)
end

function var_0_0.GetFocusTechId(arg_18_0)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.displays) do
		local var_18_1 = arg_18_0.techAgency:GetTechnology(iter_18_1):GetStatus()

		if not var_18_0[var_18_1] then
			var_18_0[var_18_1] = {}
		end

		table.insert(var_18_0[var_18_1], iter_18_1)
	end

	for iter_18_2, iter_18_3 in ipairs(var_0_0.FocusPriorities) do
		local var_18_2 = var_18_0[iter_18_3]

		if var_18_2 and #var_18_2 > 0 then
			table.sort(var_18_2, CompareFuncs({
				function(arg_19_0)
					return arg_18_0:GetPositionById(arg_19_0).x
				end,
				function(arg_20_0)
					return arg_20_0
				end
			}))

			return var_18_2[1]
		end
	end

	return arg_18_0.displays[1]
end

function var_0_0.OnDestroy(arg_21_0)
	return
end

function var_0_0.SetTechName(arg_22_0, arg_22_1)
	local var_22_0 = GetPerceptualSize(arg_22_1)

	GetComponent(arg_22_0:Find("Text"), typeof(Text)).fontSize = var_22_0 > 8 and 28 or 32

	setActive(arg_22_0:Find("Text"), var_22_0 <= 10)
	setActive(arg_22_0:Find("ScrollText"), var_22_0 > 10)

	if var_22_0 > 10 then
		setScrollText(arg_22_0:Find("ScrollText"), arg_22_1)
	else
		setText(arg_22_0:Find("Text"), arg_22_1)
	end
end

return var_0_0
