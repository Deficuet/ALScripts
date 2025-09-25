local var_0_0 = class("YoumiyaStrongholdLayer", import("view.base.BaseUI"))
local var_0_1 = pg.activity_ryza_furniture
local var_0_2 = pg.furniture_data_template

function var_0_0.getUIName(arg_1_0)
	return "YoumiyaStrongholdUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.adapt = arg_2_0._tf:Find("adapt")
	arg_2_0.backBtn = arg_2_0.adapt:Find("backBtn")
	arg_2_0.homeBtn = arg_2_0.adapt:Find("homeBtn")
	arg_2_0.desc = arg_2_0.adapt:Find("desc/text")
	arg_2_0.res = arg_2_0.adapt:Find("res")
	arg_2_0.strongholdPage = arg_2_0._tf:Find("pages/strongholdPage")
	arg_2_0.detailPage = arg_2_0._tf:Find("pages/detailPage")
	arg_2_0.makeFurniturePanel = arg_2_0._tf:Find("pages/makeFurniturePanel")
	arg_2_0.awardList = UIItemList.New(arg_2_0.detailPage:Find("detail/awardList"), arg_2_0.detailPage:Find("detail/awardList/stage"))
	arg_2_0.isOnMake = false

	setText(arg_2_0.desc, i18n("yumia_stronghold_2"))

	for iter_2_0 = 1, 3 do
		setText(arg_2_0.strongholdPage:Find(iter_2_0 .. "/comfort/text"), i18n("yumia_stronghold_3"))

		local var_2_0 = arg_2_0.detailPage:Find("detail/stronghold/furnitures/" .. iter_2_0)

		for iter_2_1 = 1, var_2_0.childCount do
			local var_2_1 = var_2_0:Find(iter_2_1)

			for iter_2_2 = 0, var_2_1.childCount - 1 do
				local var_2_2 = var_2_1:GetChild(iter_2_2)

				setText(var_2_2:Find("comfort/comf/text"), i18n("yumia_stronghold_3"))
			end
		end

		setText(arg_2_0.detailPage:Find("info/" .. iter_2_0 .. "/comfort/text"), i18n("yumia_stronghold_3"))
	end

	setText(arg_2_0.detailPage:Find("detail/progress/Root/text"), i18n("yumia_stronghold_4"))
	setText(arg_2_0.detailPage:Find("detail/awardTitle/text"), i18n("yumia_stronghold_5"))
	setText(arg_2_0.detailPage:Find("detail/awardList/stage/got/text"), i18n("yumia_stronghold_6"))
	setText(arg_2_0.makeFurniturePanel:Find("panel/complete/root/text"), i18n("yumia_stronghold_7"))
	setText(arg_2_0.makeFurniturePanel:Find("panel/comfort/title"), i18n("yumia_stronghold_3"))
	setText(arg_2_0.makeFurniturePanel:Find("panel/consume/title"), i18n("yumia_stronghold_8"))
	setText(arg_2_0.makeFurniturePanel:Find("panel/consume/text"), i18n("yumia_stronghold_9"))
	setText(arg_2_0.makeFurniturePanel:Find("panel/makeBtn/text"), i18n("yumia_stronghold_10"))

	arg_2_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_3_0, arg_3_1)
		arg_2_0:UpdateAdapt()
	end)

	local var_2_3 = arg_2_0._tf.rect.height

	if var_2_3 > 1440 then
		arg_2_0.adapt:GetComponent(typeof(RectTransform)).sizeDelta = Vector2(0, 1440 - var_2_3)
		arg_2_0.makeFurniturePanel:GetComponent(typeof(RectTransform)).sizeDelta = Vector2(0, 1440 - var_2_3)
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf, false)
	arg_2_0._tf:GetComponent(typeof(DftAniEvent)):SetTriggerEvent(function()
		for iter_4_0 = 0, 2 do
			arg_2_0.strongholdPage:GetChild(iter_4_0):GetComponent(typeof(Animation)):Play("Anim_YoumiyaStrongholdUI_Strongholdpage01_In")
		end
	end)

	local var_2_4 = arg_2_0.detailPage:GetComponent(typeof(DftAniEvent))

	var_2_4:SetTriggerEvent(function()
		for iter_5_0 = 0, 2 do
			local var_5_0 = arg_2_0.detailPage:Find("info"):GetChild(iter_5_0)
			local var_5_1 = var_5_0:GetComponent(typeof(Animation))

			if isActive(var_5_0) then
				var_5_1:Play("Anim_YoumiyaStrongholdUI_Strongholdpage01_In")
			end
		end
	end)
	var_2_4:SetEndEvent(function()
		for iter_6_0 = 1, 3 do
			local var_6_0 = arg_2_0.detailPage:Find("detail/stronghold/furnitures/" .. iter_6_0)

			for iter_6_1 = 1, var_6_0.childCount do
				local var_6_1 = var_6_0:Find(iter_6_1)

				for iter_6_2 = 0, var_6_1.childCount - 1 do
					local var_6_2 = var_6_1:GetChild(iter_6_2)

					setActive(var_6_2:Find("comfort/icon/VX"), true)
				end
			end
		end
	end)
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:InitData()
	arg_7_0:UpdateAdapt()
	onButton(arg_7_0, arg_7_0.backBtn, function()
		arg_7_0:GoBack()
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0.homeBtn, function()
		arg_7_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	setActive(arg_7_0.strongholdPage, true)
	setActive(arg_7_0.detailPage, false)
	setActive(arg_7_0.makeFurniturePanel, false)
	arg_7_0:RefreshView()
end

function var_0_0.UpdateAdapt(arg_10_0)
	local var_10_0 = 1.3333333333333333
	local var_10_1 = 2.1666666666666665
	local var_10_2 = pg.CameraFixMgr.GetInstance()
	local var_10_3 = var_10_2.currentWidth / var_10_2.currentHeight
	local var_10_4 = math.clamp(var_10_3, var_10_0, var_10_1)

	arg_10_0._tf:GetComponent(typeof(AspectRatioFitter)).aspectRatio = var_10_4

	setSizeDelta(arg_10_0._tf:Find("adapt"), {
		x = 0,
		y = 0
	})
end

function var_0_0.InitData(arg_11_0)
	arg_11_0.activityProxy = getProxy(ActivityProxy)
	arg_11_0.allFurnitureCount = {
		0,
		0,
		0
	}
	arg_11_0.allComfortCount = {
		0,
		0,
		0
	}

	for iter_11_0 = 1, 3 do
		local var_11_0 = var_0_1.get_id_list_by_type[iter_11_0]

		arg_11_0.allFurnitureCount[iter_11_0] = #var_11_0

		for iter_11_1, iter_11_2 in ipairs(var_11_0) do
			local var_11_1 = var_0_1[iter_11_2]

			arg_11_0.allComfortCount[iter_11_0] = arg_11_0.allComfortCount[iter_11_0] + var_11_1.com_add
		end
	end

	arg_11_0.awardInfos = pg.activity_template[ActivityConst.YUMIA_BASE_ACT_ID].config_client.rewards
end

function var_0_0.RefreshData(arg_12_0)
	arg_12_0.items = arg_12_0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK):GetItems()
	arg_12_0.activity = arg_12_0.activityProxy:getActivityById(ActivityConst.YUMIA_BASE_ACT_ID)
	arg_12_0.okFurnitureIds = arg_12_0.activity:getData1List()
	arg_12_0.gotAwardIndex = {
		0,
		0,
		0
	}

	for iter_12_0 = 1, 3 do
		arg_12_0.gotAwardIndex[iter_12_0] = arg_12_0.activity:getKVPList(1, iter_12_0)
	end

	arg_12_0.furnitureCount = {
		0,
		0,
		0
	}
	arg_12_0.comfortCount = {
		0,
		0,
		0
	}

	for iter_12_1 = 1, 3 do
		local var_12_0 = var_0_1.get_id_list_by_type[iter_12_1]

		for iter_12_2, iter_12_3 in ipairs(var_12_0) do
			if table.contains(arg_12_0.okFurnitureIds, iter_12_3) then
				local var_12_1 = var_0_1[iter_12_3]

				arg_12_0.furnitureCount[iter_12_1] = arg_12_0.furnitureCount[iter_12_1] + 1
				arg_12_0.comfortCount[iter_12_1] = arg_12_0.comfortCount[iter_12_1] + var_12_1.com_add
			end
		end
	end
