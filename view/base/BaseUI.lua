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

function var_0_0.load(arg_15_0)
	arg_15_0:setLayerMgrRegister(true)

	local var_15_0
	local var_15_1 = Time.realtimeSinceStartup
	local var_15_2 = arg_15_0:getUIName()

	seriesAsync({
		function(arg_16_0)
			if tobool(arg_15_0:loadingQueue()) then
				gcAll(true)
			end

			arg_15_0:preload(arg_16_0)
		end,
		function(arg_17_0)
			arg_15_0:LoadUIFromPool(var_15_2, function(arg_18_0)
				print("Loaded " .. var_15_2)

				var_15_0 = arg_18_0

				arg_17_0()
			end)
		end
	}, function()
		originalPrint("load " .. var_15_0.name .. " time cost: " .. Time.realtimeSinceStartup - var_15_1)
		arg_15_0:SetUIParent(var_15_0)

		if arg_15_0:CheckTempCache() then
			PoolMgr.GetInstance():KeepUICache(var_15_2, true)
		end

		arg_15_0:onUILoaded(var_15_0)
	end)
end

function var_0_0.SetUIParent(arg_20_0, arg_20_1)
	local var_20_0 = pg.UIMgr.GetInstance().UIMain

	arg_20_1.transform:SetParent(var_20_0.transform, false)
end

function var_0_0.LoadUIFromPool(arg_21_0, arg_21_1, arg_21_2)
	PoolMgr.GetInstance():GetUI(arg_21_1, true, arg_21_2)
end

function var_0_0.getBGM(arg_22_0, arg_22_1)
	return getBgm(arg_22_1 or arg_22_0.__cname)
end

function var_0_0.PlayBGM(arg_23_0)
	local var_23_0 = arg_23_0:getBGM()

	if var_23_0 then
		pg.BgmMgr.GetInstance():Push(arg_23_0.__cname, var_23_0)
	end
end

function var_0_0.StopBgm(arg_24_0)
	if not arg_24_0.contextData then
		return
	end

	if arg_24_0.contextData.isLayer then
		pg.BgmMgr.GetInstance():Pop(arg_24_0.__cname)
	else
		pg.BgmMgr.GetInstance():Clear()
	end
end

function var_0_0.isLoaded(arg_25_0)
	return arg_25_0._isLoaded
end

function var_0_0.CheckTempCache(arg_26_0)
	return arg_26_0:tempCache() and arg_26_0:isLayer()
end

function var_0_0.isLayer(arg_27_0)
	return arg_27_0.contextData ~= nil and arg_27_0.contextData.isLayer
end

function var_0_0.Add2Overlay(arg_28_0, arg_28_1, arg_28_2)
	if not arg_28_0.contextData then
		return
	end

	arg_28_2 = arg_28_2 or {}
	arg_28_2.groupName = arg_28_0:getGroupName()

	pg.LayerWeightMgr.GetInstance():Add2Overlay(arg_28_1, arg_28_2)
end

function var_0_0.DelFromOverlay(arg_29_0, arg_29_1, ...)
	if not arg_29_0.contextData then
		return
	end

	pg.LayerWeightMgr.GetInstance():DelFromOverlay(arg_29_1, ...)
end

function var_0_0.OverlayPanel(arg_30_0, arg_30_1, arg_30_2)
	arg_30_2 = arg_30_2 or {}
	arg_30_2.type = LayerWeightConst.UI_TYPE_SUB

	arg_30_0:Add2Overlay(arg_30_1, arg_30_2)
end

function var_0_0.BlurPanel(arg_31_0, arg_31_1, arg_31_2)
	arg_31_2 = arg_31_2 or {}
	arg_31_2.type = LayerWeightConst.UI_TYPE_SUB
	arg_31_2.globalBlur = true

	arg_31_0:Add2Overlay(arg_31_1, arg_31_2)
end

