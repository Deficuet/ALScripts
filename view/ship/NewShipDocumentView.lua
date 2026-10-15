local var_0_0 = class("NewShipDocumentView", import("..base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "NewShipDocumentView"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = arg_2_0.contextData.ship

	if var_2_1 then
		local var_2_2 = var_2_1:getMaxConfigId()
		local var_2_3 = pg.ship_data_template[var_2_2]

		_.each(var_2_3.buff_list_display, function(arg_3_0)
			local var_3_0 = getSkillConfig(arg_3_0)
			local var_3_1 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.ShipSkillIcon, var_3_0.icon)

			table.insert(var_2_0, var_3_1)
		end)
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddListener()
	setActive(arg_4_0._tf, true)
	LeanTween.move(rtf(arg_4_0._tf), Vector3(-30, 0, 0), 0.3)
end

function var_0_0.OnDestroy(arg_5_0)
	arg_5_0._shipVO = nil
	arg_5_0.confirmFunc = nil
end

function var_0_0.InitUI(arg_6_0)
	arg_6_0.skillContainer = arg_6_0._tf:Find("bg/skill_panel/frame/skill_list/viewport")
	arg_6_0.skillTpl = arg_6_0:getTpl("bg/skill_panel/frame/skilltpl", arg_6_0._tf)
	arg_6_0.emptyTpl = arg_6_0:getTpl("bg/skill_panel/frame/emptytpl", arg_6_0._tf)
	arg_6_0.addTpl = arg_6_0:getTpl("bg/skill_panel/frame/addtpl", arg_6_0._tf)
end

function var_0_0.AddListener(arg_7_0)
	onButton(arg_7_0, arg_7_0._tf:Find("qr_btn"), function()
		arg_7_0.confirmFunc()
	end, SFX_CONFIRM)
end

function var_0_0.initSkills(arg_9_0)
	local var_9_0 = arg_9_0._shipVO:getMaxConfigId()
	local var_9_1 = pg.ship_data_template[var_9_0]
	local var_9_2 = 1

	for iter_9_0, iter_9_1 in ipairs(var_9_1.buff_list_display) do
		local var_9_3 = getSkillConfig(iter_9_1)
		local var_9_4 = arg_9_0._shipVO.skills
		local var_9_5

		if var_9_4[iter_9_1] then
			var_9_5 = cloneTplTo(arg_9_0.skillTpl, arg_9_0.skillContainer)

			onButton(arg_9_0, var_9_5, function()
				arg_9_0:emit(NewShipMediator.ON_SKILLINFO, var_9_3.id, var_9_4[iter_9_1])
			end, SFX_PANEL)
		else
			var_9_5 = cloneTplTo(arg_9_0.emptyTpl, arg_9_0.skillContainer)

			setActive(var_9_5:Find("mask"), true)
			onButton(arg_9_0, var_9_5, function()
				arg_9_0:emit(NewShipMediator.ON_SKILLINFO, var_9_3.id)
			end, SFX_PANEL)
		end

		var_9_2 = var_9_2 + 1

		LoadImageSpriteAsync("skillicon/" .. var_9_3.icon, findTF(var_9_5, "icon"))
	end

	for iter_9_2 = var_9_2, 3 do
		cloneTplTo(arg_9_0.addTpl, arg_9_0.skillContainer)
	end
end

function var_0_0.UpdatePropertyPanel(arg_12_0)
	arg_12_0.propertyPanel = PropertyPanel.New(arg_12_0._tf:Find("bg/property_panel/frame"))

	arg_12_0.propertyPanel:initProperty(arg_12_0._shipVO.configId)
end

function var_0_0.getTpl(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_2:Find(arg_13_1)

	var_13_0:SetParent(arg_13_0._tf, false)
	SetActive(var_13_0, false)

	return var_13_0
end

function var_0_0.SetParams(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0._shipVO = arg_14_1
	arg_14_0.confirmFunc = arg_14_2
end

function var_0_0.RefreshUI(arg_15_0)
	arg_15_0:initSkills()
	arg_15_0:UpdatePropertyPanel()
end

return var_0_0
