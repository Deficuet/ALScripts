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

function var_0_0.preloadUIList(arg_4_0)
	return {
		arg_4_0:getUIName()
	}
end

function var_0_0.needCache(arg_5_0)
	return false
end

function var_0_0.forceGC(arg_6_0)
	return false
end

function var_0_0.loadingQueue(arg_7_0)
	return false
end

function var_0_0.lowerAdpter(arg_8_0)
	return false
end

function var_0_0.tempCache(arg_9_0)
	return false
end

function var_0_0.getGroupName(arg_10_0)
	return nil
end

function var_0_0.getLayerWeight(arg_11_0)
	return LayerWeightConst.BASE_LAYER
end

function var_0_0.preload(arg_12_0, arg_12_1)
	arg_12_1()
end

function var_0_0.loadUISync(arg_13_0, arg_13_1)
	local var_13_0 = LoadAndInstantiateSync("UI", arg_13_1, true, false)
	local var_13_1 = pg.UIMgr.GetInstance().UIMain

	var_13_0.transform:SetParent(var_13_1.transform, false)

	return var_13_0
end

function var_0_0.load(arg_14_0)
	local var_14_0
	local var_14_1 = Time.realtimeSinceStartup
	local var_14_2 = arg_14_0:getUIName()

	seriesAsync({
		function(arg_15_0)
			arg_14_0:preload(arg_15_0)
		end,
		function(arg_16_0)
			arg_14_0:LoadUIFromPool(var_14_2, function(arg_17_0)
				print("Loaded " .. var_14_2)

				var_14_0 = arg_17_0

				arg_16_0()
			end)
		end
	}, function()
		originalPrint("load " .. var_14_0.name .. " time cost: " .. Time.realtimeSinceStartup - var_14_1)

		local var_18_0 = pg.UIMgr.GetInstance().UIMain

		var_14_0.transform:SetParent(var_18_0.transform, false)

		if arg_14_0:tempCache() then
			PoolMgr.GetInstance():AddTempCache(var_14_2)
		end

		arg_14_0:onUILoaded(var_14_0)
	end)
end

function var_0_0.LoadUIFromPool(arg_19_0, arg_19_1, arg_19_2)
	PoolMgr.GetInstance():GetUI(arg_19_1, true, arg_19_2)
end

function var_0_0.getBGM(arg_20_0, arg_20_1)
	return getBgm(arg_20_1 or arg_20_0.__cname)
end

function var_0_0.PlayBGM(arg_21_0)
	local var_21_0 = arg_21_0:getBGM()

	if var_21_0 then
		pg.BgmMgr.GetInstance():Push(arg_21_0.__cname, var_21_0)
	end
end

function var_0_0.StopBgm(arg_22_0)
	if not arg_22_0.contextData then
		return
	end

	if arg_22_0.contextData.isLayer then
		pg.BgmMgr.GetInstance():Pop(arg_22_0.__cname)
	else
		pg.BgmMgr.GetInstance():Clear()
	end
end

function var_0_0.isLoaded(arg_23_0)
	return arg_23_0._isLoaded
end

function var_0_0.getGroupNameFromData(arg_24_0)
	local var_24_0

	if arg_24_0.contextData ~= nil and arg_24_0.contextData.LayerWeightMgr_groupName then
		var_24_0 = arg_24_0.contextData.LayerWeightMgr_groupName
	else
		var_24_0 = arg_24_0:getGroupName()
	end

	return var_24_0
end

function var_0_0.getWeightFromData(arg_25_0)
	local var_25_0

	if arg_25_0.contextData ~= nil and arg_25_0.contextData.LayerWeightMgr_weight then
		var_25_0 = arg_25_0.contextData.LayerWeightMgr_weight
	else
		var_25_0 = arg_25_0:getLayerWeight()
	end

	return var_25_0
end

function var_0_0.isLayer(arg_26_0)
	return arg_26_0.contextData ~= nil and arg_26_0.contextData.isLayer
end