end

function var_0_0.SetRes(arg_13_0, arg_13_1)
	local var_13_0 = getProxy(PlayerProxy):getRawData()
	local var_13_1 = {
		{
			138,
			arg_13_0:GetItemCount(138)
		},
		{
			139,
			arg_13_0:GetItemCount(139)
		},
		{
			140,
			arg_13_0:GetItemCount(140)
		},
		{
			141,
			arg_13_0:GetItemCount(141)
		},
		{
			6,
			arg_13_0:GetItemCount(6)
		}
	}

	for iter_13_0 = 0, arg_13_1.childCount - 1 do
		setActive(arg_13_1:GetChild(iter_13_0), false)
	end

	for iter_13_1, iter_13_2 in ipairs(var_13_1) do
		local var_13_2 = iter_13_2[1]
		local var_13_3 = iter_13_2[2]

		for iter_13_3 = 0, arg_13_1.childCount - 1 do
			local var_13_4 = arg_13_1:GetChild(iter_13_3)

			if var_13_4.name == tostring(var_13_2) then
				setActive(var_13_4, true)
				setText(arg_13_0:findTF("Text", var_13_4), var_13_3)

				break
			end
		end
	end
end

function var_0_0.RefreshView(arg_14_0)
	arg_14_0:RefreshData()
	arg_14_0:SetRes(arg_14_0.res)
	arg_14_0:SetDetailPage()

	for iter_14_0 = 1, 3 do
		local var_14_0 = arg_14_0.strongholdPage:GetChild(iter_14_0 - 1)

		setText(var_14_0:Find("root/name"), i18n("yumia_base_name_" .. iter_14_0))
		setText(var_14_0:Find("comfort/count2/count1"), arg_14_0.comfortCount[iter_14_0])
		setText(var_14_0:Find("comfort/count2"), "/" .. arg_14_0.allComfortCount[iter_14_0])
		GetImageSpriteFromAtlasAsync("ui/CourtyardUI_atlas", "express_" .. arg_14_0:GetComfortableLevel(arg_14_0.comfortCount[iter_14_0]), var_14_0:Find("comfort/icon"))
		onButton(arg_14_0, var_14_0, function()
			arg_14_0:EnterDetailPage(iter_14_0)
		end, SFX_PANEL)

		local var_14_1 = false
		local var_14_2 = arg_14_0.awardInfos[iter_14_0]

		for iter_14_1 = 1, #var_14_2 do
			local var_14_3 = var_14_2[iter_14_1][1]
			local var_14_4 = var_14_2[iter_14_1][2]

			if var_14_3 <= arg_14_0.comfortCount[iter_14_0] and iter_14_1 > arg_14_0.gotAwardIndex[iter_14_0] then
				var_14_1 = true

				break
			end
		end

		setActive(var_14_0:Find("tip"), var_14_1)
	end

	if arg_14_0.strongholdIndex then
		arg_14_0:EnterDetailPage(arg_14_0.strongholdIndex)
	end
