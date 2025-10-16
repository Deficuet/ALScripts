local var_0_0 = class("WorldMediaCollectionEntranceScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "WorldMediaCollectionEntranceUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.recallBtn = arg_2_0._tf:Find("Main/recall")
	arg_2_0.cryptolaliaBtn = arg_2_0._tf:Find("Main/cryptolalia")
	arg_2_0.archiveBtn = arg_2_0._tf:Find("Main/archive")
	arg_2_0.archiveLockTF = arg_2_0.archiveBtn:Find("lock")
	arg_2_0.recordBtn = arg_2_0._tf:Find("Main/record")
	arg_2_0.albumBtn = arg_2_0._tf:Find("Main/album")

	setActive(arg_2_0.albumBtn, not LOCK_ALBUM)

	local var_2_0 = arg_2_0._tf:Find("Main/empty")

	SetCompomentEnabled(var_2_0, "Image", LOCK_ALBUM)
	setActive(var_2_0:Find("Image"), not LOCK_ALBUM)
	setActive(var_2_0:Find("Image1"), LOCK_ALBUM)

	arg_2_0.optionBtn = arg_2_0._tf:Find("Top/blur_panel/adapt/top/option")
	arg_2_0.backBtn = arg_2_0._tf:Find("Top/blur_panel/adapt/top/back_btn")

	setText(arg_2_0._tf:Find("Main/empty/label"), i18n("cryptolalia_unopen"))
	setText(arg_2_0._tf:Find("Main/empty1/label"), i18n("cryptolalia_unopen"))
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.optionBtn, function()
		arg_3_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.recallBtn, function()
		arg_3_0:emit(WorldMediaCollectionEntranceMediator.OPEN_RECALL)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.cryptolaliaBtn, function()
		if LOCK_CRYPTOLALIA then
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_comingSoon"))
		else
			arg_3_0:emit(WorldMediaCollectionEntranceMediator.OPEN_CRYPTOLALIA)
		end
	end, SFX_PANEL)

	local var_3_0 = pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "WorldMediator")

	setActive(arg_3_0.archiveLockTF, not var_3_0)
	onButton(arg_3_0, arg_3_0.archiveBtn, function()
		if not var_3_0 then
			local var_8_0 = pg.open_systems_limited[19]

			pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_8_0.name, var_8_0.level))

			return
		end

		arg_3_0:emit(WorldMediaCollectionEntranceMediator.OPEN_ARCHIVE)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.recordBtn, function()
		arg_3_0:emit(WorldMediaCollectionEntranceMediator.OPEN_RECORD)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.albumBtn, function()
		arg_3_0:emit(WorldMediaCollectionEntranceMediator.OPEN_ALBUM)
	end, SFX_PANEL)
end

function var_0_0.willExit(arg_11_0)
	return
end

return var_0_0
