local var_0_0 = class("Dorm3dSlideInviteLayer", import("view.dorm3d.Dorm3dInviteLayer"))

function var_0_0.init(arg_1_0)
	var_0_0.super.init(arg_1_0)
end

function var_0_0.ShowInvitePanel(arg_2_0)
	var_0_0.super.ShowInvitePanel(arg_2_0)
	onButton(arg_2_0, arg_2_0.rtInvitePanel:Find("window/btn_confirm"), function()
		local var_3_0 = {}

		if #arg_2_0.selectIds >= 3 and not ApartmentProxy.CheckDeviceRAMEnough() then
			table.insert(var_3_0, function(arg_4_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("drom3d_beach_memory_limit_tip"),
					onYes = arg_4_0
				})
			end)
		end

		seriesAsync(var_3_0, function()
			local var_5_0 = getProxy(ApartmentProxy)
			local var_5_1 = ApartmentProxy.GetRoomInviteList(arg_2_0.contextData.roomId)
			local var_5_2, var_5_3, var_5_4 = table.Diff(var_5_1, arg_2_0.selectIds)

			if #var_5_3 > 0 then
				local var_5_5 = table.merge(var_5_1, var_5_3)

				var_5_0:SetRoomInviteList(arg_2_0.contextData.roomId, var_5_5, function()
					var_5_0:SetSlideInviteList(arg_2_0.selectIds)
				end)
			else
				var_5_0:SetSlideInviteList(arg_2_0.selectIds)
			end

			arg_2_0:closeView()
		end)
	end, SFX_DORM_CLICK)
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0.selectIds = arg_7_0.contextData.groupIds

	arg_7_0:ShowInvitePanel()
end

return var_0_0
