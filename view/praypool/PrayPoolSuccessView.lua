local var_0_0 = class("PrayPoolSuccessView", import("..base.BaseSubView"))

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = getProxy(PrayProxy)

	for iter_1_0, iter_1_1 in ipairs(var_1_1:getSelectedShipIDList() or {}) do
		table.insertto(var_1_0, ResPathSupport.GetPaintingListByPaintingName(Ship.getPaintingName(iter_1_1)))
	end

	return table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))
end

function var_0_0.getUIName(arg_2_0)
	return "PrayPoolSuccessView"
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:initData()
	arg_3_0:initUI()
	arg_3_0:updateUI()
	arg_3_0:Show()
end

function var_0_0.OnDestroy(arg_4_0)
	arg_4_0.buildMsgBox:hide()
end

function var_0_0.OnBackPress(arg_5_0)
	if arg_5_0:GetLoaded() and isActive(arg_5_0.boxTF) then
		arg_5_0.buildMsgBox:hide()

		return true
	end
end

function var_0_0.initData(arg_6_0)
	arg_6_0.prayProxy = getProxy(PrayProxy)
	arg_6_0.poolType = arg_6_0.prayProxy:getSelectedPoolType()
	arg_6_0.playerProxy = getProxy(PlayerProxy)
	arg_6_0.bagProxy = getProxy(BagProxy)
	arg_6_0.useItem = pg.ship_data_create_material[1].use_item

	print("useitem " .. arg_6_0.useItem)

	arg_6_0.buildShipProxy = getProxy(BuildShipProxy)
end

function var_0_0.initUI(arg_7_0)
	arg_7_0.shipTF = {
		arg_7_0._tf:Find("Ship1"),
		(arg_7_0._tf:Find("Ship2"))
	}
	arg_7_0.shipRarityTF = {
		arg_7_0._tf:Find("Rarity1"),
		(arg_7_0._tf:Find("Rarity2"))
	}
	arg_7_0.boxTF = arg_7_0._tf:Find("build_msg")
	arg_7_0.buildMsgBox = var_0_0.MsgBox(arg_7_0.boxTF)
	arg_7_0.buildBtn = arg_7_0._tf:Find("BuildBtn")
	arg_7_0.buildCubeNumText = arg_7_0._tf:Find("BuildInfo/CubeNum")
	arg_7_0.buildGoldNumText = arg_7_0._tf:Find("BuildInfo/GoldNum")
	arg_7_0.curCubeNumText = arg_7_0._tf:Find("CubeImg/NumText")
	arg_7_0.material1 = arg_7_0._tf:Find("material1")
	arg_7_0.material2 = arg_7_0._tf:Find("material2")
	arg_7_0.ratioSpriteMap = {}

	local var_7_0 = arg_7_0._tf:Find("Ratio")

	for iter_7_0 = 2, 6 do
		local var_7_1 = getImageSprite(var_7_0:Find(tostring(iter_7_0)))

		arg_7_0.ratioSpriteMap[iter_7_0] = var_7_1
	end

	arg_7_0.raritySpriteMap = {
		Normal = {
			Light1 = getImageSprite(arg_7_0._tf:Find("Light/Normal/Light1")),
			Light2 = getImageSprite(arg_7_0._tf:Find("Light/Normal/Light2")),
			Light2_2 = getImageSprite(arg_7_0._tf:Find("Light/Normal/Light2_2")),
			Light3 = getImageSprite(arg_7_0._tf:Find("Light/Normal/Light3")),
			RarityBG = getImageSprite(arg_7_0._tf:Find("RarityBG/Normal"))
		},
		UR = {
			Light1 = getImageSprite(arg_7_0._tf:Find("Light/UR/Light1")),
			Light2 = getImageSprite(arg_7_0._tf:Find("Light/UR/Light2")),
			Light2_2 = getImageSprite(arg_7_0._tf:Find("Light/UR/Light2_2")),
			Light3 = getImageSprite(arg_7_0._tf:Find("Light/UR/Light3")),
			RarityBG = getImageSprite(arg_7_0._tf:Find("RarityBG/UR"))
		}
	}

	onButton(arg_7_0, arg_7_0.buildBtn, function()
		local var_8_0 = pg.ship_data_create_material[pg.activity_ship_create[arg_7_0.poolType].create_id]
		local var_8_1 = arg_7_0.playerProxy:getData()
		local var_8_2 = arg_7_0.bagProxy:getItemCountById(arg_7_0.useItem)
		local var_8_3 = arg_7_0.buildShipProxy:getRawData()
		local var_8_4 = table.getCount(var_8_3)
		local var_8_5 = _.min({
			math.floor(var_8_1.gold / var_8_0.use_gold),
			math.floor(var_8_2 / var_8_0.number_1),
			MAX_BUILD_WORK_COUNT - var_8_4
		})
		local var_8_6 = math.max(1, var_8_5)

		local function var_8_7(arg_9_0)
			if arg_9_0 > var_8_6 or var_8_1.gold < arg_9_0 * var_8_0.use_gold or var_8_2 < arg_9_0 * var_8_0.number_1 then
				return false
			end

			return true
		end

		arg_7_0.buildMsgBox:show(var_8_6, var_8_7, function(arg_10_0)
			arg_7_0:emit(PrayPoolConst.START_BUILD_SHIP_EVENT, var_8_0.id, arg_10_0, 0)
		end, function(arg_11_0)
			local var_11_0 = arg_11_0 * var_8_0.use_gold
			local var_11_1 = arg_11_0 * var_8_0.number_1
			local var_11_2 = var_8_7(arg_11_0) and COLOR_GREEN or COLOR_RED

			return i18n("build_ship_tip", arg_11_0, var_8_0.name, var_11_0, var_11_1, var_11_2)
		end)
	end, SFX_UI_BUILDING_STARTBUILDING)
