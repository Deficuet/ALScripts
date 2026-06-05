local var_0_0 = class("EquipmentDesignObtainWayPage", import("view.base.BaseSubView"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = {
	[var_0_1] = i18n("equipment_design_chapter"),
	[var_0_2] = i18n("equipment_design_tech"),
	[var_0_3] = i18n("equipment_design_shop")
}

function var_0_0.getUIName(arg_1_0)
	return "EquipmentDesignObtainWayUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.animationPlayer = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dropTF = arg_2_0._tf:Find("main_page/item/left/IconTpl")
	arg_2_0.nameTxt = arg_2_0._tf:Find("main_page/item/name_container/name/Text")
	arg_2_0.descTxt = arg_2_0._tf:Find("main_page/item/Text")
	arg_2_0.closeBtn = arg_2_0._tf:Find("main_page/top/btnBack")
	arg_2_0.uiWayList = UIItemList.New(arg_2_0._tf:Find("main_page/obtainWay/list/content"), arg_2_0._tf:Find("main_page/obtainWay/list/content/tpl"))
	arg_2_0.uiChapterWayList = UIItemList.New(arg_2_0._tf:Find("sub_page/list/content"), arg_2_0._tf:Find("sub_page/list/content/tpl"))

	setText(arg_2_0._tf:Find("main_page/obtainWay/list/content/tpl/expand/Text"), i18n("equipment_design_btn_expand"))
	setText(arg_2_0._tf:Find("main_page/obtainWay/list/content/tpl/fold/Text"), i18n("equipment_design_btn_fold"))
	setText(arg_2_0._tf:Find("main_page/obtainWay/list/content/tpl/skip/Text"), i18n("equipment_design_btn_skip"))
	setText(arg_2_0._tf:Find("sub_page/list/content/tpl/skip_btn/Text"), i18n("equipment_design_btn_skip"))
	setText(arg_2_0._tf:Find("main_page/obtainWay/title"), i18n("equipment_design_sub_title"))
	setText(arg_2_0._tf:Find("main_page/top/bg/infomation/title"), i18n("words_information"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("bg"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)

	arg_3_0.isOpenSubPage = false
end

function var_0_0.Show(arg_6_0, arg_6_1)
	var_0_0.super.Show(arg_6_0)

	arg_6_0.designId = arg_6_1

	local var_6_0 = arg_6_0:GetObtainWayData(arg_6_1)

	arg_6_0:UpdateObtainWay(var_6_0)
	arg_6_0:UpdateEquipmentDesignInfo(arg_6_1)
	arg_6_0:ResetSubPage()
	arg_6_0:BlurPanel(arg_6_0._tf)
end

function var_0_0.UpdateEquipmentDesignInfo(arg_7_0, arg_7_1)
	local var_7_0 = pg.compose_data_template[arg_7_1]
	local var_7_1 = Item.New({
		count = 0,
		id = var_7_0.material_id
	})

	setText(arg_7_0.nameTxt, HXSet.hxLan(shortenString(var_7_1:getConfig("name"), 12)))
	setText(arg_7_0.descTxt, HXSet.hxLan(var_7_1:getConfig("display")))
	updateItem(arg_7_0.dropTF, var_7_1)
	setActive(arg_7_0.dropTF:Find("icon_bg/count"), false)
end

function var_0_0.ResetSubPage(arg_8_0)
	arg_8_0.animationPlayer:Stop()
	arg_8_0.animationPlayer:Play("reset_sub_page")

	arg_8_0.isOpenSubPage = false
end

function var_0_0.Hide(arg_9_0)
	var_0_0.super.Hide(arg_9_0)
	arg_9_0:ResetSubPage()
	arg_9_0:UnOverlayPanel(arg_9_0._tf, arg_9_0._parentTf)
end

function var_0_0.GetObtainWayData(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(EquipmentProxy):GetObtainWay4EquipmentDesign(arg_10_1)
	local var_10_1 = var_10_0[1]
	local var_10_2 = var_10_0[2]
	local var_10_3 = var_10_0[3]
	local var_10_4 = {}

	if var_10_2 then
		table.insert(var_10_4, var_0_2)
	end

	if var_10_3 then
		table.insert(var_10_4, var_0_3)
	end

	if #var_10_1 > 0 then
		table.insert(var_10_4, 1, var_0_1)
	end

	return var_10_4
end

function var_0_0.UpdateObtainWay(arg_11_0, arg_11_1)
	arg_11_0.uiWayList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = arg_11_1[arg_12_1 + 1]

			arg_11_0:UpdateWayTpl(arg_12_2, var_12_0)
		end
	end)
	arg_11_0.uiWayList:align(#arg_11_1)
end

function var_0_0.UpdateWayTpl(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_1:Find("expand")
	local var_13_1 = arg_13_1:Find("fold")
	local var_13_2 = arg_13_1:Find("skip")
	local var_13_3 = arg_13_1:Find("title")

	local function var_13_4()
		setActive(var_13_0, arg_13_2 == var_0_1 and not arg_13_0.isOpenSubPage)
		setActive(var_13_1, arg_13_2 == var_0_1 and arg_13_0.isOpenSubPage)
		setActive(var_13_2, arg_13_2 == var_0_2 or arg_13_2 == var_0_3)
	end

	onButton(arg_13_0, var_13_0, function()
		arg_13_0.animationPlayer:Stop()
		arg_13_0.animationPlayer:Play("open_sub_page")
		arg_13_0:UpdateChapterWays()

		arg_13_0.isOpenSubPage = true

		var_13_4()
	end, SFX_PANEL)
	onButton(arg_13_0, var_13_1, function()
		arg_13_0.animationPlayer:Stop()
		arg_13_0.animationPlayer:Play("close_sub_page")

		arg_13_0.isOpenSubPage = false

		var_13_4()
	end, SFX_PANEL)
	var_13_4()
	onButton(arg_13_0, var_13_2, function()
		if arg_13_2 == var_0_2 then
			arg_13_0:GoTechScene()
		elseif arg_13_2 == var_0_3 then
			arg_13_0:GoShopScene()
		end
	end, SFX_PANEL)
	setText(var_13_3, var_0_4[arg_13_2])
end

function var_0_0.UpdateChapterWays(arg_18_0)
	local var_18_0 = getProxy(EquipmentProxy):GetObtainWay4EquipmentDesign(arg_18_0.designId)[1]

	arg_18_0.uiChapterWayList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			local var_19_0 = var_18_0[arg_19_1 + 1]
			local var_19_1 = pg.chapter_template[var_19_0]

			setScrollText(arg_19_2:Find("mask/Text"), i18n("equipment_design_chapter") .. ":" .. var_19_1.name)
			onButton(arg_18_0, arg_19_2:Find("skip_btn"), function()
				arg_18_0:GoChapterScene(var_19_0)
			end, SFX_PANEL)
		end
	end)
	arg_18_0.uiChapterWayList:align(#var_18_0)
end

function var_0_0.GoChapterScene(arg_21_0, arg_21_1)
	local var_21_0 = pg.chapter_template[arg_21_1]

	if var_21_0.act_id ~= 0 and var_21_0.act_id ~= 100001 then
		local var_21_1 = getProxy(ActivityProxy):RawGetActivityById(var_21_0.act_id)

		if not var_21_1 or var_21_1:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_notStartOrEnd"))

			return
		end

		local var_21_2, var_21_3 = chapterProxy:getLastMapForActivity()

		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = var_21_3,
			mapIdx = var_21_2
		})

		return
	end

	local var_21_4 = getProxy(ChapterProxy):getChapterById(arg_21_1)

	if not var_21_4 or not var_21_4:isUnlock() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_chapter_lock"))

		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
		chapterId = arg_21_1,
		mapIdx = var_21_0.map
	})
end

function var_0_0.GoTechScene(arg_22_0)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TECHNOLOGY)
end

function var_0_0.GoShopScene(arg_23_0)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
		warp = ShopConst.TYPE_FRAGMENT,
		type = ShopConst.SHOP_TYPE.SUPPLY
	})
end

function var_0_0.OnDestroy(arg_24_0)
	if arg_24_0:isShowing() then
		arg_24_0:Hide()
	end
end

return var_0_0
