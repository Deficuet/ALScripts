local var_0_0 = class("BaseUI", import("view.base.BaseEventLogic"))

var_0_0.LOADED = "BaseUI:LOADED"
var_0_0.DID_ENTER = "BaseUI:DID_ENTER"
var_0_0.AVALIBLE = "BaseUI:AVALIBLE"
var_0_0.DID_EXIT = "BaseUI:DID_EXIT"
var_0_0.ON_BACK = "BaseUI:ON_BACK"
var_0_0.ON_RETURN = "BaseUI:ON_RETURN"
var_0_0.ON_HOME = "BaseUI:ON_HOME"
var_0_0.ON_CLOSE = "BaseUI:ON_CLOSE"
var_0_0.ON_DROP = "BaseUI.ON_DROP"
var_0_0.ON_DROP_LIST = "BaseUI.ON_DROP_LIST"
var_0_0.ON_DROP_LIST_OWN = "BaseUI.ON_DROP_LIST_OWN"
var_0_0.ON_NEW_DROP = "BaseUI.ON_NEW_DROP"
var_0_0.ON_NEW_STYLE_DROP = "BaseUI.ON_NEW_STYLE_DROP"
var_0_0.ON_NEW_STYLE_ITEMS = "BaseUI.ON_NEW_STYLE_ITEMS"
var_0_0.ON_ITEM = "BaseUI:ON_ITEM"
var_0_0.ON_ITEM_EXTRA = "BaseUI.ON_ITEM_EXTRA"
var_0_0.ON_SHIP = "BaseUI:ON_SHIP"
var_0_0.ON_AWARD = "BaseUI:ON_AWARD"
var_0_0.ON_ACHIEVE = "BaseUI:ON_ACHIEVE"
var_0_0.ON_ACHIEVE_AUTO = "BaseUI:ON_ACHIEVE_AUTO"
var_0_0.ON_WORLD_ACHIEVE = "BaseUI:ON_WORLD_ACHIEVE"
var_0_0.ON_EQUIPMENT = "BaseUI:ON_EQUIPMENT"
var_0_0.ON_SPWEAPON = "BaseUI:ON_SPWEAPON"
var_0_0.ON_SHIP_EXP = "BaseUI.ON_SHIP_EXP"
var_0_0.ON_BACK_PRESSED = "BaseUI:ON_BACK_PRESS"
var_0_0.ON_ADD_SUBLAYER = "BaseUI:ON_ADD_SUBLAYER"

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0._isLoaded = false
	arg_1_0._go = nil
	arg_1_0._tf = nil
	arg_1_0._isCachedView = false
end

function var_0_0.setContextData(arg_2_0, arg_2_1)
	arg_2_0.contextData = arg_2_1
end

function var_0_0.getUIName(arg_3_0)
	return nil
end

function var_0_0.getGroupName(arg_4_0)
	return arg_4_0.contextData.groupName or arg_4_0.__cname
end

function var_0_0.getDefaultUI(arg_5_0)
	return arg_5_0._tf
end

function var_0_0.preloadUIList(arg_6_0)
	return {
		arg_6_0:getUIName()
	}
end

function var_0_0.getResource(arg_7_0, arg_7_1)
	local var_7_0 = {}

	_.each({
		arg_7_0:getBGM()
	}, function(arg_8_0)
		if noEmptyStr(arg_8_0) then
			local var_8_0 = ResPathSupport.GetSoundResList(arg_8_0)

			_.each(var_8_0, function(arg_9_0)
				table.insert(var_7_0, arg_9_0)
			end)
		end
	end)
	_.each(arg_7_0:preloadUIList(), function(arg_10_0)
		if noEmptyStr(arg_10_0) then
			local var_10_0 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Base, arg_10_0)

			table.insert(var_7_0, var_10_0)
		end
	end)

	return var_7_0
end

function var_0_0.needCache(arg_11_0)
	return false
end

function var_0_0.tempCache(arg_12_0)
	return false
end

function var_0_0.forceGC(arg_13_0)
	return false
end

function var_0_0.DontGC(arg_14_0)
	return false
end

function var_0_0.forceRatio(arg_15_0)
	return nil
end

function var_0_0.loadingQueue(arg_16_0)
	return false
end

function var_0_0.setLayerMgrRegister(arg_17_0, arg_17_1)
	if not arg_17_0.contextData then
		return
	end

	local var_17_0 = arg_17_0:getGroupName()

	if arg_17_1 then
		pg.LayerWeightMgr.GetInstance():RegisterGroupWeight(var_17_0)
	else
		pg.LayerWeightMgr.GetInstance():RemoveGroupWeight(var_17_0)
	end
