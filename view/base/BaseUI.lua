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

function var_0_0.needCache(arg_7_0)
	return false
end

function var_0_0.tempCache(arg_8_0)
	return false
end

function var_0_0.forceGC(arg_9_0)
	return false
end

function var_0_0.forceRatio(arg_10_0)
	return nil
end

function var_0_0.loadingQueue(arg_11_0)
	return false
end

function var_0_0.setLayerMgrRegister(arg_12_0, arg_12_1)
	if not arg_12_0.contextData then
		return
	end

	local var_12_0 = arg_12_0:getGroupName()

	if arg_12_1 then
		pg.LayerWeightMgr.GetInstance():RegisterGroupWeight(var_12_0)
	else
		pg.LayerWeightMgr.GetInstance():RemoveGroupWeight(var_12_0)
	end
end

function var_0_0.preload(arg_13_0, arg_13_1)
	arg_13_1()
end

function var_0_0.loadUISync(arg_14_0, arg_14_1)
	local var_14_0 = LoadAndInstantiateSync("UI", arg_14_1, true, false)
	local var_14_1 = pg.UIMgr.GetInstance().UIMain

	var_14_0.transform:SetParent(var_14_1.transform, false)

	return var_14_0
end

function var_0_0.GCWhenAwake(arg_15_0)
	return tobool(arg_15_0:loadingQueue())
end

function var_0_0.load(arg_16_0)
	arg_16_0:setLayerMgrRegister(true)

	local var_16_0
	local var_16_1 = Time.realtimeSinceStartup
	local var_16_2 = arg_16_0:getUIName()

	seriesAsync({
		function(arg_17_0)
			if arg_16_0:GCWhenAwake() then
				gcAll(true)
			end

			arg_16_0:preload(arg_17_0)
		end,
		function(arg_18_0)
			arg_16_0:LoadUIFromPool(var_16_2, function(arg_19_0)
				print("Loaded " .. var_16_2)

				var_16_0 = arg_19_0

				arg_18_0()
			end)
		end
	}, function()
		originalPrint("load " .. var_16_0.name .. " time cost: " .. Time.realtimeSinceStartup - var_16_1)
		arg_16_0:SetUIParent(var_16_0)

		if arg_16_0:CheckTempCache() then
			PoolMgr.GetInstance():KeepUICache(var_16_2, true)
		end

		arg_16_0:onUILoaded(var_16_0)
	end)
end

function var_0_0.SetUIParent(arg_21_0, arg_21_1)
	local var_21_0 = pg.UIMgr.GetInstance().UIMain

	arg_21_1.transform:SetParent(var_21_0.transform, false)
end

function var_0_0.LoadUIFromPool(arg_22_0, arg_22_1, arg_22_2)
	PoolMgr.GetInstance():GetUI(arg_22_1, true, arg_22_2)
end

function var_0_0.getBGM(arg_23_0, arg_23_1)
	return getBgm(arg_23_1 or arg_23_0.__cname)
end

function var_0_0.PlayBGM(arg_24_0)
	local var_24_0 = arg_24_0:getBGM()

	if var_24_0 then
		pg.BgmMgr.GetInstance():Push(arg_24_0.__cname, var_24_0)
	end
end

function var_0_0.StopBgm(arg_25_0)
	if not arg_25_0.contextData then
		return
	end

	if arg_25_0.contextData.isLayer then
		pg.BgmMgr.GetInstance():Pop(arg_25_0.__cname)
	else
		pg.BgmMgr.GetInstance():Clear()
	end
end

function var_0_0.isLoaded(arg_26_0)
	return arg_26_0._isLoaded
end

function var_0_0.CheckTempCache(arg_27_0)
	return arg_27_0:tempCache() and arg_27_0:isLayer()
end

function var_0_0.isLayer(arg_28_0)
	return arg_28_0.contextData ~= nil and arg_28_0.contextData.isLayer
end

function var_0_0.Add2Overlay(arg_29_0, arg_29_1, arg_29_2)
	if not arg_29_0.contextData then
		return
	end

	arg_29_2 = arg_29_2 or {}
	arg_29_2.groupName = arg_29_0:getGroupName()

	pg.LayerWeightMgr.GetInstance():Add2Overlay(arg_29_1, arg_29_2)
end

function var_0_0.DelFromOverlay(arg_30_0, arg_30_1, ...)
	if not arg_30_0.contextData then
		return
	end

	pg.LayerWeightMgr.GetInstance():DelFromOverlay(arg_30_1, ...)