function var_0_0.addToLayerMgr(arg_27_0)
	local var_27_0 = arg_27_0:getGroupNameFromData()
	local var_27_1 = arg_27_0:getWeightFromData()

	pg.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SYSTEM, arg_27_0._tf, {
		globalBlur = false,
		groupName = var_27_0,
		weight = var_27_1
	})
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
	"Main/blur_panel/adapt/top/option"
}

function var_0_0.onUILoaded(arg_28_0, arg_28_1)
	arg_28_0._go = arg_28_1
	arg_28_0._tf = arg_28_1 and arg_28_1.transform

	if arg_28_0:isLayer() then
		arg_28_0:addToLayerMgr()
	end

	pg.SeriesGuideMgr.GetInstance():dispatch({
		view = arg_28_0.__cname
	})
	pg.NewStoryMgr.GetInstance():OnSceneEnter({
		view = arg_28_0.__cname
	})

	arg_28_0._isLoaded = true

	pg.DelegateInfo.New(arg_28_0)

	arg_28_0.optionBtns = {}

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.optionsPath) do
		table.insert(arg_28_0.optionBtns, arg_28_0:findTF(iter_28_1))
	end

	setActiveViaLayer(arg_28_0._tf, true)
	arg_28_0:init()
	arg_28_0:emit(var_0_0.LOADED)
end

function var_0_0.ResUISettings(arg_29_0)
	return nil
end

function var_0_0.ShowOrHideResUI(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:ResUISettings()

	if not var_30_0 then
		return
	end

	if var_30_0 == true then
		var_30_0 = {
			anim = true,
			showType = PlayerResUI.TYPE_ALL
		}
	end

	pg.playerResUI:SetActive(setmetatable({
		active = arg_30_1,
		clear = not arg_30_1 and not arg_30_0:isLayer(),
		weight = var_30_0.weight or arg_30_0:getWeightFromData(),
		groupName = var_30_0.groupName or arg_30_0:getGroupNameFromData(),
		canvasOrder = var_30_0.order or false
	}, {
		__index = var_30_0
	}))
end

function var_0_0.onUIAnimEnd(arg_31_0, arg_31_1)
	arg_31_1()
end

function var_0_0.init(arg_32_0)
	return
end

function var_0_0.quickExitFunc(arg_33_0)
	arg_33_0:emit(var_0_0.ON_HOME)
end

function var_0_0.quickExit(arg_34_0)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0.optionBtns) do
		onButton(arg_34_0, iter_34_1, function()
			arg_34_0:quickExitFunc()
		end, SFX_PANEL)
	end
end

function var_0_0.enter(arg_36_0)
	arg_36_0:quickExit()
	arg_36_0:PlayBGM()
	arg_36_0:emit(var_0_0.DID_ENTER)

	if arg_36_0:lowerAdpter() then
		setActive(pg.CameraFixMgr.GetInstance().adpterTr, false)
	end

	if not arg_36_0._isCachedView then
		arg_36_0:didEnter()
		arg_36_0:ShowOrHideResUI(true)
	end

	if tobool(arg_36_0:loadingQueue()) and arg_36_0.contextData.resumeCallback then
		local var_36_0 = arg_36_0.contextData.resumeCallback

		arg_36_0.contextData.resumeCallback = nil

		var_36_0()
	end

	arg_36_0:emit(var_0_0.AVALIBLE)
	arg_36_0:onUIAnimEnd(function()
		pg.SeriesGuideMgr.GetInstance():start({
			view = arg_36_0.__cname,
			code = {
				pg.SeriesGuideMgr.CODES.MAINUI
			}
		})
		pg.NewGuideMgr.GetInstance():OnSceneEnter({
			view = arg_36_0.__cname
		})
	end)
end

function var_0_0.closeView(arg_38_0)
	if arg_38_0.contextData.isLayer then
		arg_38_0:emit(var_0_0.ON_CLOSE)
	else
		arg_38_0:emit(var_0_0.ON_BACK)
	end
end

function var_0_0.didEnter(arg_39_0)
	return
end

function var_0_0.willExit(arg_40_0)
	return
