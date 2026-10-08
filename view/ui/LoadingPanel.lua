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

function var_0_0.getResource(arg_5_0)
	local var_5_0
	local var_5_1, var_5_2 = getLoginConfig()

	if var_5_1 then
		var_5_0 = {
			"effect/" .. var_5_2
		}
	else
		local var_5_3 = LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value and "loadingbg_hx/" or "loadingbg/"

		var_5_0 = {
			var_5_3 .. var_5_2
		}
	end

	return table.insertto(var_5_0, var_0_0.super.getResource(arg_5_0))
end

function var_0_0.preload(arg_6_0, arg_6_1)
	arg_6_0.isCri, arg_6_0.bgPath = getLoginConfig()

	if arg_6_0.isCri then
		LoadAndInstantiateAsync("effect", arg_6_0.bgPath, function(arg_7_0)
			arg_6_0.criBgGo = arg_7_0

			if arg_6_1 then
				arg_6_1()
			end
		end)
	else
		local var_6_0 = LOGIN_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOGIN_HX_LV.key_value and "loadingbg_hx/" or "loadingbg/"

		LoadSpriteAsync(var_6_0 .. arg_6_0.bgPath, function(arg_8_0)
			arg_6_0.staticBgSprite = arg_8_0

			if arg_6_1 then
				arg_6_1()
			end
		end)
	end
end

function var_0_0.init(arg_9_0)
	arg_9_0.infos = arg_9_0._tf:Find("infos")
	arg_9_0.infoTpl = arg_9_0:getTpl("infos/info_tpl")
	arg_9_0.indicator = arg_9_0._tf:Find("load")
	arg_9_0.bg = arg_9_0._tf:Find("BG")

	arg_9_0:displayBG(true)
end

function var_0_0.appendInfo(arg_10_0, arg_10_1)
	local var_10_0 = cloneTplTo(arg_10_0.infoTpl, arg_10_0.infos)

	setText(var_10_0, arg_10_1)

	local var_10_1 = GetOrAddComponent(var_10_0, "CanvasGroup")
	local var_10_2 = LeanTween.alphaCanvas(var_10_1, 0, 0.3)

	var_10_2:setDelay(1.5)
	var_10_2:setOnComplete(System.Action(function()
		destroy(var_10_0)
	end))
end

function var_0_0.onLoading(arg_12_0)
	return arg_12_0._go.activeInHierarchy
end

local var_0_1 = 0

function var_0_0.on(arg_13_0, arg_13_1)
	arg_13_0.displayIndicator = defaultValue(arg_13_0.displayIndicator, true) and defaultValue(arg_13_1, true)

	setImageAlpha(arg_13_0._tf, arg_13_1 and 0.01 or 0)

	if not arg_13_0.displayIndicator then
		setActive(arg_13_0.indicator, arg_13_1)

		if arg_13_0.delayTimer then
			pg.TimeMgr.GetInstance():RemoveTimer(arg_13_0.delayTimer)

			arg_13_0.delayTimer = nil
		end
	elseif not arg_13_0.delayTimer then
		arg_13_0.delayTimer = pg.TimeMgr.GetInstance():AddTimer("loading", 1, 0, function()
			setImageAlpha(arg_13_0._tf, 0.2)
			setActive(arg_13_0.indicator, true)
		end)
	end

	if var_0_1 * (var_0_1 + 1) == 0 then
		setActive(arg_13_0._go, true)
		arg_13_0._go.transform:SetAsLastSibling()
	end

	var_0_1 = var_0_1 + 1
end

function var_0_0.off(arg_15_0)
	if var_0_1 * (var_0_1 - 1) == 0 then
		setActive(arg_15_0._go, false)
		setActive(arg_15_0.indicator, false)

		arg_15_0.displayIndicator = true

		if arg_15_0.delayTimer then
			pg.TimeMgr.GetInstance():RemoveTimer(arg_15_0.delayTimer)

			arg_15_0.delayTimer = nil
		end
	end

	var_0_1 = var_0_1 - 1

	assert(var_0_1 >= 0)
end

function var_0_0.displayBG(arg_16_0, arg_16_1)
	setActive(arg_16_0.bg, arg_16_1)

	local var_16_0 = GetComponent(arg_16_0.bg, "Image")

	if arg_16_1 then
		if not arg_16_0.isCri then
			if IsNil(var_16_0.sprite) then
				var_16_0.sprite = arg_16_0.staticBgSprite
			end
		elseif arg_16_0.bg.childCount == 0 then
			var_16_0.enabled = false

			local var_16_1 = arg_16_0.criBgGo.transform

			var_16_1:SetParent(arg_16_0.bg.transform, false)
			var_16_1:SetAsFirstSibling()

			local var_16_2 = arg_16_0.criBgGo:GetComponent("AspectRatioFitter")

			if var_16_2 then
				var_16_2.enabled = true
			end
		end
	else
		if not arg_16_0.isCri then
			var_16_0.sprite = nil
		else
			removeAllChildren(arg_16_0.bg)
		end

		arg_16_0.criBgGo = nil
		arg_16_0.staticBgSprite = nil
	end
end

function var_0_0.getRetainCount(arg_17_0)
	return var_0_1
end

return var_0_0
