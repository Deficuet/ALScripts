local var_0_0 = class("LoadingPanel", import("..base.BaseUI"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)
	seriesAsync({
		function(arg_2_0)
			arg_1_0:preload(arg_2_0)
		end
	}, function()
		PoolMgr.GetInstance():GetUI("Loading", true, function(arg_4_0)
			local var_4_0 = GameObject.Find("Overlay/UIOverlay")

			arg_4_0.transform:SetParent(var_4_0.transform, false)
			arg_4_0:SetActive(false)
			arg_1_0:onUILoaded(arg_4_0)
			arg_1_1()
		end)
	end)
end

function var_0_0.preload(arg_5_0, arg_5_1)
	arg_5_0.isCri, arg_5_0.bgPath = getLoginConfig()

	if arg_5_0.isCri then
		LoadAndInstantiateAsync("effect", arg_5_0.bgPath, function(arg_6_0)
			arg_5_0.criBgGo = arg_6_0

			if arg_5_1 then
				arg_5_1()
			end
		end)
	else
		local var_5_0 = LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value and "loadingbg_hx/" or "loadingbg/"

		LoadSpriteAsync(var_5_0 .. arg_5_0.bgPath, function(arg_7_0)
			arg_5_0.staticBgSprite = arg_7_0

			if arg_5_1 then
				arg_5_1()
			end
		end)
	end
end

function var_0_0.init(arg_8_0)
	arg_8_0.infos = arg_8_0._tf:Find("infos")
	arg_8_0.infoTpl = arg_8_0:getTpl("infos/info_tpl")
	arg_8_0.indicator = arg_8_0._tf:Find("load")
	arg_8_0.bg = arg_8_0._tf:Find("BG")

	arg_8_0:displayBG(true)
end

function var_0_0.appendInfo(arg_9_0, arg_9_1)
	local var_9_0 = cloneTplTo(arg_9_0.infoTpl, arg_9_0.infos)

	setText(var_9_0, arg_9_1)

	local var_9_1 = GetOrAddComponent(var_9_0, "CanvasGroup")
	local var_9_2 = LeanTween.alphaCanvas(var_9_1, 0, 0.3)

	var_9_2:setDelay(1.5)
	var_9_2:setOnComplete(System.Action(function()
		destroy(var_9_0)
	end))
end

function var_0_0.onLoading(arg_11_0)
	return arg_11_0._go.activeInHierarchy
end

local var_0_1 = 0

function var_0_0.on(arg_12_0, arg_12_1)
	arg_12_0.displayIndicator = defaultValue(arg_12_0.displayIndicator, true) and arg_12_1

	setImageAlpha(arg_12_0._tf, arg_12_1 and 0.01 or 0)

	if not arg_12_0.displayIndicator then
		setActive(arg_12_0.indicator, arg_12_1)

		if arg_12_0.delayTimer then
			pg.TimeMgr.GetInstance():RemoveTimer(arg_12_0.delayTimer)

			arg_12_0.delayTimer = nil
		end
	elseif not arg_12_0.delayTimer then
		arg_12_0.delayTimer = pg.TimeMgr.GetInstance():AddTimer("loading", 1, 0, function()
			setImageAlpha(arg_12_0._tf, 0.2)
			setActive(arg_12_0.indicator, true)
		end)
	end

	if var_0_1 * (var_0_1 + 1) == 0 then
		setActive(arg_12_0._go, true)
		arg_12_0._go.transform:SetAsLastSibling()
	end

	var_0_1 = var_0_1 + 1
end

function var_0_0.off(arg_14_0)
	if var_0_1 * (var_0_1 - 1) == 0 then
		setActive(arg_14_0._go, false)
		setActive(arg_14_0.indicator, false)

		arg_14_0.displayIndicator = true

		if arg_14_0.delayTimer then
			pg.TimeMgr.GetInstance():RemoveTimer(arg_14_0.delayTimer)

			arg_14_0.delayTimer = nil
		end
	end

	var_0_1 = var_0_1 - 1

	assert(var_0_1 >= 0)
end

function var_0_0.displayBG(arg_15_0, arg_15_1)
	setActive(arg_15_0.bg, arg_15_1)

	local var_15_0 = GetComponent(arg_15_0.bg, "Image")

	if arg_15_1 then
		if not arg_15_0.isCri then
			if IsNil(var_15_0.sprite) then
				var_15_0.sprite = arg_15_0.staticBgSprite
			end
		elseif arg_15_0.bg.childCount == 0 then
			var_15_0.enabled = false

			local var_15_1 = arg_15_0.criBgGo.transform

			var_15_1:SetParent(arg_15_0.bg.transform, false)
			var_15_1:SetAsFirstSibling()

			local var_15_2 = arg_15_0.criBgGo:GetComponent("AspectRatioFitter")

			if var_15_2 then
				var_15_2.enabled = true
			end
		end
	else
		if not arg_15_0.isCri then
			var_15_0.sprite = nil
		else
			removeAllChildren(arg_15_0.bg)
		end

		arg_15_0.criBgGo = nil
		arg_15_0.staticBgSprite = nil
	end
end

function var_0_0.getRetainCount(arg_16_0)
	return var_0_1
end

return var_0_0
