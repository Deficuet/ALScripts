local var_0_0 = class("CourtYardBaseView")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.name = arg_1_1
	arg_1_0.storey = arg_1_2

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.isInit = false

	local var_2_0 = arg_2_0:GetStoreyModule()
	local var_2_1

	seriesAsync({
		function(arg_3_0)
			arg_2_0:LoadUI(var_2_0.__cname, function(arg_4_0)
				var_2_1 = arg_4_0

				arg_3_0()
			end)
		end,
		function(arg_5_0)
			arg_2_0:InitObjPool(arg_5_0)
		end
	}, function()
		arg_2_0.storeyModule = var_2_0.New(arg_2_0.storey, var_2_1)
		arg_2_0.isInit = true
	end)
end

function var_0_0.IsInit(arg_7_0)
	return arg_7_0.isInit == true
end

function var_0_0.LoadUI(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.resName = arg_8_1

	ResourceMgr.Inst:getAssetAsync("UI/" .. arg_8_0.resName, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_9_0)
		local var_9_0

		if arg_8_0.storey:GetStyle() == CourtYardConst.STYLE_PREVIEW then
			var_9_0 = pg.UIMgr.GetInstance().OverlayMain:Find("BackYardInterActionPreview(Clone)/frame/view")
		else
			var_9_0 = pg.UIMgr.GetInstance().UIMain:Find(arg_8_0.name .. "(Clone)")
		end

		local var_9_1 = Object.Instantiate(arg_9_0, var_9_0)

		arg_8_0._go = var_9_1

		var_9_1.transform:SetSiblingIndex(1)
		setActive(var_9_1, true)

		arg_8_0.poolRoot = var_9_1.transform:Find("root")

		arg_8_2(var_9_1)
	end), true, true)
end

function var_0_0.GetRect(arg_10_0)
	assert(arg_10_0.storeyModule)

	return arg_10_0.storeyModule.rectTF
end

function var_0_0.GetStoreyModule(arg_11_0)
	local var_11_0 = arg_11_0.storey

	return ({
		[CourtYardConst.STYLE_INNER] = CourtYardStoreyModule,
		[CourtYardConst.STYLE_OUTSIDE] = CourtYardOutStoreyModule,
		[CourtYardConst.STYLE_FEAST] = CourtYardFeastStoreyModule,
		[CourtYardConst.STYLE_PREVIEW] = CourtYardStoreyPreviewModule,
		[CourtYardConst.STYLE_REVERSE_PACMAN] = CourtYardReversePacmanStoreyModule
	})[var_11_0:GetStyle()]
end

function var_0_0.InitObjPool(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.storey
	local var_12_1 = ({
		[CourtYardConst.STYLE_INNER] = CourtYardPoolMgr,
		[CourtYardConst.STYLE_OUTSIDE] = CourtYardPoolMgr,
		[CourtYardConst.STYLE_FEAST] = CourtYardFeastPoolMgr,
		[CourtYardConst.STYLE_PREVIEW] = CourtYardPoolMgr,
		[CourtYardConst.STYLE_REVERSE_PACMAN] = CourtYardReversePacmanPoolMgr
	})[var_12_0:GetStyle()].New()

	var_12_1:Init(arg_12_0.poolRoot, arg_12_1)

	arg_12_0.poolMgr = var_12_1
end

function var_0_0.GetCurrStorey(arg_13_0)
	return arg_13_0.storeyModule
end

function var_0_0.Dispose(arg_14_0)
	if arg_14_0.storeyModule then
		arg_14_0.storeyModule:Dispose()

		arg_14_0.storeyModule = nil
	end

	arg_14_0.storey = nil

	arg_14_0.poolMgr:Dispose()

	arg_14_0.poolMgr = nil
end

return var_0_0
