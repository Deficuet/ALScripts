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
		order = 10,
		name = "banner_big",
		type = 2,
		id = 10,
		relation_param = "",
		pic = "shopbanner/shop_skin",
		time_lable = 1,
		time = {
			{
				{
					2026,
					8,
					27
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
					8,
					31
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
		order = 9,
		name = "banner_big",
		type = 2,
		id = 11,
		relation_param = "",
		pic = "shopbanner/shop_skin2",
		time_lable = 1,
		time = {
			{
				{
					2026,
					8,
					13
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
					8,
					14
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
		order = 8,
		name = "banner_big",
		type = 2,
		id = 12,
		relation_param = "",
		pic = "shopbanner/shop_skin3",
		time_lable = 1,
		time = {
			{
				{
					2026,
					6,
					5
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
					6,
					17
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
		order = 7,
		name = "banner_big",
		time = "stop",
		type = 2,
		id = 13,
		relation_param = "",
		pic = "shopbanner/shop_skin4",
		time_lable = 1,
		param = {
			"scene skinshop",
			{}
		}
	}
	pg.base.shop_banner_template[14] = {
		order = 1,
		name = "banner_big",
		time = "always",
		type = 2,
		id = 14,
		relation_param = "",
		pic = "shopbanner/shop_skin_default",
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
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					8,
					13
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
					8,
					26
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
			9020
		}
	}
	pg.base.shop_banner_template[21] = {
		order = 98,
		name = "banner_middle",
		type = 2,
		id = 21,
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					5,
					28
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
					6,
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
			"scene charge",
			{
				warp = 4
			}
		},
		relation_param = {
			1,
			9019
		}
	}
	pg.base.shop_banner_template[22] = {
		order = 1,
		name = "banner_middle",
		time = "always",
		type = 2,
		id = 22,
		relation_param = "",
		pic = "shopbanner/shop_akashi_recommend",
		time_lable = 0,
		param = {
			"scene charge",
			{
				warp = 4
			}
		}
	}
	pg.base.shop_banner_template[23] = {
		order = 97,
		name = "banner_middle",
		type = 2,
		id = 23,
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					5,
					20
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
					6,
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
			"scene charge",
			{
				warp = 4
			}
		},
		relation_param = {
			1,
			9016
		}
	}
	pg.base.shop_banner_template[24] = {
		order = 96,
		name = "banner_middle",
		type = 2,
		id = 24,
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					5,
					20
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
					6,
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
			"scene charge",
			{
				warp = 4
			}
		},
		relation_param = {
			1,
			9017
		}
	}
	pg.base.shop_banner_template[25] = {
		order = 95,
		name = "banner_middle",
		type = 2,
		id = 25,
		pic = "shopbanner/shop_pack_bg",
		time_lable = 1,
		time = {
			{
				{
					2026,
					5,
					20
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
					6,
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
			"scene charge",
			{
				warp = 4
			}
		},
		relation_param = {
			1,
			2079
		}
	}
	pg.base.shop_banner_template[30] = {
		order = 10,
		name = "banner_small1",
		time = "always",
		type = 2,
		id = 30,
		relation_param = "",
		pic = "shopbanner/shop_diamond",
		time_lable = 0,
		param = {
			"scene charge",
			{
				warp = 1
			}
		}
	}
	pg.base.shop_banner_template[31] = {
		order = 1,
		name = "banner_small1",
		time = "always",
		type = 2,
		id = 31,
		relation_param = "",
		pic = "shopbanner/shop_props",
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
		order = 10,
		pic = "",
		id = 40,
		relation_param = "",
		time_lable = 0
	}
	pg.base.shop_banner_template[41] = {
		order = 1,
		name = "banner_small2",
		time = "always",
		type = 2,
		id = 41,
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
		order = 10,
		name = "banner_small3",
		type = 2,
		id = 50,
		relation_param = "",
		pic = "shopbanner/shop_event_pt",
		time_lable = 1,
		time = {
			{
				{
					2026,
					8,
					13
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
					3
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
		order = 1,
		name = "banner_small3",
		time = "always",
		type = 2,
		id = 51,
		relation_param = "",
		pic = "shopbanner/shop_shopstreet",
		time_lable = 0,
		param = {
			"scene shop",
			{
				warp = "shopstreet"
			}
		}
	}
end)()