end

function var_0_0.updateUI(arg_12_0)
	local var_12_0 = arg_12_0.prayProxy:getSelectedShipIDList()

	arg_12_0:updatePaint(var_12_0)

	local var_12_1
	local var_12_2 = arg_12_0.bagProxy:getItemById(arg_12_0.useItem) or {
		count = 0
	}

	setText(arg_12_0.curCubeNumText, var_12_2.count)

	local var_12_3 = pg.ship_data_create_material[pg.activity_ship_create[arg_12_0.poolType].create_id]

	setText(arg_12_0.buildCubeNumText, var_12_3.number_1)
	setText(arg_12_0.buildGoldNumText, var_12_3.use_gold)
end

function var_0_0.updatePaint(arg_13_0, arg_13_1)
	for iter_13_0 = 1, 2 do
		local var_13_0 = arg_13_1[iter_13_0]
		local var_13_1 = pg.ship_data_statistics[var_13_0].name
		local var_13_2 = pg.ship_data_statistics[var_13_0].english_name
		local var_13_3 = pg.ship_data_statistics[var_13_0].rarity
		local var_13_4 = var_13_3 == ShipRarity.SSR
		local var_13_5 = arg_13_0.shipTF[iter_13_0]
		local var_13_6 = var_13_5:Find("Mask/Paint")

		local function var_13_7()
			local var_14_0 = var_13_6:Find("fitter"):GetChild(0)
			local var_14_1 = GetComponent(var_14_0, "MeshImage")
			local var_14_2 = (iter_13_0 == 2 and arg_13_0.material2 or arg_13_0.material1):GetComponent(typeof(Image)).material

			var_14_2:SetFloat("_Range", iter_13_0 == 2 and 0.9 or -0.57)
			var_14_2:SetFloat("_Degree", iter_13_0 == 2 and -50 or 50)

			var_14_1.material = var_14_2
		end

		setPaintingPrefabAsync(var_13_6, Ship.getPaintingName(var_13_0), "build", var_13_7)

		local var_13_8 = var_13_5:Find("Light1")
		local var_13_9 = var_13_5:Find("Light2")
		local var_13_10 = var_13_9:Find("Light2_2")
		local var_13_11 = var_13_5:Find("Light3")

		if not var_13_4 then
			setImageSprite(var_13_8, arg_13_0.raritySpriteMap.Normal.Light1)
			setImageSprite(var_13_9, arg_13_0.raritySpriteMap.Normal.Light2)
			setImageSprite(var_13_10, arg_13_0.raritySpriteMap.Normal.Light2_2)
			setImageSprite(var_13_11, arg_13_0.raritySpriteMap.Normal.Light3)
			setImageColor(var_13_8, var_0_0.Rarity_To_Light_Color_1[var_13_3])
			setImageColor(var_13_9, var_0_0.Rarity_To_Light_Color_1[var_13_3])
			setImageColor(var_13_10, var_0_0.Rarity_To_Light_Color_1[var_13_3])
			setImageColor(var_13_11, var_0_0.Rarity_To_Light_Color_2[var_13_3])
		else
			setImageSprite(var_13_8, arg_13_0.raritySpriteMap.UR.Light1)
			setImageSprite(var_13_9, arg_13_0.raritySpriteMap.UR.Light2)
			setImageSprite(var_13_10, arg_13_0.raritySpriteMap.UR.Light2_2)
			setImageSprite(var_13_11, arg_13_0.raritySpriteMap.UR.Light3)
		end

		local var_13_12 = arg_13_0.shipRarityTF[iter_13_0]
		local var_13_13 = var_13_4 and arg_13_0.raritySpriteMap.UR.RarityBG or arg_13_0.raritySpriteMap.Normal.RarityBG

		setImageSprite(var_13_12, var_13_13)

		local var_13_14 = var_13_5:Find("NameText")

		setText(var_13_14, var_13_1)

		local var_13_15 = var_13_5:Find("NameEngText")

		setText(var_13_15, var_13_2)

		local var_13_16 = var_13_12:Find("NumImg")

		setImageSprite(var_13_16, arg_13_0.ratioSpriteMap[var_13_3], true)
	end