end

function var_0_0.SetDetailPage(arg_16_0)
	for iter_16_0 = 1, 3 do
		setText(arg_16_0.detailPage:Find("info/" .. iter_16_0 .. "/root/name"), i18n("yumia_base_name_" .. iter_16_0))
		setText(arg_16_0.detailPage:Find("info/" .. iter_16_0 .. "/comfort/count2/count1"), arg_16_0.comfortCount[iter_16_0])
		setText(arg_16_0.detailPage:Find("info/" .. iter_16_0 .. "/comfort/count2"), "/" .. arg_16_0.allComfortCount[iter_16_0])
		GetImageSpriteFromAtlasAsync("ui/CourtyardUI_atlas", "express_" .. arg_16_0:GetComfortableLevel(arg_16_0.comfortCount[iter_16_0]), arg_16_0.detailPage:Find("info/" .. iter_16_0 .. "/comfort/icon"))

		local var_16_0 = arg_16_0.detailPage:Find("detail/stronghold/furnitures/" .. iter_16_0)
		local var_16_1 = false

		for iter_16_1 = 0, var_16_0.childCount - 1 do
			local var_16_2 = var_16_0:GetChild(iter_16_1)
			local var_16_3 = true

			for iter_16_2 = 0, var_16_2.childCount - 1 do
				local var_16_4 = var_16_2:GetChild(iter_16_2)
				local var_16_5 = tonumber(var_16_4.name)
				local var_16_6 = table.contains(arg_16_0.okFurnitureIds, var_16_5)

				setActive(var_16_4:Find("fur"), var_16_6)
				setActive(var_16_4:Find("lockFur"), not var_16_6)
				setActive(var_16_4:Find("comfort"), not var_16_6)
				setText(var_16_4:Find("comfort/comf/count"), var_0_1[var_16_5].com_add)

				if not var_16_6 then
					var_16_3 = false

					onButton(arg_16_0, var_16_4, function()
						arg_16_0:ShowMakePanel(var_16_5)
					end, SFX_PANEL)
				else
					removeOnButton(var_16_4)
				end
			end

			setActive(var_16_2, not var_16_1)

			if not var_16_1 and not var_16_3 then
				var_16_1 = true
			end
		end
	end

	onButton(arg_16_0, arg_16_0.detailPage:Find("leftChange"), function()
		arg_16_0:EnterDetailPage(arg_16_0.strongholdIndex - 1 == 0 and 3 or arg_16_0.strongholdIndex - 1)
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.detailPage:Find("rightChange"), function()
		arg_16_0:EnterDetailPage(arg_16_0.strongholdIndex + 1 == 4 and 1 or arg_16_0.strongholdIndex + 1)
	end, SFX_PANEL)
