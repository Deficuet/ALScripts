local var_0_0 = class("NewEducatePersonalityTipPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducatePersonalityTipPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.animCom = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.animEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
	arg_2_0.personalityTF = arg_2_0._tf:Find("personality")
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:OverlayPanel(arg_3_0._tf, {
		groupDelta = 2,
		pbList = {
			arg_3_0.resTF
		}
	})
end

function var_0_0.FlushPersonality(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:Show()

	local var_4_0 = arg_4_1 > 0 and arg_4_0.personalityTF:Find("tag2") or arg_4_0.personalityTF:Find("tag1")

	seriesAsync({
		function(arg_5_0)
			local var_5_0 = arg_4_1 > 0 and i18n("child2_personal_tag2") or i18n("child2_personal_tag1")

			setText(var_4_0:Find("Text"), var_5_0 .. "+" .. math.abs(arg_4_1))
			setActive(var_4_0, true)
			arg_4_0.animEvent:SetEndEvent(function()
				arg_4_0.animEvent:SetEndEvent(nil)
				arg_5_0()
			end)
			arg_4_0.animCom:Play("Anim_educate_personality_show")
		end,
		function(arg_7_0)
			local var_7_0 = arg_4_0.contextData.char:GetPersonalityTag()

			if var_7_0 ~= arg_4_2 then
				setActive(arg_4_0.personalityTF:Find("tag1"), true)
				setText(arg_4_0.personalityTF:Find("tag1/Text"), i18n("child2_personal_change"))
				setActive(arg_4_0.personalityTF:Find("tag2"), true)
				setText(arg_4_0.personalityTF:Find("tag2/Text"), i18n("child2_personal_change"))
				arg_4_0.animEvent:SetEndEvent(function()
					arg_4_0.animEvent:SetEndEvent(nil)
					arg_7_0()
				end)

				local var_7_1 = var_7_0 == "tag1" and "Anim_educate_personality_2to1" or "Anim_educate_personality_1to2"

				arg_4_0.animCom:Play(var_7_1)
			else
				arg_7_0()
			end
		end
	}, function()
		arg_4_0:Hide()
	end)
end

function var_0_0.OnDestroy(arg_10_0)
	arg_10_0:UnOverlayPanel(arg_10_0._tf)
end

return var_0_0