end

function var_0_0.MsgBox(arg_15_0)
	local var_15_0 = {
		_go = arg_15_0
	}

	var_15_0.__cname = "buildmsgbox"
	var_15_0._tf = tf(arg_15_0)
	var_15_0.inited = false
	var_15_0.cancenlBtn = findTF(var_15_0._go, "window/btns/cancel_btn")
	var_15_0.confirmBtn = findTF(var_15_0._go, "window/btns/confirm_btn")
	var_15_0.closeBtn = findTF(var_15_0._go, "window/close_btn")
	var_15_0.count = 1
	var_15_0.minusBtn = findTF(var_15_0._go, "window/content/calc_panel/minus")
	var_15_0.addBtn = findTF(var_15_0._go, "window/content/calc_panel/add")
	var_15_0.maxBtn = findTF(var_15_0._go, "window/content/max")
	var_15_0.valueTxt = findTF(var_15_0._go, "window/content/calc_panel/Text"):GetComponent(typeof(Text))
	var_15_0.text = findTF(var_15_0._go, "window/content/Text"):GetComponent(typeof(Text))
	var_15_0.buildUI = arg_15_0.parent
	var_15_0.active = false

	pg.DelegateInfo.New(var_15_0)
	setText(findTF(var_15_0.cancenlBtn, "Image/Image (1)"), i18n("text_cancel"))
	setText(findTF(var_15_0.confirmBtn, "Image/Image (1)"), i18n("text_confirm"))

	local function var_15_1(arg_16_0, arg_16_1)
		var_15_0.valueTxt.text = arg_16_0

		if arg_16_1 then
			local var_16_0 = arg_16_1(arg_16_0)

			var_15_0.text.text = var_16_0
		else
			var_15_0.text.text = ""
		end
	end

	function var_15_0.init(arg_17_0)
		arg_17_0.inited = true

		onButton(arg_17_0, arg_17_0._tf, function()
			arg_17_0:hide()
		end, SFX_PANEL)
		onButton(arg_17_0, arg_17_0.cancenlBtn, function()
			arg_17_0:hide()
		end, SFX_PANEL)
		onButton(arg_17_0, arg_17_0.confirmBtn, function()
			if arg_17_0.onConfirm then
				arg_17_0.onConfirm(arg_17_0.count)
			end

			arg_17_0:hide()
		end, SFX_PANEL)
		onButton(arg_17_0, arg_17_0.closeBtn, function()
			arg_17_0:hide()
		end, SFX_PANEL)
		onButton(arg_17_0, arg_17_0.minusBtn, function()
			if arg_17_0:verifyCount(arg_17_0.count - 1) then
				arg_17_0.count = math.max(arg_17_0.count - 1, 1)

				var_15_1(arg_17_0.count, arg_17_0.updateText)
			end
		end, SFX_PANEL)
		onButton(arg_17_0, arg_17_0.addBtn, function()
			if arg_17_0:verifyCount(arg_17_0.count + 1) then
				arg_17_0.count = math.min(arg_17_0.count + 1, arg_17_0.max)

				var_15_1(arg_17_0.count, arg_17_0.updateText)
			end
		end, SFX_PANEL)
		onButton(arg_17_0, arg_17_0.maxBtn, function()
			if arg_17_0:verifyCount(arg_17_0.max) then
				arg_17_0.count = arg_17_0.max

				var_15_1(arg_17_0.count, arg_17_0.updateText)
			end
		end, SFX_PANEL)
	end

	function var_15_0.verifyCount(arg_25_0, arg_25_1)
		if arg_25_0.verify then
			return arg_25_0.verify(arg_25_1)
		end

		return true
	end

	function var_15_0.isActive(arg_26_0)
		return arg_26_0.active
	end

	function var_15_0.show(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
		arg_27_0.verify = arg_27_2
		arg_27_0.onConfirm = arg_27_3
		arg_27_0.active = true
		arg_27_0.max = arg_27_1 or 1
		arg_27_0.count = 1
		arg_27_0.updateText = arg_27_4

		var_15_1(arg_27_0.count, arg_27_4)
		setActive(var_15_0._go, true)

		if not arg_27_0.inited then
			arg_27_0:init()
		end

		pg.UIMgr.GetInstance():BlurPanel(arg_27_0._tf)
	end

	function var_15_0.hide(arg_28_0)
		if arg_28_0:isActive() then
			arg_28_0.onConfirm = nil
			arg_28_0.active = false
			arg_28_0.updateText = nil
			arg_28_0.count = 1
			arg_28_0.max = 1
			arg_28_0.verify = nil

			setActive(var_15_0._go, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_28_0._tf, arg_28_0.buildUI)
		end
	end

	function var_15_0.close(arg_29_0)
		arg_29_0:hide()
		pg.DelegateInfo.Dispose(arg_29_0)
	end

	return var_15_0
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