function var_0_0.UnOverlayPanel(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0:DelFromOverlay(arg_32_1, arg_32_2 or arg_32_0.UIMain)
end

function var_0_0.TempOverlayPanelPB(arg_33_0, arg_33_1, arg_33_2)
	if not arg_33_0.contextData then
		return
	end

	arg_33_2 = arg_33_2 or {}
	arg_33_2.groupName = arg_33_0:getGroupName()

	pg.UIMgr.GetInstance():TempOverlayPanelPB(arg_33_1, arg_33_2)
end

function var_0_0.TempUnOverlayPanelPB(arg_34_0, arg_34_1, arg_34_2)
	if not arg_34_0.contextData then
		return
	end

	pg.UIMgr.GetInstance():TempUnOverlayPanelPB(arg_34_1, arg_34_2)
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

function var_0_0.onUILoaded(arg_35_0, arg_35_1)
	arg_35_0._go = arg_35_1
	arg_35_0._tf = arg_35_1 and arg_35_1.transform

	arg_35_0:Add2Overlay(arg_35_0:getDefaultUI(), {
		type = LayerWeightConst.UI_TYPE_SYSTEM
	})
	pg.SeriesGuideMgr.GetInstance():dispatch({
		view = arg_35_0.__cname
	})
	pg.NewStoryMgr.GetInstance():OnSceneEnter({
		view = arg_35_0.__cname
	})

	arg_35_0._isLoaded = true

	pg.DelegateInfo.New(arg_35_0)

	arg_35_0.optionBtns = {}

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.optionsPath) do
		table.insert(arg_35_0.optionBtns, arg_35_0:findTF(iter_35_1))
	end

	setActiveViaLayer(arg_35_0._tf, true)
	bindComponent(arg_35_0, arg_35_0._go)
	arg_35_0:init()
	arg_35_0:emit(var_0_0.LOADED)
end

function var_0_0.ResUISettings(arg_36_0)
	return nil
end

