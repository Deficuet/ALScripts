local var_0_0 = class("MainBannerView", import("...base.MainBaseView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.scrollSnap = BannerScrollRect.New(findTF(arg_1_1, "mask/content"), findTF(arg_1_1, "dots"))
	arg_1_0.downloadmgr = BulletinBoardMgr.Inst
	arg_1_0.rawImages = {}
end

function var_0_0.Init(arg_2_0)
	local var_2_0 = getProxy(ActivityProxy):getBannerDisplays()

	arg_2_0:UpdateItems(var_2_0)

	arg_2_0.banners = var_2_0
end

function var_0_0.Refresh(arg_3_0)
	local var_3_0 = getProxy(ActivityProxy):getBannerDisplays()

	if #arg_3_0.banners ~= #var_3_0 then
		arg_3_0:Clear()
		arg_3_0:Init()
	else
		arg_3_0.scrollSnap:Resume()
	end
end

function var_0_0.UpdateItems(arg_4_0, arg_4_1)
	for iter_4_0 = 0, #arg_4_1 - 1 do
		local var_4_0 = arg_4_1[iter_4_0 + 1]
		local var_4_1 = arg_4_0.scrollSnap:AddChild()

		arg_4_0:UpdateItemImage(var_4_0, var_4_1)

		local var_4_2 = var_4_0.type == 3 and tonumber(var_4_0.param) == nil and getProxy(ActivityProxy):readyToAchieveByType(ActivityConst.ACTIVITY_TYPE_LEVELAWARD)

		setActive(findTF(var_4_1, "red"), var_4_2)
		onButton(arg_4_0, var_4_1, function()
			arg_4_0:Tracking(var_4_0.id)
			MainBaseActivityBtn.Skip(arg_4_0, var_4_0)
		end, SFX_MAIN)
	end

	arg_4_0.scrollSnap:SetUp()
end

function var_0_0.GetItemPicPath(arg_6_0, arg_6_1)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		local var_6_0 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()
		local var_6_1 = arg_6_1.pic_hx or {}

		if #var_6_1 <= 0 then
			return arg_6_1.pic
		end

		local var_6_2 = _.detect(var_6_1, function(arg_7_0)
			return arg_7_0[1] == var_6_0
		end)

		if not var_6_2 then
			return arg_6_1.pic
		end

		do return var_6_2[2] or arg_6_1.pic end
		return
	end

	return arg_6_1.pic
end

function var_0_0.UpdateItemImage(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_2:Find("texture")
	local var_8_1 = arg_8_2:Find("image")
	local var_8_2 = arg_8_0:GetItemPicPath(arg_8_1)
	local var_8_3 = StringStartsWith(var_8_2, "https://") or StringStartsWith(var_8_2, "http://")

	setActive(var_8_0, var_8_3)
	setActive(var_8_1, not var_8_3)

	if var_8_3 then
		arg_8_0.downloadmgr:GetTexture("main_banner", "1", var_8_2, UnityEngine.Events.UnityAction_UnityEngine_Texture(function(arg_9_0)
			if arg_8_0.exited or IsNil(var_8_0) then
				return
			end

			local var_9_0 = var_8_0:GetComponent(typeof(RawImage))

			var_9_0.texture = arg_9_0

			table.insert(arg_8_0.rawImages, var_9_0)
		end))
	else
		LoadImageSpriteAsync("activitybanner/" .. var_8_2, var_8_1)
	end
end

function var_0_0.Tracking(arg_10_0, arg_10_1)
	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildTouchBanner(arg_10_1))
end

function var_0_0.GetDirection(arg_11_0)
	return Vector2(1, 0)
end

function var_0_0.Disable(arg_12_0)
	arg_12_0.scrollSnap:Pause()
end

function var_0_0.Clear(arg_13_0)
	arg_13_0.scrollSnap:Reset()
end

function var_0_0.Dispose(arg_14_0)
	var_0_0.super.Dispose(arg_14_0)

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.rawImages) do
		iter_14_1.texture = nil
	end

	arg_14_0.rawImages = nil

	arg_14_0:Clear()
	arg_14_0.scrollSnap:Dispose()

	arg_14_0.scrollSnap = nil
	arg_14_0.exited = true
	arg_14_0.downloadmgr = nil
end

return var_0_0