end

function var_0_0.EnterDetailPage(arg_20_0, arg_20_1)
	arg_20_0.strongholdIndex = arg_20_1

	setActive(arg_20_0.strongholdPage, false)
	setActive(arg_20_0.detailPage, true)

	for iter_20_0 = 1, 3 do
		setActive(arg_20_0.detailPage:Find("info/" .. iter_20_0), iter_20_0 == arg_20_1)
	end

	setText(arg_20_0.detailPage:Find("detail/progress/countBg/furnitureCount"), arg_20_0.furnitureCount[arg_20_1] .. "/" .. arg_20_0.allFurnitureCount[arg_20_1])

	for iter_20_1 = 1, 3 do
		setActive(arg_20_0.detailPage:Find("detail/stronghold/furnitures/" .. iter_20_1), iter_20_1 == arg_20_1)
	end

	local var_20_0 = false
	local var_20_1 = 0
	local var_20_2 = arg_20_0.awardInfos[arg_20_1]

	arg_20_0.awardList:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventUpdate then
			local var_21_0 = var_20_2[arg_21_1 + 1][1]
			local var_21_1 = var_20_2[arg_21_1 + 1][2]
			local var_21_2 = {
				type = var_21_1[1],
				id = var_21_1[2],
				count = var_21_1[3]
			}

			updateDrop(arg_21_2:Find("award"), var_21_2)
			onButton(arg_20_0, arg_21_2:Find("award"), function()
				arg_20_0:emit(BaseUI.ON_DROP, var_21_2)
			end, SFX_PANEL)
			setText(arg_21_2:Find("comfort"), var_21_0)
			setActive(arg_21_2:Find("got"), arg_21_1 < arg_20_0.gotAwardIndex[arg_20_1])
			setActive(arg_21_2:Find("canGet"), var_21_0 <= arg_20_0.comfortCount[arg_20_1] and arg_21_1 >= arg_20_0.gotAwardIndex[arg_20_1])

			if var_21_0 <= arg_20_0.comfortCount[arg_20_1] and arg_21_1 >= arg_20_0.gotAwardIndex[arg_20_1] then
				var_20_0 = true
				var_20_1 = arg_21_1 + 1
			end
		end
	end)
	arg_20_0.awardList:align(#var_20_2)
	setActive(arg_20_0.detailPage:Find("detail/allGetBtn/VX"), var_20_0)

	if var_20_0 then
		setGray(arg_20_0.detailPage:Find("detail/allGetBtn"), false, false)
		onButton(arg_20_0, arg_20_0.detailPage:Find("detail/allGetBtn"), function()
			arg_20_0:emit(YoumiyaStrongholdMediator.GET_AWARD, arg_20_1, var_20_1)
		end, SFX_PANEL)
	else
		setGray(arg_20_0.detailPage:Find("detail/allGetBtn"), true, false)
		removeOnButton(arg_20_0.detailPage:Find("detail/allGetBtn"))
	end

	if isActive(arg_20_0.makeFurniturePanel) then
		triggerButton(arg_20_0.makeFurniturePanel:Find("panel/closeBtn"))
	end
end

function var_0_0.ShowMakePanel(arg_24_0, arg_24_1)
	setActive(arg_24_0.makeFurniturePanel, true)

	local var_24_0 = var_0_1[arg_24_1]
	local var_24_1 = var_0_2[var_24_0.fur_id]
	local var_24_2 = arg_24_0.makeFurniturePanel:GetComponent(typeof(Animation))
	local var_24_3 = arg_24_0.makeFurniturePanel:GetComponent(typeof(DftAniEvent))

	onButton(arg_24_0, arg_24_0.makeFurniturePanel:Find("panel/closeBtn"), function()
		if arg_24_0.isOnMake then
			return
		end

		var_24_3:SetEndEvent(function()
			setActive(arg_24_0.makeFurniturePanel, false)
		end)
		var_24_2:Play("Anim_YoumiyaStrongholdUI_makeFurniture_Out")
	end, SFX_PANEL)
	onButton(arg_24_0, arg_24_0._tf:Find("bg"), function()
		triggerButton(arg_24_0.makeFurniturePanel:Find("panel/closeBtn"))
	end, SFX_PANEL)
	setText(arg_24_0.makeFurniturePanel:Find("panel/name"), var_24_1.name)

	local var_24_4, var_24_5 = HXSet.autoHxShiftPath("furnitures/" .. var_24_1.picture, "")
	local var_24_6 = arg_24_0.makeFurniturePanel:Find("panel/icon"):GetComponent(typeof(Image))

	GetSpriteFromAtlasAsync(var_24_4, var_24_5, function(arg_28_0)
		var_24_6.sprite = arg_28_0

		var_24_6:SetNativeSize()

		local var_28_0 = var_24_6.sprite.rect.width
		local var_28_1 = var_24_6.sprite.rect.height
		local var_28_2 = var_28_1 <= var_28_0 and 300 / var_28_0 or 300 / var_28_1

		arg_24_0.makeFurniturePanel:Find("panel/icon").localScale = Vector3(var_28_2, var_28_2, 1)
	end)
	setText(arg_24_0.makeFurniturePanel:Find("panel/comfort/count"), var_24_0.com_add)
	setText(arg_24_0.makeFurniturePanel:Find("panel/desc"), var_24_1.describe)
	setActive(arg_24_0.makeFurniturePanel:Find("panel/complete"), false)
	onButton(arg_24_0, arg_24_0.makeFurniturePanel:Find("panel/consume/goBtn"), function()
		arg_24_0:emit(YoumiyaStrongholdMediator.YOUMIA_GO_SCENE, SCENE.ATELIER_COMPOSITE, {
			activityID = 50043,
			versionIndex = 2
		})
	end, SFX_PANEL)
	arg_24_0:SetConsumeList(var_24_0.material)

	local var_24_7 = true

	for iter_24_0, iter_24_1 in ipairs(var_24_0.material) do
		local var_24_8 = iter_24_1[2]

		if iter_24_1[3] > arg_24_0:GetItemCount(var_24_8) then
			var_24_7 = false
		end
	end

	if var_24_7 then
		setGray(arg_24_0.makeFurniturePanel:Find("panel/makeBtn"), false, true)
		onButton(arg_24_0, arg_24_0.makeFurniturePanel:Find("panel/makeBtn"), function()
			arg_24_0.isOnMake = true

			var_24_3:SetTriggerEvent(function()
				arg_24_0:emit(YoumiyaStrongholdMediator.MAKE_FURNITURE, arg_24_1, var_24_0.material)

				arg_24_0.isOnMake = false

				triggerButton(arg_24_0.makeFurniturePanel:Find("panel/closeBtn"))
			end)
			setActive(arg_24_0.makeFurniturePanel:Find("panel/complete"), true)
			arg_24_0.makeFurniturePanel:GetComponent(typeof(Animation)):Play("Anim_YoumiyaStrongholdUI_makeFurniture_Complete")
			removeOnButton(arg_24_0.makeFurniturePanel:Find("panel/makeBtn"))
		end, SFX_PANEL)
	else
		setGray(arg_24_0.makeFurniturePanel:Find("panel/makeBtn"), true, true)
		removeOnButton(arg_24_0.makeFurniturePanel:Find("panel/makeBtn"))
	end
end

function var_0_0.SetConsumeList(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0.makeFurniturePanel:Find("panel/consume/consumeList")
	local var_32_1 = {}

	for iter_32_0, iter_32_1 in ipairs(arg_32_1) do
		table.insert(var_32_1, {
			iter_32_1[2],
			iter_32_1[3]
		})
	end

	for iter_32_2 = 0, var_32_0.childCount - 1 do
		setActive(var_32_0:GetChild(iter_32_2), false)
	end

	for iter_32_3, iter_32_4 in ipairs(var_32_1) do
		local var_32_2 = iter_32_4[1]
		local var_32_3 = iter_32_4[2]

		for iter_32_5 = 0, var_32_0.childCount - 1 do
			local var_32_4 = var_32_0:GetChild(iter_32_5)

			if var_32_4.name == tostring(var_32_2) then
				setActive(var_32_4, true)
				setText(var_32_4:Find("count1"), arg_32_0:GetItemCount(var_32_2))
				setText(var_32_4:Find("count2"), "/" .. var_32_3)

				break
			end
		end
	end
end

function var_0_0.GetComfortableLevel(arg_33_0, arg_33_1)
	if arg_33_1 < 30 then
		return 1
	elseif arg_33_1 >= 30 and arg_33_1 < 68 then
		return 2
	else
		return 3
	end
end

function var_0_0.GetItemCount(arg_34_0, arg_34_1)
	local var_34_0 = 0

	if arg_34_1 == 6 then
		var_34_0 = getProxy(PlayerProxy):getRawData():getResource(PlayerConst.ResDormMoney)
	elseif arg_34_0.items[arg_34_1] then
		var_34_0 = arg_34_0.items[arg_34_1].count
	end

	return var_34_0
end

function var_0_0.GoBack(arg_35_0)
	if isActive(arg_35_0.detailPage) then
		setActive(arg_35_0.strongholdPage, true)
		setActive(arg_35_0.detailPage, false)

		arg_35_0.strongholdIndex = nil

		if isActive(arg_35_0.makeFurniturePanel) then
			triggerButton(arg_35_0.makeFurniturePanel:Find("panel/closeBtn"))
		end

		for iter_35_0 = 1, 3 do
			local var_35_0 = arg_35_0.detailPage:Find("detail/stronghold/furnitures/" .. iter_35_0)

			for iter_35_1 = 1, var_35_0.childCount do
				local var_35_1 = var_35_0:Find(iter_35_1)

				for iter_35_2 = 0, var_35_1.childCount - 1 do
					local var_35_2 = var_35_1:GetChild(iter_35_2)

					setActive(var_35_2:Find("comfort/icon/VX"), false)
				end
			end
		end

		return
	end

	arg_35_0:closeView()
end

function var_0_0.willExit(arg_36_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_36_0._tf)

	if arg_36_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_36_0.camEventId)

		arg_36_0.camEventId = nil
	end
end

function var_0_0.onBackPressed(arg_37_0)
	arg_37_0:GoBack()
end

function var_0_0.ShouldShowTip()
	local var_38_0 = pg.activity_template[ActivityConst.YUMIA_BASE_ACT_ID].config_client.rewards
	local var_38_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.YUMIA_BASE_ACT_ID)
	local var_38_2 = var_38_1:getData1List()
	local var_38_3 = {
		0,
		0,
		0
	}

	for iter_38_0 = 1, 3 do
		var_38_3[iter_38_0] = var_38_1:getKVPList(1, iter_38_0)
	end

	local var_38_4 = {
		0,
		0,
		0
	}

	for iter_38_1 = 1, 3 do
		local var_38_5 = var_0_1.get_id_list_by_type[iter_38_1]

		for iter_38_2, iter_38_3 in ipairs(var_38_5) do
			if table.contains(var_38_2, iter_38_3) then
				local var_38_6 = var_0_1[iter_38_3]

				var_38_4[iter_38_1] = var_38_4[iter_38_1] + var_38_6.com_add
			end
		end
	end

	local var_38_7 = false

	for iter_38_4 = 1, 3 do
		local var_38_8 = false
		local var_38_9 = var_38_0[iter_38_4]

		for iter_38_5 = 1, #var_38_9 do
			local var_38_10 = var_38_9[iter_38_5][1]
			local var_38_11 = var_38_9[iter_38_5][2]

			if var_38_10 <= var_38_4[iter_38_4] and iter_38_5 > var_38_3[iter_38_4] then
				var_38_8 = true

				break
			end
		end

		if var_38_8 then
			var_38_7 = true

			break
		end
	end

	return var_38_7
end

return var_0_0
