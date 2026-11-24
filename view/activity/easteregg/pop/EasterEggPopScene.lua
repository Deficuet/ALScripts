local var_0_0 = class("EasterEggPopScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EasterEggPopUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		if arg_2_0.canClose then
			arg_2_0:closeView()
		end
	end, SFX_PANEL)

	arg_2_0.aniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.aniEvent:SetEndEvent(function()
		arg_2_0.canClose = true
	end)
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:OverlayPanel(arg_5_0._tf, {
		pbList = {
			arg_5_0.uiBg
		}
	})

	local var_5_0 = arg_5_0.contextData.id
	local var_5_1 = pg.activity_secret_template[var_5_0]

	setImageSprite(arg_5_0.uiContentImage, GetSpriteFromAtlas(var_5_1.desc[1], var_5_1.desc[2]), true)
	arg_5_0:PlayVoice(var_5_1.voice)
end

function var_0_0.PlayVoice(arg_6_0, arg_6_1)
	if arg_6_1 == "" then
		return
	end

	local var_6_0 = arg_6_1[math.random(1, #arg_6_1)]

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_6_0, function(arg_7_0)
		return
	end)

	arg_6_0.cvPath = var_6_0
end

function var_0_0.StopVoice(arg_8_0)
	if arg_8_0.cvPath ~= nil then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_8_0.cvPath)
	end
end

function var_0_0.willExit(arg_9_0)
	arg_9_0:StopVoice()
	arg_9_0.aniEvent:SetEndEvent(nil)
	arg_9_0:UnOverlayPanel(arg_9_0._tf)
end

function var_0_0.onBackPressed(arg_10_0)
	if arg_10_0.canClose then
		var_0_0.super.onBackPressed(arg_10_0)
	end
end

return var_0_0
