pg = pg or {}
pg.gameroom_shop_template = rawget(pg, "gameroom_shop_template") or setmetatable({
	__name = "gameroom_shop_template"
}, confNEO)
pg.gameroom_shop_template.all = {
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
	19,
	20,
	21,
	22,
	23,
	24,
	25,
	26,
	27,
	28,
	29,
	30
}
pg.base = pg.base or {}
pg.base.gameroom_shop_template = {}

;(function()
	pg.base.gameroom_shop_template[1] = {
		price = 7500,
		goods_purchase_limit = 1,
		month_re = 0,
		type = 6,
		goods_rarity = 5,
		num = 1,
		drop_type = 7,
		goods_name = "美味的祭典？",
		goods_type = 1,
		id = 1,
		goods_icon = "",
		order = 4,
		goods = {
			201221
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[2] = {
		price = 7500,
		goods_purchase_limit = 1,
		month_re = 0,
		type = 6,
		goods_rarity = 5,
		num = 1,
		drop_type = 7,
		goods_name = "新年的剑鬼",
		goods_type = 1,
		id = 2,
		goods_icon = "",
		order = 5,
		goods = {
			302081
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[3] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱",
		goods_type = 1,
		id = 3,
		goods_icon = "",
		order = 111,
		goods = {
			30302
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[4] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(春节)",
		goods_type = 1,
		id = 4,
		goods_icon = "",
		order = 112,
		goods = {
			30304
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[5] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(开学季)",
		goods_type = 1,
		id = 5,
		goods_icon = "",
		order = 113,
		goods = {
			30305
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[6] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(夏末)",
		goods_type = 1,
		id = 6,
		goods_icon = "",
		order = 114,
		goods = {
			30307
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[7] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(小猪)",
		goods_type = 1,
		id = 7,
		goods_icon = "",
		order = 115,
		goods = {
			30310
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[8] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(皇家)",
		goods_type = 1,
		id = 8,
		goods_icon = "",
		order = 116,
		goods = {
			30311
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[9] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(撒丁)",
		goods_type = 1,
		id = 9,
		goods_icon = "",
		order = 117,
		goods = {
			30314
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[10] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(激奏)",
		goods_type = 1,
		id = 10,
		goods_icon = "",
		order = 118,
		goods = {
			30315
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[11] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(北联)",
		goods_type = 1,
		id = 11,
		goods_icon = "",
		order = 119,
		goods = {
			30317
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[12] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(白鹰)",
		goods_type = 1,
		id = 12,
		goods_icon = "",
		order = 120,
		goods = {
			30318
		},
		time = {
			{
				{
					2023,
					6,
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
					2033,
					6,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[13] = {
		price = 7500,
		goods_purchase_limit = 1,
		month_re = 0,
		type = 6,
		goods_rarity = 5,
		num = 1,
		drop_type = 7,
		goods_name = "Candy Magic！",
		goods_type = 1,
		id = 13,
		goods_icon = "",
		order = 2,
		goods = {
			101291
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[14] = {
		price = 7500,
		goods_purchase_limit = 1,
		month_re = 0,
		type = 6,
		goods_rarity = 5,
		num = 1,
		drop_type = 7,
		goods_name = "迎春的神乐舞",
		goods_type = 1,
		id = 14,
		goods_icon = "",
		order = 3,
		goods = {
			301571
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[15] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(鸢尾)",
		goods_type = 1,
		id = 15,
		goods_icon = "",
		order = 101,
		goods = {
			30319
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[16] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(医疗)",
		goods_type = 1,
		id = 16,
		goods_icon = "",
		order = 102,
		goods = {
			30320
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[17] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = " 外观装备箱(重樱)",
		goods_type = 1,
		id = 17,
		goods_icon = "",
		order = 103,
		goods = {
			30321
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[18] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(激唱)",
		goods_type = 1,
		id = 18,
		goods_icon = "",
		order = 104,
		goods = {
			30322
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[19] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(铁血)",
		goods_type = 1,
		id = 19,
		goods_icon = "",
		order = 105,
		goods = {
			30324
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[20] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(2021春节)",
		goods_type = 1,
		id = 20,
		goods_icon = "",
		order = 106,
		goods = {
			30325
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[21] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(游乐园)",
		goods_type = 1,
		id = 21,
		goods_icon = "",
		order = 107,
		goods = {
			30326
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[22] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(牛仔)",
		goods_type = 1,
		id = 22,
		goods_icon = "",
		order = 108,
		goods = {
			30328
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[23] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(水上乐园)",
		goods_type = 1,
		id = 23,
		goods_icon = "",
		order = 109,
		goods = {
			30329
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[24] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(女仆咖啡)",
		goods_type = 1,
		id = 24,
		goods_icon = "",
		order = 110,
		goods = {
			30331
		},
		time = {
			{
				{
					2024,
					8,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[25] = {
		price = 7500,
		goods_purchase_limit = 1,
		month_re = 0,
		type = 6,
		goods_rarity = 5,
		num = 1,
		drop_type = 7,
		goods_name = "新年的LittleKnight",
		goods_type = 1,
		id = 25,
		goods_icon = "",
		order = 1,
		goods = {
			202072
		},
		time = {
			{
				{
					2025,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[26] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(2022春节)",
		goods_type = 1,
		id = 26,
		goods_icon = "",
		order = 96,
		goods = {
			30332
		},
		time = {
			{
				{
					2025,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[27] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(红月)",
		goods_type = 1,
		id = 27,
		goods_icon = "",
		order = 97,
		goods = {
			30333
		},
		time = {
			{
				{
					2025,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[28] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(东煌时尚)",
		goods_type = 1,
		id = 28,
		goods_icon = "",
		order = 98,
		goods = {
			30334
		},
		time = {
			{
				{
					2025,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[29] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(童话世界)",
		goods_type = 1,
		id = 29,
		goods_icon = "",
		order = 99,
		goods = {
			30335
		},
		time = {
			{
				{
					2025,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.gameroom_shop_template[30] = {
		price = 1200,
		goods_purchase_limit = 10,
		month_re = 0,
		type = 2,
		goods_rarity = 4,
		num = 1,
		drop_type = 2,
		goods_name = "外观装备箱(舞蹈)",
		goods_type = 1,
		id = 30,
		goods_icon = "",
		order = 100,
		goods = {
			30336
		},
		time = {
			{
				{
					2025,
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
					2034,
					8,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
end)()