end

function var_0_0.exit(arg_41_0)
	arg_41_0.exited = true

	arg_41_0:StopBgm()
	pg.DelegateInfo.Dispose(arg_41_0)
	arg_41_0:willExit()
	arg_41_0:ShowOrHideResUI(false)
	arg_41_0:detach()

	if arg_41_0:lowerAdpter() then
		setActive(pg.CameraFixMgr.GetInstance().adpterTr, true)
	end

	pg.NewGuideMgr.GetInstance():OnSceneExit({
		view = arg_41_0.__cname
	})
	pg.NewStoryMgr.GetInstance():OnSceneExit({
		view = arg_41_0.__cname
	})
	arg_41_0:emit(var_0_0.DID_EXIT)
end

function var_0_0.PlayUIAnimation(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	local var_42_0 = arg_42_1:GetComponent(typeof(Animation))
	local var_42_1 = arg_42_1:GetComponent(typeof(UIEventTrigger))

	var_42_1.didExit:RemoveAllListeners()
	var_42_1.didExit:AddListener(function()
		var_42_1.didExit:RemoveAllListeners()
		arg_42_3()
	end)
	var_42_0:Play(arg_42_2)
end

function var_0_0.attach(arg_44_0, arg_44_1)
	return
end

function var_0_0.ClearTweens(arg_45_0, arg_45_1)
	arg_45_0:cleanManagedTween(arg_45_1)
end

function var_0_0.RemoveTempCache(arg_46_0)
	local var_46_0 = arg_46_0:getUIName()

	PoolMgr.GetInstance():DelTempCache(var_46_0)
end

function var_0_0.detach(arg_47_0, arg_47_1)
	arg_47_0._isLoaded = false

	pg.LayerWeightMgr.GetInstance():DelFromOverlay(arg_47_0._tf)
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_47_0:getUIName())
	arg_47_0:disposeEvent()
	arg_47_0:ClearTweens(false)

	arg_47_0._tf = nil

	local var_47_0 = PoolMgr.GetInstance()
	local var_47_1 = arg_47_0:getUIName()

	if arg_47_0._go ~= nil and var_47_1 then
		var_47_0:ReturnUI(var_47_1, arg_47_0._go)

		arg_47_0._go = nil
	end
end

function var_0_0.findGO(arg_48_0, arg_48_1, arg_48_2)
	assert(arg_48_0._go, "game object should exist")

	return findGO(arg_48_2 or arg_48_0._go, arg_48_1)
end

function var_0_0.findTF(arg_49_0, arg_49_1, arg_49_2)
	assert(arg_49_0._tf, "transform should exist")

	return findTF(arg_49_2 or arg_49_0._tf, arg_49_1)
end

function var_0_0.getTpl(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_0:findTF(arg_50_1, arg_50_2)

	var_50_0:SetParent(arg_50_0._tf, false)
	SetActive(var_50_0, false)

	return var_50_0
end

function var_0_0.setSpriteTo(arg_51_0, arg_51_1, arg_51_2, arg_51_3)
	local var_51_0 = arg_51_2:GetComponent(typeof(Image))

	var_51_0.sprite = arg_51_0:findTF(arg_51_1):GetComponent(typeof(Image)).sprite

	if arg_51_3 then
		var_51_0:SetNativeSize()
	end
end

function var_0_0.setImageAmount(arg_52_0, arg_52_1, arg_52_2)
	arg_52_1:GetComponent(typeof(Image)).fillAmount = arg_52_2
end

function var_0_0.setVisible(arg_53_0, arg_53_1)
	arg_53_0:ShowOrHideResUI(arg_53_1)

	if arg_53_1 then
		arg_53_0:OnVisible()
	else
		arg_53_0:OnDisVisible()
	end

	setActiveViaLayer(arg_53_0._tf, arg_53_1)
end

function var_0_0.OnVisible(arg_54_0)
	return
end

function var_0_0.OnDisVisible(arg_55_0)
	return
end

function var_0_0.onBackPressed(arg_56_0)
	arg_56_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0
