local var_0_0 = class("EquipmentSkinLayer", import("..base.BaseUI"))

var_0_0.DISPLAY = 1
var_0_0.REPLACE = 2

function var_0_0.getUIName(arg_1_0)
	return "EquipmentSkinInfoUI"
end

function var_0_0.setShip(arg_2_0, arg_2_1)
	arg_2_0.shipVO = arg_2_1
end

function var_0_0.init(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)

	arg_3_0.displayPanel = arg_3_0._tf:Find("display")

	setActive(arg_3_0.displayPanel, false)

	arg_3_0.displayActions = arg_3_0.displayPanel:Find("actions")
	arg_3_0.skinViewOnShipTF = arg_3_0._tf:Find("replace/equipment_on_ship")
	arg_3_0.skinViewTF = arg_3_0._tf:Find("replace/equipment")
	arg_3_0.replacePanel = arg_3_0._tf:Find("replace")

	setActive(arg_3_0.replacePanel, false)
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf, function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SOUND_BACK)
	onButton(arg_4_0, arg_4_0._tf:Find("display/top/btnBack"), function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0.replacePanel:Find("actions/cancel_button"), function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.replacePanel:Find("actions/action_button_2"), function()
		if not arg_4_0.contextData.oldShipInfo then
			arg_4_0:emit(EquipmentSkinMediator.ON_EQUIP)
		else
			arg_4_0:emit(EquipmentSkinMediator.ON_EQUIP_FORM_SHIP)
		end
	end, SFX_PANEL)

	local var_4_0 = arg_4_0.contextData.mode or var_0_0.DISPLAY

	if var_4_0 == var_0_0.REPLACE and arg_4_0.shipVO then
		arg_4_0:initReplace()
	elseif var_4_0 == var_0_0.DISPLAY then
		arg_4_0:initDisplay()
	end
end

function var_0_0.initDisplay(arg_9_0)
	setActive(arg_9_0.displayPanel, true)
	setActive(arg_9_0.replacePanel, false)

	if arg_9_0.shipVO then
		arg_9_0:initDisplay4Ship()
	else
		eachChild(arg_9_0.displayActions, function(arg_10_0)
			local var_10_0 = arg_10_0.gameObject.name == "confirm"

			setActive(arg_10_0, var_10_0)

			if var_10_0 then
				onButton(arg_9_0, arg_10_0, function()
					arg_9_0:emit(var_0_0.ON_CLOSE)
				end, SFX_PANEL)
			end
		end)
	end

	arg_9_0:updateSkinView(arg_9_0.displayPanel, arg_9_0.contextData.skinId)
end

function var_0_0.initDisplay4Ship(arg_12_0)
	eachChild(arg_12_0.displayActions, function(arg_13_0)
		local var_13_0 = arg_13_0.gameObject.name

		setActive(arg_13_0, var_13_0 ~= "confirm")
		onButton(arg_12_0, arg_13_0, function()
			if var_13_0 == "unload" then
				arg_12_0:emit(EquipmentSkinMediator.ON_UNEQUIP)
			elseif var_13_0 == "replace" then
				arg_12_0:emit(EquipmentSkinMediator.ON_SELECT)
			end
		end, SFX_PANEL)
	end)
end

function var_0_0.initReplace(arg_15_0)
	setActive(arg_15_0.displayPanel, false)
	setActive(arg_15_0.replacePanel, true)

	local var_15_0 = arg_15_0.contextData.pos
	local var_15_1 = arg_15_0.shipVO:getEquipSkin(var_15_0) or 0
	local var_15_2 = arg_15_0.contextData.skinId

	arg_15_0:updateSkinView(arg_15_0.skinViewOnShipTF, var_15_1)

	if arg_15_0.contextData.oldShipInfo then
		local var_15_3 = arg_15_0.contextData.oldShipInfo

		arg_15_0:updateSkinView(arg_15_0.skinViewTF, var_15_2, var_15_3)
	else
		arg_15_0:updateSkinView(arg_15_0.skinViewTF, var_15_2)
	end
end

function var_0_0.updateSkinView(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_2 ~= 0
	local var_16_1 = arg_16_1:Find("empty")
	local var_16_2 = arg_16_1:Find("info")

	if var_16_1 then
		setActive(var_16_1, not var_16_0)
	end

	setActive(var_16_2, var_16_0)

	arg_16_1:GetComponent(typeof(Image)).enabled = var_16_0

	if var_16_0 then
		local var_16_3 = pg.equip_skin_template[arg_16_2]

		assert(var_16_3, "miss config equip_skin_template >> " .. arg_16_2)

		local var_16_4 = arg_16_1:Find("info/display_panel/name_container/name"):GetComponent(typeof(Text))
		local var_16_5 = arg_16_1:Find("info/display_panel/desc"):GetComponent(typeof(Text))

		var_16_4.text = var_16_3.name
		var_16_5.text = var_16_3.desc

		local var_16_6 = _.map(var_16_3.equip_type, function(arg_17_0)
			return EquipType.Type2Name2(arg_17_0)
		end)

		setScrollText(arg_16_1:Find("info/display_panel/equip_type/mask/Text"), table.concat(var_16_6, ","))

		local var_16_7 = arg_16_1:Find("info/play_btn")

		setActive(var_16_7, true)
		onButton(arg_16_0, var_16_7, function()
			arg_16_0:emit(EquipmentSkinMediator.ON_PREVIEW, arg_16_2)
		end, SFX_PANEL)
		updateDrop(arg_16_1:Find("info/equip"), Drop.New({
			type = DROP_TYPE_EQUIPMENT_SKIN,
			id = arg_16_2
		}))

		local var_16_8 = arg_16_1:Find("info/head")

		if var_16_8 then
			setActive(var_16_8, arg_16_3)

			if arg_16_3 then
				assert(arg_16_3.id, "old ship id is nil")
				assert(arg_16_3.pos, "old ship pos is nil")

				local var_16_9 = getProxy(BayProxy):getShipById(arg_16_3.id)

				if var_16_9 then
					setImageSprite(var_16_8:Find("Image"), LoadSprite("qicon/" .. var_16_9:getPainting()))
				end
			end
		end
	end
end

function var_0_0.willExit(arg_19_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_19_0._tf, arg_19_0.UIMain)
end

return var_0_0