end

function var_0_0.OverlayPanel(arg_31_0, arg_31_1, arg_31_2)
	arg_31_2 = arg_31_2 or {}
	arg_31_2.type = LayerWeightConst.UI_TYPE_SUB

	arg_31_0:Add2Overlay(arg_31_1, arg_31_2)
end

function var_0_0.BlurPanel(arg_32_0, arg_32_1, arg_32_2)
	arg_32_2 = arg_32_2 or {}
	arg_32_2.type = LayerWeightConst.UI_TYPE_SUB
	arg_32_2.globalBlur = true

	arg_32_0:Add2Overlay(arg_32_1, arg_32_2)
end

function var_0_0.UnOverlayPanel(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0:DelFromOverlay(arg_33_1, arg_33_2 or arg_33_0.UIMain)
end

function var_0_0.TempOverlayPanelPB(arg_34_0, arg_34_1, arg_34_2)
	if not arg_34_0.contextData then
		return
	end

	arg_34_2 = arg_34_2 or {}
	arg_34_2.groupName = arg_34_0:getGroupName()

	pg.UIMgr.GetInstance():TempOverlayPanelPB(arg_34_1, arg_34_2)
end

function var_0_0.TempUnOverlayPanelPB(arg_35_0, arg_35_1, arg_35_2)
	if not arg_35_0.contextData then
		return
	end

	pg.UIMgr.GetInstance():TempUnOverlayPanelPB(arg_35_1, arg_35_2)
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

function var_0_0.onUILoaded(arg_36_0, arg_36_1)
	arg_36_0._go = arg_36_1
	arg_36_0._tf = arg_36_1 and arg_36_1.transform

	arg_36_0:Add2Overlay(arg_36_0:getDefaultUI(), {
		type = LayerWeightConst.UI_TYPE_SYSTEM
	})
	pg.SeriesGuideMgr.GetInstance():dispatch({
		view = arg_36_0.__cname
	})
	pg.NewStoryMgr.GetInstance():OnSceneEnter({
		view = arg_36_0.__cname
	})

	arg_36_0._isLoaded = true

	pg.DelegateInfo.New(arg_36_0)

	arg_36_0.optionBtns = {}

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.optionsPath) do
		table.insert(arg_36_0.optionBtns, arg_36_0._tf:Find(iter_36_1))
	end

	setActiveViaLayer(arg_36_0._tf, true)
	bindComponent(arg_36_0, arg_36_0._go)
	arg_36_0:init()
	arg_36_0:emit(var_0_0.LOADED)
end

function var_0_0.ResUISettings(arg_37_0)
	return nil
end

