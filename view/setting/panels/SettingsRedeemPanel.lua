local var_0_0 = class("SettingsRedeemPanel", import(".SettingsBasePanel"))

function var_0_0.GetUIName(arg_1_0)
	return "SettingsRedeem"
end

function var_0_0.GetTitle(arg_2_0)
	return i18n("Settings_title_Redeem")
end

function var_0_0.GetTitleEn(arg_3_0)
	return "  / KEY"
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.codeInput = findTF(arg_4_0._tf, "voucher")
	arg_4_0.placeholder = findTF(arg_4_0.codeInput, "Placeholder")
	arg_4_0.placeholder:GetComponent(typeof(Text)).text = i18n("exchangecode_use_placeholder")
	arg_4_0.achieveBtn = findTF(arg_4_0.codeInput, "submit")

	onButton(arg_4_0, arg_4_0.achieveBtn, function()
		local var_5_0 = arg_4_0.codeInput:GetComponent(typeof(InputField)).text
		local var_5_1
		local var_5_2 = pg.gift_key_sp[var_5_0]

		if var_5_2 and var_5_2.key == var_5_0 then
			var_5_1 = var_5_2.group
		elseif #var_5_0 > 10 then
			var_5_1 = string.sub(var_5_0, 1, #var_5_0 - 10)
		end

		local var_5_3

		if var_5_1 and var_5_1 ~= "" then
			local var_5_4 = pg.gift_group[var_5_1]

			if var_5_4 then
				local var_5_5 = false

				if type(var_5_4.active_time) == "string" or type(var_5_4.active_time[1][1]) == "table" then
					var_5_5 = pg.TimeMgr.GetInstance():inTime(var_5_4.active_time)
				else
					var_5_5 = pg.TimeMgr.GetInstance():passTime(var_5_4.active_time)
				end

				if not var_5_5 then
					local var_5_6

					if type(var_5_4.active_time) ~= "string" then
						if type(var_5_4.active_time[1][1]) ~= "table" then
							var_5_6 = pg.TimeMgr.GetInstance():passTime(var_5_4.active_time)
						else
							var_5_6 = pg.TimeMgr.GetInstance():passTime(var_5_4.active_time[2])
						end
					end

					if var_5_6 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("exchange_code_after_time"))
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("exchange_code_before_time"))
					end

					return
				end

				local var_5_7 = i18n("exchange_code_tip")
				local var_5_8 = ""
				local var_5_9 = ""
				local var_5_10 = var_5_4.drop_list
				local var_5_11 = {}

				for iter_5_0, iter_5_1 in ipairs(var_5_10) do
					local var_5_12 = Drop.New({
						type = iter_5_1[1],
						id = iter_5_1[2],
						count = iter_5_1[3]
					})

					if iter_5_1[1] == DROP_TYPE_SKIN then
						table.insert(var_5_11, iter_5_1[2])

						var_5_8 = i18n("exchange_code_skin_tip") .. var_5_8 .. "[" .. var_5_12:getName() .. "]*" .. var_5_12:getCount()
					else
						var_5_8 = var_5_8 .. var_5_12:getName() .. "*" .. var_5_12:getCount()
					end

					if iter_5_0 ~= #var_5_10 then
						var_5_8 = var_5_8 .. ","
					end
				end

				local var_5_13 = var_5_8 .. "\n"

				if var_5_11 and #var_5_11 > 0 then
					for iter_5_2, iter_5_3 in ipairs(var_5_11) do
						local var_5_14 = getProxy(ShipSkinProxy):hasSkin(iter_5_3)

						if pg.ship_skin_template[iter_5_3] and var_5_14 and var_5_9 and var_5_9 == "" then
							var_5_9 = i18n("exchange_code_skin")
						end
					end
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = var_5_7 .. var_5_13 .. var_5_9,
					onYes = function()
						pg.m02:sendNotification(GAME.EXCHANGECODE_USE, {
							key = var_5_0
						})
					end,
					onNo = function()
						return
					end
				})
			else
				pg.m02:sendNotification(GAME.EXCHANGECODE_USE, {
					key = var_5_0
				})
			end
		else
			pg.m02:sendNotification(GAME.EXCHANGECODE_USE, {
				key = var_5_0
			})
		end
	end, SFX_CONFIRM)
	setGray(arg_4_0.achieveBtn, getInputText(arg_4_0.codeInput) == "")
	onInputChanged(arg_4_0, arg_4_0.codeInput, function()
		setGray(arg_4_0.achieveBtn, getInputText(arg_4_0.codeInput) == "")
	end)
	setText(findTF(arg_4_0._tf, "voucher/prompt"), i18n("Settings_title_Redeem_input_label"))
	setText(findTF(arg_4_0._tf, "voucher/Placeholder"), i18n("Settings_title_Redeem_input_placeholder"))
	setText(findTF(arg_4_0._tf, "voucher/submit/Image"), i18n("Settings_title_Redeem_input_submit"))
end

function var_0_0.ClearExchangeCode(arg_9_0)
	arg_9_0.codeInput:GetComponent(typeof(InputField)).text = ""
end

return var_0_0