end

function var_0_0.preload(arg_18_0, arg_18_1)
	arg_18_1()
end

function var_0_0.loadUISync(arg_19_0, arg_19_1)
	local var_19_0 = LoadAndInstantiateSync("UI", arg_19_1, true, false)
	local var_19_1 = pg.UIMgr.GetInstance().UIMain

	var_19_0.transform:SetParent(var_19_1.transform, false)

	return var_19_0
end

function var_0_0.GCWhenAwake(arg_20_0)
	return tobool(arg_20_0:loadingQueue())
end

function var_0_0.load(arg_21_0)
	arg_21_0:setLayerMgrRegister(true)

	local var_21_0
	local var_21_1 = Time.realtimeSinceStartup
	local var_21_2 = arg_21_0:getUIName()

	seriesAsync({
		function(arg_22_0)
			if arg_21_0:GCWhenAwake() then
				gcAll(true)
			end

			arg_21_0:preload(arg_22_0)
		end,
		function(arg_23_0)
			arg_21_0:LoadUIFromPool(var_21_2, function(arg_24_0)
				print("Loaded " .. var_21_2)

				var_21_0 = arg_24_0

				arg_23_0()
			end)
		end
	}, function()
		originalPrint("load " .. var_21_0.name .. " time cost: " .. Time.realtimeSinceStartup - var_21_1)
		arg_21_0:SetUIParent(var_21_0)

		if arg_21_0:CheckTempCache() then
			PoolMgr.GetInstance():KeepUICache(var_21_2, true)
		end

		arg_21_0:onUILoaded(var_21_0)
	end)
end

function var_0_0.SetUIParent(arg_26_0, arg_26_1)
	local var_26_0 = pg.UIMgr.GetInstance().UIMain

	arg_26_1.transform:SetParent(var_26_0.transform, false)
end

function var_0_0.LoadUIFromPool(arg_27_0, arg_27_1, arg_27_2)
	PoolMgr.GetInstance():GetUI(arg_27_1, true, arg_27_2)
end

function var_0_0.getBGM(arg_28_0, arg_28_1)
	return getBgm(arg_28_1 or arg_28_0.__cname)
end

function var_0_0.PlayBGM(arg_29_0)
	local var_29_0 = arg_29_0:getBGM()

	if var_29_0 then
		pg.BgmMgr.GetInstance():Push(arg_29_0.__cname, var_29_0)
	end
end

function var_0_0.StopBgm(arg_30_0)
	if not arg_30_0.contextData then
		return
	end

	if arg_30_0.contextData.isLayer then
		pg.BgmMgr.GetInstance():Pop(arg_30_0.__cname)
	else
		pg.BgmMgr.GetInstance():Clear()
	end
end

function var_0_0.isLoaded(arg_31_0)
	return arg_31_0._isLoaded
end

function var_0_0.CheckTempCache(arg_32_0)
	return arg_32_0:tempCache() and arg_32_0:isLayer()
end

function var_0_0.isLayer(arg_33_0)
	return arg_33_0.contextData ~= nil and arg_33_0.contextData.isLayer
end

function var_0_0.Add2Overlay(arg_34_0, arg_34_1, arg_34_2)
	if not arg_34_0.contextData then
		return
	end

	arg_34_2 = arg_34_2 or {}
	arg_34_2.groupName = arg_34_0:getGroupName()

	pg.LayerWeightMgr.GetInstance():Add2Overlay(arg_34_1, arg_34_2)
end

function var_0_0.DelFromOverlay(arg_35_0, arg_35_1, ...)
	if not arg_35_0.contextData then
		return
	end

	pg.LayerWeightMgr.GetInstance():DelFromOverlay(arg_35_1, ...)
end

function var_0_0.OverlayPanel(arg_36_0, arg_36_1, arg_36_2)
	arg_36_2 = arg_36_2 or {}
	arg_36_2.type = LayerWeightConst.UI_TYPE_SUB

	arg_36_0:Add2Overlay(arg_36_1, arg_36_2)
end

function var_0_0.BlurPanel(arg_37_0, arg_37_1, arg_37_2)
	arg_37_2 = arg_37_2 or {}
	arg_37_2.type = LayerWeightConst.UI_TYPE_SUB
	arg_37_2.globalBlur = true

	arg_37_0:Add2Overlay(arg_37_1, arg_37_2)
