local var_0_0 = class("ActivityRemasterInfoAwardPage", import("view.base.BaseSubView"))

var_0_0.ON_SKIP_ACT = "ActivityRemasterCoreActivityAdaptUI"

function var_0_0.getUIName(arg_1_0)
	return "ActivityRemasterInfoAwardPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.itemTr = arg_2_0._tf:Find("window/middle/award")
	arg_2_0.nameTxt = arg_2_0._tf:Find("window/middle/name")
	arg_2_0.descTxt = arg_2_0._tf:Find("window/middle/desc")
	arg_2_0.ownTxt = arg_2_0._tf:Find("window/middle/own")
	arg_2_0.boxSrcContent = arg_2_0._tf:Find("window/middle/ways")
	arg_2_0.boxSrcTpl = arg_2_0._tf:Find("window/middle/ways/tpl")
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:CommonSetting({
		title = i18n("word_obtain_way")
	})
end

function var_0_0.CommonSetting(arg_4_0, arg_4_1)
	setText(arg_4_0._tf:Find("window/top/title"), arg_4_1.title or i18n("words_information"))

	function arg_4_0.hideCall()
		arg_4_0.hideCall = nil

		existCall(arg_4_1.onClose)
	end

	onButton(arg_4_0, arg_4_0._tf:Find("bg"), function()
		existCall(arg_4_0.hideCall)
		arg_4_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0._tf:Find("window/top/btn_close"), function()
		existCall(arg_4_0.hideCall)
		arg_4_0:Hide()
	end, SFX_CANCEL)

	function arg_4_0.confirmCall()
		arg_4_0.confirmCall = nil

		existCall(arg_4_0.onConfirm)
	end

	local var_4_0 = arg_4_1.btnList or {
		{
			type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.cancel,
			name = i18n("msgbox_text_cancel"),
			func = function()
				existCall(arg_4_0.hideCall)
			end,
			sound = SFX_CANCEL
		},
		{
			type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.confirm,
			name = i18n("msgbox_text_confirm"),
			func = function()
				existCall(arg_4_0.confirmCall)
			end,
			sound = SFX_CONFIRM
		}
	}
	local var_4_1 = arg_4_0._tf:Find("window/bottom/button_container")

	eachChild(var_4_1, function(arg_11_0)
		setActive(arg_11_0, false)
	end)

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_2 = var_4_1:Find(iter_4_1.type)

		if var_4_2:GetSiblingIndex() < var_4_1.childCount - iter_4_0 + 1 then
			var_4_2:SetAsLastSibling()
			setActive(var_4_2, true)
		else
			var_4_2 = cloneTplTo(var_4_2, var_4_1, var_4_2.name)
		end

		setText(var_4_2:Find("Text"), iter_4_1.name)
		onButton(arg_4_0, var_4_2, function()
			existCall(iter_4_1.func)
			arg_4_0:Hide()
		end, iter_4_1.sound or SFX_CONFIRM)
	end
end

function var_0_0.Show(arg_13_0, arg_13_1)
	var_0_0.super.Show(arg_13_0)

	local var_13_0 = arg_13_1:GetDrop()

	updateDrop(arg_13_0.itemTr, var_13_0)
	changeToScrollText(arg_13_0.nameTxt, var_13_0:getName())

	local var_13_1 = string.gsub(var_13_0.desc or "", "#92fc63", "#39bfff")

	setText(arg_13_0.descTxt, var_13_1 or "")

	local var_13_2 = var_13_0:getCount()
	local var_13_3 = arg_13_1:GetOwnedCount()

	setText(arg_13_0.ownTxt, i18n("ActivityRemasterCore_award_own_desc", var_13_3 .. (var_13_2 > 0 and "/" .. var_13_2 or "")))
	arg_13_0:UpdateWays(arg_13_1:GetWays())
end

function var_0_0.UpdateWays(arg_14_0, arg_14_1)
	UIItemList.StaticAlign(arg_14_0.boxSrcContent, arg_14_0.boxSrcTpl, #arg_14_1, function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = arg_14_1[arg_15_1 + 1]
			local var_15_1 = var_15_0[1]
			local var_15_2 = var_15_0[2]
			local var_15_3 = var_15_0[3]

			changeToScrollText(arg_15_2:Find("Text"), var_15_3)

			local var_15_4 = arg_15_2:Find("go")

			setText(var_15_4:Find("Text"), i18n("brs_reward_tip_2"))
			onButton(arg_14_0, var_15_4, function()
				arg_14_0:DoSkip(var_15_1, var_15_2)
				arg_14_0:Hide()
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.DoSkip(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_SCENE then
		pg.m02:sendNotification(GAME.GO_SCENE, arg_17_2[1], arg_17_2[2] or {})
	elseif arg_17_1 == Msgbox4LinkCollectGuide.SKIP_TYPE_ACTIVITY then
		arg_17_0:emit(ActivityRemasterInfoAwardPage.ON_SKIP_ACT, arg_17_2)
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = arg_17_2
		})
	end
end

function var_0_0.OnDestroy(arg_18_0)
	return
end

return var_0_0
