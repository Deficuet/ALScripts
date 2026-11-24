local var_0_0 = class("EasterEggView", import("view.base.BasePanel"))

var_0_0.ON_CLICK_EASTER_EGG = "EasterEggView::ON_CLICK_EASTER_EGG"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2
	arg_1_0.scene = arg_1_3

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.uiBtn = findTF(arg_2_0._tf, "btn")

	local var_2_0 = EasterEggTools.GetActivity()
	local var_2_1 = EasterEggTools.GetTemplateCfgID(var_2_0, arg_2_0.scene)
	local var_2_2 = pg.activity_secret_template[var_2_1]

	LoadAndInstantiateAsync("ui", var_2_2.resource, function(arg_3_0)
		if not IsNil(arg_2_0._go) then
			local var_3_0 = arg_3_0.transform

			var_3_0:SetParent(arg_2_0._tf, false)

			local var_3_1 = var_2_2.resource_transform

			var_3_0.localPosition = Vector3(var_3_1[1][1], var_3_1[1][2], var_3_1[1][3])
			var_3_0.localEulerAngles = Vector3(var_3_1[2][1], var_3_1[2][2], var_3_1[2][3])
			var_3_0.localScale = Vector3(var_3_1[3][1], var_3_1[3][2], var_3_1[3][3])
			arg_2_0.btnEffectGo = arg_3_0
		else
			Object.Destroy(arg_3_0)
		end
	end)

	local var_2_3 = tf(arg_2_0.uiBtn)
	local var_2_4 = var_2_2.resource_transform

	var_2_3.localPosition = Vector3(var_2_4[1][1], var_2_4[1][2], var_2_4[1][3])
	var_2_3.localEulerAngles = Vector3(var_2_4[2][1], var_2_4[2][2], var_2_4[2][3])
	var_2_3.localScale = Vector3(var_2_4[3][1], var_2_4[3][2], var_2_4[3][3])

	onButton(arg_2_0, arg_2_0.uiBtn, function()
		local var_4_0 = {}

		table.insert(var_4_0, function(arg_5_0)
			arg_2_0:emit(var_0_0.ON_CLICK_EASTER_EGG, {
				actId = var_2_0.id,
				id = var_2_1,
				cmd = PuzzleActivity.CMD_ACTIVATE,
				callback = function(arg_6_0)
					arg_2_0:HideClickBtn()

					if arg_2_0.btnCallBack then
						existCall(arg_2_0.btnCallBack, arg_6_0, arg_5_0)
					else
						arg_5_0()
					end
				end
			})
		end)

		if var_2_2.effect ~= "" then
			table.insert(var_4_0, function(arg_7_0)
				pg.UIMgr.GetInstance():LoadingOn(false)
				LoadAndInstantiateAsync("ui", var_2_2.effect, function(arg_8_0)
					if not IsNil(arg_2_0._go) then
						local var_8_0 = arg_8_0.transform

						var_8_0:SetParent(arg_2_0._tf, false)

						local var_8_1 = var_2_2.effect_transform

						var_8_0.localPosition = Vector3(var_8_1[1][1], var_8_1[1][2], var_8_1[1][3])
						var_8_0.localEulerAngles = Vector3(var_8_1[2][1], var_8_1[2][2], var_8_1[2][3])
						var_8_0.localScale = Vector3(var_8_1[3][1], var_8_1[3][2], var_8_1[3][3])
						arg_2_0.btnEffectGo2 = arg_8_0

						arg_2_0:AddHideEasterEggTimer(EasterEggTools.GetHideBtnTime(), function()
							setActive(arg_2_0.btnEffectGo2, false)
							arg_2_0:StopEasterEggTimer()
							pg.UIMgr.GetInstance():LoadingOff()
							arg_7_0()
						end)
					else
						Object.Destroy(arg_8_0)
					end
				end)
			end)
		end

		if var_2_2.story ~= "" then
			table.insert(var_4_0, function(arg_10_0)
				pg.NewStoryMgr.GetInstance():Play(var_2_2.story, function()
					existCall(arg_2_0.storyCallBack, arg_10_0)
				end)
			end)
		else
			table.insert(var_4_0, function(arg_12_0)
				arg_2_0:StopEasterEggTimer()
				existCall(arg_2_0.storyCallBack, arg_12_0)
			end)
		end

		seriesAsync(var_4_0, function()
			arg_2_0:HideEasterEgg()
			arg_2_0:StopEasterEggTimer()
			arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
				viewComponent = EasterEggPopScene,
				mediator = EasterEggPopMediator,
				data = {
					id = var_2_1
				}
			}))
		end)
	end, SFX_CONFIRM)
end

function var_0_0.SetEasterEggCallBack(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.btnCallBack = arg_14_1
	arg_14_0.storyCallBack = arg_14_2
end

function var_0_0.ShowEasterEgg(arg_15_0)
	local var_15_0 = EasterEggTools.GetActivity()
	local var_15_1 = EasterEggTools.IsEnabled(var_15_0, EasterEggConst.EasterEggStoreHouseScene)

	if var_15_1 then
		setActive(arg_15_0._go, var_15_1)
		arg_15_0:AddHideEasterEggTimer(EasterEggTools.GetHideBtnTime(), function()
			setActive(arg_15_0._go, false)
			arg_15_0:StopEasterEggTimer()
		end)
	end
end

function var_0_0.HideEasterEgg(arg_17_0)
	setActive(arg_17_0._go, false)
end

function var_0_0.HideClickBtn(arg_18_0)
	setActive(arg_18_0.uiBtn, false)
	setActive(arg_18_0.btnEffectGo, false)
end

function var_0_0.AddHideEasterEggTimer(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0:StopEasterEggTimer()

	arg_19_0.easterEggTimer = Timer.New(function()
		arg_19_2()
	end, arg_19_1, 1)

	arg_19_0.easterEggTimer:Start()
end

function var_0_0.StopEasterEggTimer(arg_21_0)
	if arg_21_0.easterEggTimer then
		arg_21_0.easterEggTimer:Stop()

		arg_21_0.easterEggTimer = nil
	end
end

function var_0_0.willExit(arg_22_0)
	arg_22_0:detach()
	arg_22_0:StopEasterEggTimer()

	if arg_22_0.btnEffectGo then
		Object.Destroy(arg_22_0.btnEffectGo)

		arg_22_0.btnEffectGo = nil
	end

	if arg_22_0.btnEffectGo2 then
		Object.Destroy(arg_22_0.btnEffectGo2)

		arg_22_0.btnEffectGo2 = nil
	end
end

return var_0_0
