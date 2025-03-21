local var_0_0 = class("MailMgrWindow", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "MailMgrMsgboxUI"
end

function var_0_0.OnInit(arg_2_0)
	onButton(arg_2_0, arg_2_0._tf:Find("bg"), function()
		arg_2_0:Hide()
	end, SFX_PANEL)

	arg_2_0.closeBtn = arg_2_0:findTF("window/top/btnBack")

	onButton(arg_2_0, arg_2_0.closeBtn, function()
		arg_2_0:Hide()
	end, SFX_PANEL)

	arg_2_0.readBtn = arg_2_0._tf:Find("window/button_container/btn_read")

	onButton(arg_2_0, arg_2_0.readBtn, function()
		arg_2_0:emit(MailMediator.ON_OPERATION, {
			cmd = "read",
			filter = arg_2_0:GetFilterData()
		})
	end, SFX_CONFIRM)

	arg_2_0.attachBtn = arg_2_0._tf:Find("window/button_container/btn_get")

	onButton(arg_2_0, arg_2_0.attachBtn, function()
		arg_2_0:emit(MailMediator.ON_OPERATION, {
			cmd = "attachment",
			filter = arg_2_0:GetFilterData()
		})
	end, SFX_CONFIRM)

	arg_2_0.deleteBtn = arg_2_0._tf:Find("window/button_container/btn_delete")

	onButton(arg_2_0, arg_2_0.deleteBtn, function()
		seriesAsync({
			function(arg_8_0)
				pg.m02:sendNotification(GAME.MAIL_DOUBLE_CONFIREMATION_MSGBOX, {
					type = MailProxy.MailMessageBoxType.ShowTips,
					content = i18n("main_mailLayer_quest_clear_choice"),
					onYes = arg_8_0
				})
			end
		}, function()
			arg_2_0:emit(MailMediator.ON_OPERATION, {
				cmd = "delete",
				filter = arg_2_0:GetFilterData()
			})
		end)
	end, SFX_CONFIRM)

	local var_2_0 = {}

	for iter_2_0, iter_2_1 in pairs({
		[DROP_TYPE_RESOURCE] = {
			PlayerConst.ResGold,
			PlayerConst.ResOil,
			PlayerConst.ResExploit,
			PlayerConst.ResDiamond
		},
		[DROP_TYPE_ITEM] = {
			ITEM_ID_CUBE
		}
	}) do
		for iter_2_2, iter_2_3 in ipairs(iter_2_1) do
			table.insert(var_2_0, Drop.New({
				type = iter_2_0,
				id = iter_2_3
			}))
		end
	end

	if MailWaterSelect then
		table.insert(var_2_0, Drop.New({
			id = 50002,
			type = DROP_TYPE_ITEM
		}))
	end

	arg_2_0.filterDic = {}
	arg_2_0.rtContent = arg_2_0._tf:Find("window/frame/toggle_group/filter/content")

	UIItemList.StaticAlign(arg_2_0.rtContent, arg_2_0.rtContent:Find("toggle_tpl"), #var_2_0, function(arg_10_0, arg_10_1, arg_10_2)
		arg_10_1 = arg_10_1 + 1

		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_2_0[arg_10_1]

			GetImageSpriteFromAtlasAsync(var_10_0:getIcon(), "", arg_10_2:Find("Image"))
			onToggle(arg_2_0, arg_10_2, function(arg_11_0)
				arg_2_0.filterDic[var_10_0.type .. "_" .. var_10_0.id] = arg_11_0

				if arg_11_0 then
					triggerToggle(arg_2_0._tf:Find("window/frame/toggle_group/filter"), true)
				end
			end, SFX_PANEL)
		end
	end)
	eachChild(arg_2_0._tf:Find("window/frame/toggle_group"), function(arg_12_0)
		onToggle(arg_2_0, arg_12_0, function(arg_13_0)
			if arg_13_0 then
				arg_2_0.filterType = arg_12_0.name

				if arg_2_0.filterType == "all" then
					eachChild(arg_2_0.rtContent, function(arg_14_0)
						triggerToggle(arg_14_0, false)
					end)
				end
			end
		end, SFX_PANEL)
	end)
	setText(arg_2_0._tf:Find("window/top/bg/infomation/title"), i18n("mail_manager_title"))
	setText(arg_2_0._tf:Find("window/frame/tip/Text"), i18n("mail_manage_tip_1"))
	setText(arg_2_0._tf:Find("window/frame/tip_1/Text"), i18n("mail_manager_tips_2"))
	setText(arg_2_0._tf:Find("window/frame/toggle_group/all/Text"), i18n("mail_manage_1"))
	setText(arg_2_0._tf:Find("window/frame/toggle_group/filter/Text"), i18n("mail_manage_2"))
	setText(arg_2_0.attachBtn:Find("Text"), i18n("mail_get_oneclick"))
	setText(arg_2_0.readBtn:Find("Text"), i18n("mail_read_oneclick"))
	setText(arg_2_0.deleteBtn:Find("Text"), i18n("mail_delete_oneclick"))
end

function var_0_0.GetFilterData(arg_15_0)
	return switch(arg_15_0.filterType, {
		all = function()
			return {
				type = "all"
			}
		end,
		filter = function()
			local var_17_0 = {}

			for iter_17_0, iter_17_1 in pairs(arg_15_0.filterDic) do
				if iter_17_1 then
					local var_17_1, var_17_2 = unpack(string.split(iter_17_0, "_"))

					table.insert(var_17_0, Drop.New({
						type = tonumber(var_17_1),
						id = tonumber(var_17_2)
					}))
				end
			end

			return {
				type = "drops",
				list = var_17_0
			}
		end
	}, function()
		assert(false)
	end)
end

function var_0_0.Show(arg_19_0, arg_19_1)
	var_0_0.super.Show(arg_19_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_19_0._tf)
	triggerToggle(arg_19_0._tf:Find("window/frame/toggle_group/all"), true)
end

function var_0_0.Hide(arg_20_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_20_0._tf, arg_20_0._parentTf)
	var_0_0.super.Hide(arg_20_0)
end

function var_0_0.OnDestroy(arg_21_0)
	if arg_21_0:isShowing() then
		arg_21_0:Hide()
	end
end

return var_0_0
