pg = pg or {}
pg.shop_banner_template = rawget(pg, "shop_banner_template") or setmetatable({
	__name = "shop_banner_template"
}, confNEO)
pg.shop_banner_template.all = {
	10,
	11,
	12,
	13,
	14,
	20,
	21,
	22,
	23,
	24,
	25,
	30,
	31,
	40,
	41,
	50,
	51
}
pg.shop_banner_template.get_id_list_by_name = {
	banner_big = {
		10,
		11,
		12,
		13,
		14
	},
	banner_middle = {
		20,
		21,
		22,
		23,
		24,
		25
	},
	banner_small1 = {
		30,
		31
	},
	banner_small2 = {
		40,
		41
	},
	banner_small3 = {
		50,
		51
	}
}
pg.base = pg.base or {}
pg.base.shop_banner_template = {}

;(function()
	pg.base.shop_banner_template[10] = {
		relation_param = "",
		name = "banner_big",
		order = 10,
		type = 2,
		id = 10,
		pic_overlay = "",
		pic = "shopbanner/shop_skin",
		time_lable = 1,
		time = {
			{
				{
					2026,
					10,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					10,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene skinshop",
			{}
		}
	}
	pg.base.shop_banner_template[11] = {
		relation_param = "",
		name = "banner_big",
		order = 9,
		type = 2,
		id = 11,
		pic_overlay = "",
		pic = "shopbanner/shop_skin2",
		time_lable = 1,
		time = {
			{
				{
					2026,
					11,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					11,
					25
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene skinshop",
			{}
		}
	}
	pg.base.shop_banner_template[12] = {
		relation_param = "",
		name = "banner_big",
		order = 8,
		type = 2,
		id = 12,
		pic_overlay = "",
		pic = "shopbanner/shop_skin3",
		time_lable = 1,
		time = {
			{
				{
					2026,
					11,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					11,
					25
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene skinshop",
			{}
		}
	}
	pg.base.shop_banner_template[13] = {
		relation_param = "",
		name = "banner_big",
		order = 7,
		type = 2,
		id = 13,
		pic_overlay = "",
		pic = "shopbanner/shop_skin4",
		time_lable = 1,
		time = {
			{
				{
					2026,
					11,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					11,
					25
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene skinshop",
			{}
		}
	}
	pg.base.shop_banner_template[14] = {
		relation_param = "",
		name = "banner_big",
		time = "always",
		type = 2,
		order = 1,
		pic = "shopbanner/shop_skin_default",
		id = 14,
		pic_overlay = "",
		time_lable = 0,
		param = {
			"scene skinshop",
			{}
		}
	}
	pg.base.shop_banner_template[20] = {
		order = 99,
		name = "banner_middle",
		type = 2,
		id = 20,
		pic_overlay = "",
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene charge",
			{
				warp = 4
			}
		},
		relation_param = {
			1,
			9023
		}
	}
	pg.base.shop_banner_template[21] = {
		order = 98,
		name = "banner_middle",
		type = 2,
		id = 21,
		pic_overlay = "",
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					9,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene charge",
			{
				warp = 4
			}
		},
		relation_param = {
			1,
			9024
		}
	}
	pg.base.shop_banner_template[22] = {
		relation_param = "",
		name = "banner_middle",
		time = "always",
		type = 2,
		order = 1,
		pic = "shopbanner/shop_akashi_recommend",
		id = 22,
		pic_overlay = "",
		time_lable = 0,
		param = {
			"scene charge",
			{
				warp = 4
			}
		}
	}
	pg.base.shop_banner_template[23] = {
		order = 92,
		name = "banner_middle",
		type = 2,
		id = 23,
		pic_overlay = "",
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene charge",
			{
				warp = 4
			}
		},
		relation_param = {
			1,
			9021
		}
	}
	pg.base.shop_banner_template[24] = {
		order = 91,
		name = "banner_middle",
		type = 2,
		id = 24,
		pic_overlay = "",
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene charge",
			{
				warp = 4
			}
		},
		relation_param = {
			1,
			9022
		}
	}
	pg.base.shop_banner_template[25] = {
		order = 90,
		name = "banner_middle",
		type = 2,
		id = 25,
		pic_overlay = "",
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene charge",
			{
				warp = 4
			}
		},
		relation_param = {
			1,
			2093
		}
	}
	pg.base.shop_banner_template[30] = {
		relation_param = "",
		name = "banner_small1",
		time = "always",
		type = 2,
		order = 10,
		pic = "shopbanner/shop_diamond",
		id = 30,
		pic_overlay = "",
		time_lable = 0,
		param = {
			"scene charge",
			{
				warp = 1
			}
		}
	}
	pg.base.shop_banner_template[31] = {
		relation_param = "",
		name = "banner_small1",
		time = "always",
		type = 2,
		order = 1,
		pic = "shopbanner/shop_props",
		id = 31,
		pic_overlay = "",
		time_lable = 0,
		param = {
			"scene charge",
			{
				warp = 3
			}
		}
	}
	pg.base.shop_banner_template[40] = {
		param = "",
		name = "banner_small2",
		time = "stop",
		type = 2,
		relation_param = "",
		order = 10,
		pic = "",
		id = 40,
		pic_overlay = "",
		time_lable = 0
	}
	pg.base.shop_banner_template[41] = {
		order = 1,
		name = "banner_small2",
		time = "always",
		type = 2,
		id = 41,
		pic_overlay = "",
		pic = "shopbanner/shop_item_bg",
		time_lable = 0,
		param = {
			"scene charge",
			{
				warp = 1
			}
		},
		relation_param = {
			1,
			1
		}
	}
	pg.base.shop_banner_template[50] = {
		relation_param = "",
		name = "banner_small3",
		order = 10,
		type = 2,
		id = 50,
		pic_overlay = "shopbanner_text/activity",
		pic = "shopbanner/shop_event_pt",
		time_lable = 1,
		time = {
			{
				{
					2026,
					10,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					11,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		param = {
			"scene shop",
			{
				warp = "activity"
			}
		}
	}
	pg.base.shop_banner_template[51] = {
		relation_param = "",
		name = "banner_small3",
		time = "always",
		type = 2,
		order = 1,
		pic = "shopbanner/shop_shopstreet",
		id = 51,
		pic_overlay = "shopbanner_text/supply",
		time_lable = 0,
		param = {
			"scene shop",
			{
				warp = "shopstreet"
			}
		}
	}
end)()
