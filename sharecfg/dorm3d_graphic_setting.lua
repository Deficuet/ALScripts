pg = pg or {}
pg.dorm3d_graphic_setting = rawget(pg, "dorm3d_graphic_setting") or setmetatable({
	__name = "dorm3d_graphic_setting"
}, confNEO)
pg.dorm3d_graphic_setting.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12,
	13,
	14,
	15,
	16,
	17,
	18,
	19
}
pg.base = pg.base or {}
pg.base.dorm3d_graphic_setting = {}

;(function()
	pg.base.dorm3d_graphic_setting[1] = {
		settingName = "允许GPGPU",
		displayType = 1,
		id = 1,
		dispaySelectName = "",
		parentSetting = 0,
		isShow = 1
	}
	pg.base.dorm3d_graphic_setting[2] = {
		settingName = "高精度渲染",
		displayType = 1,
		id = 2,
		dispaySelectName = "",
		parentSetting = 0,
		isShow = 1
	}
	pg.base.dorm3d_graphic_setting[3] = {
		settingName = "绘制深度",
		displayType = 2,
		id = 3,
		parentSetting = 0,
		isShow = 1,
		dispaySelectName = {
			"自动",
			"强制启用"
		}
	}
	pg.base.dorm3d_graphic_setting[4] = {
		settingName = "着色器精度",
		displayType = 2,
		id = 4,
		parentSetting = 0,
		isShow = 1,
		dispaySelectName = {
			"低",
			"中",
			"高"
		}
	}
	pg.base.dorm3d_graphic_setting[5] = {
		settingName = "硬件抗锯齿",
		displayType = 2,
		id = 5,
		parentSetting = 0,
		isShow = 1,
		dispaySelectName = {
			"None",
			"MSAA 2x",
			"MSAA 4x",
			"MSAA 8x"
		}
	}
	pg.base.dorm3d_graphic_setting[6] = {
		settingName = "最大分辨率",
		displayType = 2,
		id = 6,
		parentSetting = 0,
		isShow = 1,
		dispaySelectName = {
			"720P",
			"900P",
			"1080P",
			"2k"
		}
	}
	pg.base.dorm3d_graphic_setting[7] = {
		settingName = "场景分辨率",
		displayType = 2,
		id = 7,
		parentSetting = 0,
		isShow = 0,
		dispaySelectName = {
			"Full",
			"90%",
			"80%",
			"70%",
			"60%",
			"50%",
			"40%",
			"30%",
			"20%",
			"10%"
		}
	}
	pg.base.dorm3d_graphic_setting[8] = {
		settingName = "场景最低分辨率",
		displayType = 2,
		id = 8,
		parentSetting = 0,
		isShow = 0,
		dispaySelectName = {
			"360P",
			"540P",
			"720P"
		}
	}
	pg.base.dorm3d_graphic_setting[9] = {
		settingName = "贴图分辨率",
		displayType = 2,
		id = 9,
		parentSetting = 0,
		isShow = 0,
		dispaySelectName = {
			"低",
			"中",
			"高",
			"最高"
		}
	}
	pg.base.dorm3d_graphic_setting[10] = {
		settingName = "静态阴影",
		displayType = 2,
		id = 10,
		parentSetting = 0,
		isShow = 0,
		dispaySelectName = {
			"禁用",
			"静态硬阴影",
			"静态软阴影"
		}
	}
	pg.base.dorm3d_graphic_setting[11] = {
		settingName = "实时阴影",
		displayType = 1,
		id = 11,
		dispaySelectName = "",
		parentSetting = 0,
		isShow = 1
	}
	pg.base.dorm3d_graphic_setting[12] = {
		settingName = "反射",
		displayType = 1,
		id = 12,
		dispaySelectName = "",
		parentSetting = 0,
		isShow = 1
	}
	pg.base.dorm3d_graphic_setting[13] = {
		settingName = "多光源",
		displayType = 1,
		id = 13,
		dispaySelectName = "",
		parentSetting = 0,
		isShow = 1
	}
	pg.base.dorm3d_graphic_setting[14] = {
		settingName = "角色描边",
		displayType = 1,
		id = 14,
		dispaySelectName = "",
		parentSetting = 0,
		isShow = 1
	}
	pg.base.dorm3d_graphic_setting[15] = {
		settingName = "后处理",
		displayType = 2,
		id = 15,
		parentSetting = 0,
		isShow = 1,
		dispaySelectName = {
			"关",
			"开",
			"高品质"
		}
	}
	pg.base.dorm3d_graphic_setting[16] = {
		settingName = "抗锯齿",
		displayType = 1,
		id = 16,
		dispaySelectName = "",
		parentSetting = 15,
		isShow = 1
	}
	pg.base.dorm3d_graphic_setting[17] = {
		settingName = "HDR",
		displayType = 1,
		id = 17,
		dispaySelectName = "",
		parentSetting = 15,
		isShow = 1
	}
	pg.base.dorm3d_graphic_setting[18] = {
		settingName = "景深",
		displayType = 1,
		id = 18,
		dispaySelectName = "",
		parentSetting = 15,
		isShow = 1
	}
	pg.base.dorm3d_graphic_setting[19] = {
		settingName = "扭曲",
		displayType = 1,
		id = 19,
		dispaySelectName = "",
		parentSetting = 15,
		isShow = 1
	}
end)()