function var_0_0.ShowOrHideResUI(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0:ResUISettings()

	if not var_38_0 then
		return
	end

	if var_38_0 == true then
		var_38_0 = {
			anim = true,
			showType = PlayerResUI.TYPE_ALL
		}
	end

	local var_38_1 = arg_38_0:getGroupName()

	if arg_38_1 then
		pg.playerResUI:SetSettings(var_38_1, setmetatable({
			groupName = var_38_1
		}, {
			__index = var_38_0
		}))
	else
		pg.playerResUI:RemoveSettings(var_38_1)
	end
end

function var_0_0.onUIAnimEnd(arg_39_0, arg_39_1)
	arg_39_1()
end

function var_0_0.init(arg_40_0)
	return
end

function var_0_0.quickExitFunc(arg_41_0)
	arg_41_0:emit(var_0_0.ON_HOME)
end

function var_0_0.quickExit(arg_42_0)
	for iter_42_0, iter_42_1 in ipairs(arg_42_0.optionBtns) do
		onButton(arg_42_0, iter_42_1, function()
			arg_42_0:quickExitFunc()
		end, SFX_PANEL)
	end
end

function var_0_0.enter(arg_44_0)
	arg_44_0:quickExit()
	arg_44_0:PlayBGM()
	arg_44_0:emit(var_0_0.DID_ENTER)

	if arg_44_0:forceRatio() then
		pg.CameraFixMgr.GetInstance():SetForceRatio(arg_44_0:forceRatio())
	end

	if not arg_44_0._isCachedView then
		arg_44_0:didEnter()
		arg_44_0:ShowOrHideResUI(true)
	end

	if tobool(arg_44_0:loadingQueue()) and arg_44_0.contextData.resumeCallback then
		local var_44_0 = arg_44_0.contextData.resumeCallback

		arg_44_0.contextData.resumeCallback = nil

		var_44_0()
	end

	arg_44_0:emit(var_0_0.AVALIBLE)
	arg_44_0:onUIAnimEnd(function()
		pg.SeriesGuideMgr.GetInstance():start({
			view = arg_44_0.__cname,
			code = {
				pg.SeriesGuideMgr.CODES.MAINUI
			}
		})
		pg.NewGuideMgr.GetInstance():OnSceneEnter({
			view = arg_44_0.__cname
		})
	end)
end

function var_0_0.closeView(arg_46_0)
	if arg_46_0.contextData.isLayer then
		arg_46_0:emit(var_0_0.ON_CLOSE)
	else
		arg_46_0:emit(var_0_0.ON_BACK)
	end
end

function var_0_0.didEnter(arg_47_0)
	return
end

function var_0_0.willExit(arg_48_0)
	return
end

function var_0_0.exit(arg_49_0)
	arg_49_0.exited = true

	arg_49_0:StopBgm()
	pg.DelegateInfo.Dispose(arg_49_0)
	arg_49_0:willExit()
	arg_49_0:ShowOrHideResUI(false)
	arg_49_0:DelFromOverlay(arg_49_0:getDefaultUI())
	arg_49_0:setLayerMgrRegister(false)
	arg_49_0:detach()

	if arg_49_0:forceRatio() then
		pg.CameraFixMgr.GetInstance():SetForceRatio(nil)
	end

	pg.NewGuideMgr.GetInstance():OnSceneExit({
		view = arg_49_0.__cname
	})
	pg.NewStoryMgr.GetInstance():OnSceneExit({
		view = arg_49_0.__cname
	})
	arg_49_0:emit(var_0_0.DID_EXIT)
end

function var_0_0.PlayUIAnimation(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	local var_50_0 = arg_50_1:GetComponent(typeof(Animation))
	local var_50_1 = arg_50_1:GetComponent(typeof(UIEventTrigger))

	var_50_1.didExit:RemoveAllListeners()
	var_50_1.didExit:AddListener(function()
		var_50_1.didExit:RemoveAllListeners()
		arg_50_3()
	end)
	var_50_0:Play(arg_50_2)
end

function var_0_0.attach(arg_52_0, arg_52_1)
	return
end

function var_0_0.ClearTweens(arg_53_0, arg_53_1)
	arg_53_0:cleanManagedTween(arg_53_1)
end

function var_0_0.detach(arg_54_0, arg_54_1)
	arg_54_0._isLoaded = false

	pg.DynamicBgMgr.GetInstance():ClearBg(arg_54_0:getUIName())
	arg_54_0:disposeEvent()
	arg_54_0:ClearTweens(false)

	arg_54_0._tf = nil

	local var_54_0 = PoolMgr.GetInstance()
	local var_54_1 = arg_54_0:getUIName()

	if arg_54_0._go ~= nil and var_54_1 then
		var_54_0:ReturnUI(var_54_1, arg_54_0._go)

		arg_54_0._go = nil
	end
end

function var_0_0.getTpl(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = (arg_55_2 or arg_55_0._tf):Find(arg_55_1)

	var_55_0:SetParent(arg_55_0._tf, false)
	SetActive(var_55_0, false)

	return var_55_0
end

function var_0_0.setSpriteTo(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	local var_56_0 = arg_56_2:GetComponent(typeof(Image))

	var_56_0.sprite = arg_56_0._tf:Find(arg_56_1):GetComponent(typeof(Image)).sprite

	if arg_56_3 then
		var_56_0:SetNativeSize()
	end
end

function var_0_0.setImageAmount(arg_57_0, arg_57_1, arg_57_2)
	arg_57_1:GetComponent(typeof(Image)).fillAmount = arg_57_2
end

function var_0_0.setVisible(arg_58_0, arg_58_1)
	arg_58_0:ShowOrHideResUI(arg_58_1)

	if arg_58_1 then
		arg_58_0:OnVisible()
	else
		arg_58_0:OnDisVisible()
	end

	setActiveViaLayer(arg_58_0._tf, arg_58_1)
end

function var_0_0.OnVisible(arg_59_0)
	return
end

function var_0_0.OnDisVisible(arg_60_0)
	return
end

function var_0_0.onBackPressed(arg_61_0)
	arg_61_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0
