local var_0_0 = class("AuctionGameMainEventMsgLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AuctionGameMainEventMsgUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:OverlayPanel(arg_2_0._tf, {
		pbList = {
			arg_2_0.uiBgBtn
		}
	})
	setText(arg_2_0.uiCancelText, i18n("auction_cancel"))
	setText(arg_2_0.uiConfirmText, i18n("auction_confirm"))
	onButton(arg_2_0, arg_2_0.uiBgBtn, function()
		arg_2_0:closeView()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		arg_2_0:closeView()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiCancelBtn, function()
		arg_2_0:closeView()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiConfirmBtn, function()
		existCall(arg_2_0.contextData.callback)
		arg_2_0:closeView()
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_7_0)
	local var_7_0 = arg_7_0.contextData.eventID
	local var_7_1 = pg.auction_event[var_7_0]

	setText(arg_7_0.uiNameText, var_7_1.name)
	setText(arg_7_0.uiDescText, var_7_1.describe)
	LoadSpriteAsync(var_7_1.icon, function(arg_8_0)
		if not IsNil(arg_7_0.uiIconImage) then
			arg_7_0.uiIconImage.sprite = arg_8_0
		end
	end)
end

function var_0_0.willExit(arg_9_0)
	arg_9_0:UnOverlayPanel(arg_9_0._tf)
end

return var_0_0