function var_0_0.ShowOrHideResUI(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0:ResUISettings()

	if not var_37_0 then
		return
	end

	if var_37_0 == true then
		var_37_0 = {
			anim = true,
			showType = PlayerResUI.TYPE_ALL
		}
	end

	local var_37_1 = arg_37_0:getGroupName()

	if arg_37_1 then
		pg.playerResUI:SetSettings(var_37_1, setmetatable({
			groupName = var_37_1
		}, {
			__index = var_37_0
		}))
	else
		pg.playerResUI:RemoveSettings(var_37_1)
	end
end

function var_0_0.onUIAnimEnd(arg_38_0, arg_38_1)
	arg_38_1()
end

function var_0_0.init(arg_39_0)
	return
end

function var_0_0.quickExitFunc(arg_40_0)
	arg_40_0:emit(var_0_0.ON_HOME)
end

function var_0_0.quickExit(arg_41_0)
	for iter_41_0, iter_41_1 in ipairs(arg_41_0.optionBtns) do
		onButton(arg_41_0, iter_41_1, function()
			arg_41_0:quickExitFunc()
		end, SFX_PANEL)
	end
end

function var_0_0.enter(arg_43_0)
	arg_43_0:quickExit()
	arg_43_0:PlayBGM()
	arg_43_0:emit(var_0_0.DID_ENTER)

	if arg_43_0:forceRatio() then
		pg.CameraFixMgr.GetInstance():SetForceRatio(arg_43_0:forceRatio())
	end

	if not arg_43_0._isCachedView then
		arg_43_0:didEnter()
		arg_43_0:ShowOrHideResUI(true)
	end

	if tobool(arg_43_0:loadingQueue()) and arg_43_0.contextData.resumeCallback then
		local var_43_0 = arg_43_0.contextData.resumeCallback

		arg_43_0.contextData.resumeCallback = nil

		var_43_0()
	end

	arg_43_0:emit(var_0_0.AVALIBLE)
	arg_43_0:onUIAnimEnd(function()
		pg.SeriesGuideMgr.GetInstance():start({
			view = arg_43_0.__cname,
			code = {
				pg.SeriesGuideMgr.CODES.MAINUI
			}
		})
		pg.NewGuideMgr.GetInstance():OnSceneEnter({
			view = arg_43_0.__cname
		})
	end)
end

function var_0_0.closeView(arg_45_0)
	if arg_45_0.contextData.isLayer then
		arg_45_0:emit(var_0_0.ON_CLOSE)
	else
		arg_45_0:emit(var_0_0.ON_BACK)
	end
end

function var_0_0.didEnter(arg_46_0)
	return
end

function var_0_0.willExit(arg_47_0)
	return
end

function var_0_0.exit(arg_48_0)
	arg_48_0.exited = true

	arg_48_0:StopBgm()
	pg.DelegateInfo.Dispose(arg_48_0)
	arg_48_0:willExit()
	arg_48_0:ShowOrHideResUI(false)
	arg_48_0:DelFromOverlay(arg_48_0:getDefaultUI())
	arg_48_0:setLayerMgrRegister(false)
	arg_48_0:detach()

	if arg_48_0:forceRatio() then
		pg.CameraFixMgr.GetInstance():SetForceRatio(nil)
	end

	pg.NewGuideMgr.GetInstance():OnSceneExit({
		view = arg_48_0.__cname
	})
	pg.NewStoryMgr.GetInstance():OnSceneExit({
		view = arg_48_0.__cname
	})
	arg_48_0:emit(var_0_0.DID_EXIT)
end

function var_0_0.PlayUIAnimation(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	local var_49_0 = arg_49_1:GetComponent(typeof(Animation))
	local var_49_1 = arg_49_1:GetComponent(typeof(UIEventTrigger))

	var_49_1.didExit:RemoveAllListeners()
	var_49_1.didExit:AddListener(function()
		var_49_1.didExit:RemoveAllListeners()
		arg_49_3()
	end)
	var_49_0:Play(arg_49_2)
end

function var_0_0.attach(arg_51_0, arg_51_1)
	return
end

function var_0_0.ClearTweens(arg_52_0, arg_52_1)
	arg_52_0:cleanManagedTween(arg_52_1)
end

function var_0_0.detach(arg_53_0, arg_53_1)
	arg_53_0._isLoaded = false

	pg.DynamicBgMgr.GetInstance():ClearBg(arg_53_0:getUIName())
	arg_53_0:disposeEvent()
	arg_53_0:ClearTweens(false)

	arg_53_0._tf = nil

	local var_53_0 = PoolMgr.GetInstance()
	local var_53_1 = arg_53_0:getUIName()

	if arg_53_0._go ~= nil and var_53_1 then
		var_53_0:ReturnUI(var_53_1, arg_53_0._go)

		arg_53_0._go = nil
	end
end

function var_0_0.findGO(arg_54_0, arg_54_1, arg_54_2)
	assert(arg_54_0._go, "game object should exist")

	return findGO(arg_54_2 or arg_54_0._go, arg_54_1)
end

function var_0_0.findTF(arg_55_0, arg_55_1, arg_55_2)
	assert(arg_55_0._tf, "transform should exist")

	return findTF(arg_55_2 or arg_55_0._tf, arg_55_1)
end

function var_0_0.getTpl(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = arg_56_0:findTF(arg_56_1, arg_56_2)

	var_56_0:SetParent(arg_56_0._tf, false)
	SetActive(var_56_0, false)

	return var_56_0
end

function var_0_0.setSpriteTo(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
	local var_57_0 = arg_57_2:GetComponent(typeof(Image))

	var_57_0.sprite = arg_57_0:findTF(arg_57_1):GetComponent(typeof(Image)).sprite

	if arg_57_3 then
		var_57_0:SetNativeSize()
	end
end

function var_0_0.setImageAmount(arg_58_0, arg_58_1, arg_58_2)
	arg_58_1:GetComponent(typeof(Image)).fillAmount = arg_58_2
end

function var_0_0.setVisible(arg_59_0, arg_59_1)
	arg_59_0:ShowOrHideResUI(arg_59_1)

	if arg_59_1 then
		arg_59_0:OnVisible()
	else
		arg_59_0:OnDisVisible()
	end

	setActiveViaLayer(arg_59_0._tf, arg_59_1)
end

function var_0_0.OnVisible(arg_60_0)
	return
end

function var_0_0.OnDisVisible(arg_61_0)
	return
end

function var_0_0.onBackPressed(arg_62_0)
	arg_62_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0
