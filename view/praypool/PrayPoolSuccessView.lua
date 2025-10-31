local var_0_0 = class("PrayPoolSuccessView", import("..base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "PrayPoolSuccessView"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:updateUI()
	arg_2_0:Show()
end

function var_0_0.OnDestroy(arg_3_0)
	arg_3_0.buildMsgBox:hide()
end

function var_0_0.OnBackPress(arg_4_0)
	if arg_4_0:GetLoaded() and isActive(arg_4_0.boxTF) then
		arg_4_0.buildMsgBox:hide()

		return true
	end
end

function var_0_0.initData(arg_5_0)
	arg_5_0.prayProxy = getProxy(PrayProxy)
	arg_5_0.poolType = arg_5_0.prayProxy:getSelectedPoolType()
	arg_5_0.playerProxy = getProxy(PlayerProxy)
	arg_5_0.bagProxy = getProxy(BagProxy)
	arg_5_0.useItem = pg.ship_data_create_material[1].use_item

	print("useitem " .. arg_5_0.useItem)

	arg_5_0.buildShipProxy = getProxy(BuildShipProxy)
end

function var_0_0.initUI(arg_6_0)
	arg_6_0.shipTF = {
		arg_6_0._tf:Find("Ship1"),
		(arg_6_0._tf:Find("Ship2"))
	}
	arg_6_0.shipRarityTF = {
		arg_6_0._tf:Find("Rarity1"),
		(arg_6_0._tf:Find("Rarity2"))
	}
	arg_6_0.boxTF = arg_6_0._tf:Find("build_msg")
	arg_6_0.buildMsgBox = var_0_0.MsgBox(arg_6_0.boxTF)
	arg_6_0.buildBtn = arg_6_0._tf:Find("BuildBtn")
	arg_6_0.buildCubeNumText = arg_6_0._tf:Find("BuildInfo/CubeNum")
	arg_6_0.buildGoldNumText = arg_6_0._tf:Find("BuildInfo/GoldNum")
	arg_6_0.curCubeNumText = arg_6_0._tf:Find("CubeImg/NumText")
	arg_6_0.material1 = arg_6_0._tf:Find("material1")
	arg_6_0.material2 = arg_6_0._tf:Find("material2")
	arg_6_0.ratioSpriteMap = {}

	local var_6_0 = arg_6_0._tf:Find("Ratio")

	for iter_6_0 = 2, 6 do
		local var_6_1 = getImageSprite(arg_6_0._tf:Find(tostring(iter_6_0), var_6_0))

		arg_6_0.ratioSpriteMap[iter_6_0] = var_6_1
	end

	arg_6_0.raritySpriteMap = {
		Normal = {
			Light1 = getImageSprite(arg_6_0._tf:Find("Light/Normal/Light1")),
			Light2 = getImageSprite(arg_6_0._tf:Find("Light/Normal/Light2")),
			Light2_2 = getImageSprite(arg_6_0._tf:Find("Light/Normal/Light2_2")),
			Light3 = getImageSprite(arg_6_0._tf:Find("Light/Normal/Light3")),
			RarityBG = getImageSprite(arg_6_0._tf:Find("RarityBG/Normal"))
		},
		UR = {
			Light1 = getImageSprite(arg_6_0._tf:Find("Light/UR/Light1")),
			Light2 = getImageSprite(arg_6_0._tf:Find("Light/UR/Light2")),
			Light2_2 = getImageSprite(arg_6_0._tf:Find("Light/UR/Light2_2")),
			Light3 = getImageSprite(arg_6_0._tf:Find("Light/UR/Light3")),
			RarityBG = getImageSprite(arg_6_0._tf:Find("RarityBG/UR"))
		}
	}

	onButton(arg_6_0, arg_6_0.buildBtn, function()
		local var_7_0 = pg.ship_data_create_material[pg.activity_ship_create[arg_6_0.poolType].create_id]
		local var_7_1 = arg_6_0.playerProxy:getData()
		local var_7_2 = arg_6_0.bagProxy:getItemCountById(arg_6_0.useItem)
		local var_7_3 = arg_6_0.buildShipProxy:getRawData()
		local var_7_4 = table.getCount(var_7_3)
		local var_7_5 = _.min({
			math.floor(var_7_1.gold / var_7_0.use_gold),
			math.floor(var_7_2 / var_7_0.number_1),
			MAX_BUILD_WORK_COUNT - var_7_4
		})
		local var_7_6 = math.max(1, var_7_5)

		local function var_7_7(arg_8_0)
			if arg_8_0 > var_7_6 or var_7_1.gold < arg_8_0 * var_7_0.use_gold or var_7_2 < arg_8_0 * var_7_0.number_1 then
				return false
			end

			return true
		end

		arg_6_0.buildMsgBox:show(var_7_6, var_7_7, function(arg_9_0)
			arg_6_0:emit(PrayPoolConst.START_BUILD_SHIP_EVENT, var_7_0.id, arg_9_0, 0)
		end, function(arg_10_0)
			local var_10_0 = arg_10_0 * var_7_0.use_gold
			local var_10_1 = arg_10_0 * var_7_0.number_1
			local var_10_2 = var_7_7(arg_10_0) and COLOR_GREEN or COLOR_RED

			return i18n("build_ship_tip", arg_10_0, var_7_0.name, var_10_0, var_10_1, var_10_2)
		end)
	end, SFX_UI_BUILDING_STARTBUILDING)
end

function var_0_0.updateUI(arg_11_0)
	local var_11_0 = arg_11_0.prayProxy:getSelectedShipIDList()

	arg_11_0:updatePaint(var_11_0)

	local var_11_1
	local var_11_2 = arg_11_0.bagProxy:getItemById(arg_11_0.useItem) or {
		count = 0
	}

	setText(arg_11_0.curCubeNumText, var_11_2.count)

	local var_11_3 = pg.ship_data_create_material[pg.activity_ship_create[arg_11_0.poolType].create_id]

	setText(arg_11_0.buildCubeNumText, var_11_3.number_1)
	setText(arg_11_0.buildGoldNumText, var_11_3.use_gold)
end

function var_0_0.updatePaint(arg_12_0, arg_12_1)
	for iter_12_0 = 1, 2 do
		local var_12_0 = arg_12_1[iter_12_0]
		local var_12_1 = pg.ship_data_statistics[var_12_0].name
		local var_12_2 = pg.ship_data_statistics[var_12_0].english_name
		local var_12_3 = pg.ship_data_statistics[var_12_0].rarity
		local var_12_4 = var_12_3 == ShipRarity.SSR
		local var_12_5 = arg_12_0.shipTF[iter_12_0]
		local var_12_6 = var_12_5:Find("Mask/Paint")

		local function var_12_7()
			local var_13_0 = var_12_6:Find("fitter"):GetChild(0)
			local var_13_1 = GetComponent(var_13_0, "MeshImage")
			local var_13_2 = (iter_12_0 == 2 and arg_12_0.material2 or arg_12_0.material1):GetComponent(typeof(Image)).material

			var_13_2:SetFloat("_Range", iter_12_0 == 2 and 0.9 or -0.57)
			var_13_2:SetFloat("_Degree", iter_12_0 == 2 and -50 or 50)

			var_13_1.material = var_13_2
		end

		setPaintingPrefabAsync(var_12_6, Ship.getPaintingName(var_12_0), "build", var_12_7)

		local var_12_8 = var_12_5:Find("Light1")
		local var_12_9 = var_12_5:Find("Light2")
		local var_12_10 = var_12_9:Find("Light2_2")
		local var_12_11 = var_12_5:Find("Light3")

		if not var_12_4 then
			setImageSprite(var_12_8, arg_12_0.raritySpriteMap.Normal.Light1)
			setImageSprite(var_12_9, arg_12_0.raritySpriteMap.Normal.Light2)
			setImageSprite(var_12_10, arg_12_0.raritySpriteMap.Normal.Light2_2)
			setImageSprite(var_12_11, arg_12_0.raritySpriteMap.Normal.Light3)
			setImageColor(var_12_8, var_0_0.Rarity_To_Light_Color_1[var_12_3])
			setImageColor(var_12_9, var_0_0.Rarity_To_Light_Color_1[var_12_3])
			setImageColor(var_12_10, var_0_0.Rarity_To_Light_Color_1[var_12_3])
			setImageColor(var_12_11, var_0_0.Rarity_To_Light_Color_2[var_12_3])
		else
			setImageSprite(var_12_8, arg_12_0.raritySpriteMap.UR.Light1)
			setImageSprite(var_12_9, arg_12_0.raritySpriteMap.UR.Light2)
			setImageSprite(var_12_10, arg_12_0.raritySpriteMap.UR.Light2_2)
			setImageSprite(var_12_11, arg_12_0.raritySpriteMap.UR.Light3)
		end

		local var_12_12 = arg_12_0.shipRarityTF[iter_12_0]
		local var_12_13 = var_12_4 and arg_12_0.raritySpriteMap.UR.RarityBG or arg_12_0.raritySpriteMap.Normal.RarityBG

		setImageSprite(var_12_12, var_12_13)

		local var_12_14 = var_12_5:Find("NameText")

		setText(var_12_14, var_12_1)

		local var_12_15 = var_12_5:Find("NameEngText")

		setText(var_12_15, var_12_2)

		local var_12_16 = var_12_12:Find("NumImg")

		setImageSprite(var_12_16, arg_12_0.ratioSpriteMap[var_12_3], true)
	end
end

function var_0_0.MsgBox(arg_14_0)
	local var_14_0 = {
		_go = arg_14_0
	}

	var_14_0.__cname = "buildmsgbox"
	var_14_0._tf = tf(arg_14_0)
	var_14_0.inited = false
	var_14_0.cancenlBtn = findTF(var_14_0._go, "window/btns/cancel_btn")
	var_14_0.confirmBtn = findTF(var_14_0._go, "window/btns/confirm_btn")
	var_14_0.closeBtn = findTF(var_14_0._go, "window/close_btn")
	var_14_0.count = 1
	var_14_0.minusBtn = findTF(var_14_0._go, "window/content/calc_panel/minus")
	var_14_0.addBtn = findTF(var_14_0._go, "window/content/calc_panel/add")
	var_14_0.maxBtn = findTF(var_14_0._go, "window/content/max")
	var_14_0.valueTxt = findTF(var_14_0._go, "window/content/calc_panel/Text"):GetComponent(typeof(Text))
	var_14_0.text = findTF(var_14_0._go, "window/content/Text"):GetComponent(typeof(Text))
	var_14_0.buildUI = arg_14_0.parent
	var_14_0.active = false

	pg.DelegateInfo.New(var_14_0)
	setText(findTF(var_14_0.cancenlBtn, "Image/Image (1)"), i18n("text_cancel"))
	setText(findTF(var_14_0.confirmBtn, "Image/Image (1)"), i18n("text_confirm"))

	local function var_14_1(arg_15_0, arg_15_1)
		var_14_0.valueTxt.text = arg_15_0

		if arg_15_1 then
			local var_15_0 = arg_15_1(arg_15_0)

			var_14_0.text.text = var_15_0
		else
			var_14_0.text.text = ""
		end
	end

	function var_14_0.init(arg_16_0)
		arg_16_0.inited = true

		onButton(arg_16_0, arg_16_0._tf, function()
			arg_16_0:hide()
		end, SFX_PANEL)
		onButton(arg_16_0, arg_16_0.cancenlBtn, function()
			arg_16_0:hide()
		end, SFX_PANEL)
		onButton(arg_16_0, arg_16_0.confirmBtn, function()
			if arg_16_0.onConfirm then
				arg_16_0.onConfirm(arg_16_0.count)
			end

			arg_16_0:hide()
		end, SFX_PANEL)
		onButton(arg_16_0, arg_16_0.closeBtn, function()
			arg_16_0:hide()
		end, SFX_PANEL)
		onButton(arg_16_0, arg_16_0.minusBtn, function()
			if arg_16_0:verifyCount(arg_16_0.count - 1) then
				arg_16_0.count = math.max(arg_16_0.count - 1, 1)

				var_14_1(arg_16_0.count, arg_16_0.updateText)
			end
		end, SFX_PANEL)
		onButton(arg_16_0, arg_16_0.addBtn, function()
			if arg_16_0:verifyCount(arg_16_0.count + 1) then
				arg_16_0.count = math.min(arg_16_0.count + 1, arg_16_0.max)

				var_14_1(arg_16_0.count, arg_16_0.updateText)
			end
		end, SFX_PANEL)
		onButton(arg_16_0, arg_16_0.maxBtn, function()
			if arg_16_0:verifyCount(arg_16_0.max) then
				arg_16_0.count = arg_16_0.max

				var_14_1(arg_16_0.count, arg_16_0.updateText)
			end
		end, SFX_PANEL)
	end

	function var_14_0.verifyCount(arg_24_0, arg_24_1)
		if arg_24_0.verify then
			return arg_24_0.verify(arg_24_1)
		end

		return true
	end

	function var_14_0.isActive(arg_25_0)
		return arg_25_0.active
	end

	function var_14_0.show(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
		arg_26_0.verify = arg_26_2
		arg_26_0.onConfirm = arg_26_3
		arg_26_0.active = true
		arg_26_0.max = arg_26_1 or 1
		arg_26_0.count = 1
		arg_26_0.updateText = arg_26_4

		var_14_1(arg_26_0.count, arg_26_4)
		setActive(var_14_0._go, true)

		if not arg_26_0.inited then
			arg_26_0:init()
		end

		pg.UIMgr.GetInstance():BlurPanel(arg_26_0._tf)
	end

	function var_14_0.hide(arg_27_0)
		if arg_27_0:isActive() then
			arg_27_0.onConfirm = nil
			arg_27_0.active = false
			arg_27_0.updateText = nil
			arg_27_0.count = 1
			arg_27_0.max = 1
			arg_27_0.verify = nil

			setActive(var_14_0._go, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_27_0._tf, arg_27_0.buildUI)
		end
	end

	function var_14_0.close(arg_28_0)
		arg_28_0:hide()
		pg.DelegateInfo.Dispose(arg_28_0)
	end

	return var_14_0
end

var_0_0.Rarity_To_Light_Color_1 = {
	[2] = Color(0.5568627450980392, 0.5568627450980392, 0.5568627450980392, 1),
	[3] = Color(0.1568627450980392, 0.26666666666666666, 0.615686274509804, 1),
	[4] = Color(0.32941176470588235, 0.1568627450980392, 0.615686274509804, 1),
	[5] = Color(1, 0.8313725490196079, 0.3137254901960784, 1)
}
var_0_0.Rarity_To_Light_Color_2 = {
	[2] = Color(0.6235294117647059, 0.6549019607843137, 0.7411764705882353, 1),
	[3] = Color(0.34901960784313724, 0.5294117647058824, 0.996078431372549, 1),
	[4] = Color(0.9058823529411765, 0.615686274509804, 0.996078431372549, 1),
	[5] = Color(0.996078431372549, 0.8705882352941177, 0.3215686274509804, 1)
}

return var_0_0