end

function var_0_0.UnOverlayPanel(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0:DelFromOverlay(arg_38_1, arg_38_2 or arg_38_0.UIMain)
end

function var_0_0.TempOverlayPanelPB(arg_39_0, arg_39_1, arg_39_2)
	if not arg_39_0.contextData then
		return
	end

	arg_39_2 = arg_39_2 or {}
	arg_39_2.groupName = arg_39_0:getGroupName()

	pg.UIMgr.GetInstance():TempOverlayPanelPB(arg_39_1, arg_39_2)
end

function var_0_0.TempUnOverlayPanelPB(arg_40_0, arg_40_1, arg_40_2)
	if not arg_40_0.contextData then
		return
	end

	pg.UIMgr.GetInstance():TempUnOverlayPanelPB(arg_40_1, arg_40_2)
end

var_0_0.optionsPath = {
	"option",
	"top/option",
	"top/left_top/option",
	"blur_container/top/title/option",
	"blur_container/top/option",
	"top/top/option",
	"common/top/option",
	"blur_panel/top/option",
	"blurPanel/top/option",
	"blur_container/top/option",
	"top/title/option",
	"blur_panel/adapt/top/option",
	"mainPanel/top/option",
	"bg/top/option",
	"blur_container/adapt/top/title/option",
	"blur_container/adapt/top/option",
	"ForNorth/top/option",
	"top/top_chapter/option",
	"Main/blur_panel/adapt/top/option",
	"adapt/blur_panel/adapt/top/option"
}

function var_0_0.onUILoaded(arg_41_0, arg_41_1)
	arg_41_0._go = arg_41_1
	arg_41_0._tf = arg_41_1 and arg_41_1.transform

	arg_41_0:Add2Overlay(arg_41_0:getDefaultUI(), {
		type = LayerWeightConst.UI_TYPE_SYSTEM
	})
	pg.SeriesGuideMgr.GetInstance():dispatch({
		view = arg_41_0.__cname
	})
	pg.NewStoryMgr.GetInstance():OnSceneEnter({
		view = arg_41_0.__cname
	})

	arg_41_0._isLoaded = true

	pg.DelegateInfo.New(arg_41_0)

	arg_41_0.optionBtns = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.optionsPath) do
		table.insert(arg_41_0.optionBtns, arg_41_0._tf:Find(iter_41_1))
	end

	setActiveViaLayer(arg_41_0._tf, true)
	bindComponent(arg_41_0, arg_41_0._go)
	arg_41_0:init()
	arg_41_0:emit(var_0_0.LOADED)
end

function var_0_0.ResUISettings(arg_42_0)
	return nil
end

function var_0_0.ShowOrHideResUI(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0:ResUISettings()

	if not var_43_0 then
		return
	end

	if var_43_0 == true then
		var_43_0 = {
			anim = true,
			showType = PlayerResUI.TYPE_ALL
		}
	end

	local var_43_1 = arg_43_0:getGroupName()

	if arg_43_1 then
		pg.playerResUI:SetSettings(var_43_1, setmetatable({
			groupName = var_43_1
		}, {
			__index = var_43_0
		}))
	else
		pg.playerResUI:RemoveSettings(var_43_1)
	end
end

function var_0_0.onUIAnimEnd(arg_44_0, arg_44_1)
	arg_44_1()
end

function var_0_0.init(arg_45_0)
	return
end

function var_0_0.quickExitFunc(arg_46_0)
	arg_46_0:emit(var_0_0.ON_HOME)
end

function var_0_0.quickExit(arg_47_0)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.optionBtns) do
		onButton(arg_47_0, iter_47_1, function()
			arg_47_0:quickExitFunc()
		end, SFX_PANEL)
	end
end

function var_0_0.enter(arg_49_0)
	arg_49_0:quickExit()
	arg_49_0:PlayBGM()
	arg_49_0:emit(var_0_0.DID_ENTER)

	if arg_49_0:forceRatio() then
		pg.CameraFixMgr.GetInstance():SetForceRatio(arg_49_0:forceRatio())
	end

	if not arg_49_0._isCachedView then
		arg_49_0:didEnter()
		arg_49_0:ShowOrHideResUI(true)
	end

	if tobool(arg_49_0:loadingQueue()) and arg_49_0.contextData.resumeCallback then
		local var_49_0 = arg_49_0.contextData.resumeCallback

		arg_49_0.contextData.resumeCallback = nil

		var_49_0()
	end

	arg_49_0:emit(var_0_0.AVALIBLE)
	arg_49_0:onUIAnimEnd(function()
		pg.SeriesGuideMgr.GetInstance():start({
			view = arg_49_0.__cname,
			code = {
				pg.SeriesGuideMgr.CODES.MAINUI
			}
		})
		pg.NewGuideMgr.GetInstance():OnSceneEnter({
			view = arg_49_0.__cname
		})
	end)
end

function var_0_0.closeView(arg_51_0)
	if arg_51_0.contextData.isLayer then
		arg_51_0:emit(var_0_0.ON_CLOSE)
	else
		arg_51_0:emit(var_0_0.ON_BACK)
	end
end

function var_0_0.didEnter(arg_52_0)
	return
end

function var_0_0.willExit(arg_53_0)
	return
end

function var_0_0.exit(arg_54_0)
	arg_54_0.exited = true

	arg_54_0:StopBgm()
	pg.DelegateInfo.Dispose(arg_54_0)
	arg_54_0:willExit()
	bindComponent(arg_54_0, arg_54_0._go, true)
	arg_54_0:ShowOrHideResUI(false)
	arg_54_0:DelFromOverlay(arg_54_0:getDefaultUI())
	arg_54_0:setLayerMgrRegister(false)
	arg_54_0:detach()

	if arg_54_0:forceRatio() then
		pg.CameraFixMgr.GetInstance():SetForceRatio(nil)
	end

	pg.NewGuideMgr.GetInstance():OnSceneExit({
		view = arg_54_0.__cname
	})
	pg.NewStoryMgr.GetInstance():OnSceneExit({
		view = arg_54_0.__cname
	})
	arg_54_0:emit(var_0_0.DID_EXIT)
end

function var_0_0.PlayUIAnimation(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	local var_55_0 = arg_55_1:GetComponent(typeof(Animation))
	local var_55_1 = arg_55_1:GetComponent(typeof(UIEventTrigger))

	var_55_1.didExit:RemoveAllListeners()
	var_55_1.didExit:AddListener(function()
		var_55_1.didExit:RemoveAllListeners()
		arg_55_3()
	end)
	var_55_0:Play(arg_55_2)
end

function var_0_0.attach(arg_57_0, arg_57_1)
	return
end

function var_0_0.ClearTweens(arg_58_0, arg_58_1)
	arg_58_0:cleanManagedTween(arg_58_1)
end

function var_0_0.detach(arg_59_0, arg_59_1)
	arg_59_0._isLoaded = false

	pg.DynamicBgMgr.GetInstance():ClearBg(arg_59_0:getUIName())
	arg_59_0:disposeEvent()
	arg_59_0:ClearTweens(false)

	arg_59_0._tf = nil

	local var_59_0 = PoolMgr.GetInstance()
	local var_59_1 = arg_59_0:getUIName()

	if arg_59_0._go ~= nil and var_59_1 then
		var_59_0:ReturnUI(var_59_1, arg_59_0._go)

		arg_59_0._go = nil
	end
end

function var_0_0.getTpl(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = (arg_60_2 or arg_60_0._tf):Find(arg_60_1)

	var_60_0:SetParent(arg_60_0._tf, false)
	SetActive(var_60_0, false)

	return var_60_0
end

function var_0_0.setSpriteTo(arg_61_0, arg_61_1, arg_61_2, arg_61_3)
	local var_61_0 = arg_61_2:GetComponent(typeof(Image))

	var_61_0.sprite = arg_61_0._tf:Find(arg_61_1):GetComponent(typeof(Image)).sprite

	if arg_61_3 then
		var_61_0:SetNativeSize()
	end
end

function var_0_0.setImageAmount(arg_62_0, arg_62_1, arg_62_2)
	arg_62_1:GetComponent(typeof(Image)).fillAmount = arg_62_2
end

function var_0_0.setVisible(arg_63_0, arg_63_1)
	arg_63_0:ShowOrHideResUI(arg_63_1)

	if arg_63_1 then
		arg_63_0:OnVisible()
	else
		arg_63_0:OnDisVisible()
	end

	setActiveViaLayer(arg_63_0._tf, arg_63_1)
end

function var_0_0.OnVisible(arg_64_0)
	return
end

function var_0_0.OnDisVisible(arg_65_0)
	return
end

function var_0_0.onBackPressed(arg_66_0)
	arg_66_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0
