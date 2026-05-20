return {
	effect_list = {
		{
			id = 1,
			type = "BattleBuffShieldWall",
			trigger = {
				"onStack",
				"onUpdate"
			},
			arg_list = {
				do_when_hit = "intercept",
				effect = "shield05",
				count = 2,
				bulletType = 3,
				cld_list = {
					{
						box = {
							4,
							6,
							9
						},
						offset = {
							1.02,
							0,
							1.22
						}
					}
				},
				centerPosFun = function(arg_1_0)
					local var_1_0 = arg_1_0 * 3

					return Vector3(math.sin(var_1_0) * 3, 0.75, math.cos(var_1_0) * 3)
				end,
				rotationFun = function(arg_2_0)
					return Vector3(0, arg_2_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
				end
			}
		},
		{
			id = 2,
			type = "BattleBuffShieldWall",
			trigger = {
				"onStack",
				"onUpdate"
			},
			arg_list = {
				do_when_hit = "intercept",
				effect = "shield05",
				count = 2,
				bulletType = 3,
				cld_list = {
					{
						box = {
							4,
							6,
							9
						},
						offset = {
							1.02,
							0,
							1.22
						}
					}
				},
				centerPosFun = function(arg_3_0)
					local var_3_0 = arg_3_0 * 3 + 2.512

					return Vector3(math.sin(var_3_0) * 3, 0.75, math.cos(var_3_0) * 3)
				end,
				rotationFun = function(arg_4_0)
					return Vector3(0, arg_4_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
				end
			}
		},
		{
			id = 3,
			type = "BattleBuffShieldWall",
			trigger = {
				"onStack",
				"onUpdate"
			},
			arg_list = {
				do_when_hit = "intercept",
				effect = "shield05",
				count = 2,
				bulletType = 3,
				cld_list = {
					{
						box = {
							4,
							6,
							9
						},
						offset = {
							1.02,
							0,
							1.22
						}
					}
				},
				centerPosFun = function(arg_5_0)
					local var_5_0 = arg_5_0 * 3 - 2.512

					return Vector3(math.sin(var_5_0) * 3, 0.75, math.cos(var_5_0) * 3)
				end,
				rotationFun = function(arg_6_0)
					return Vector3(0, arg_6_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
				end
			}
		},
		{
			id = 4,
			type = "BattleBuffDamageWall",
			trigger = {
				"onStack",
				"onUpdate"
			},
			arg_list = {
				count = 6,
				effect = "shield06",
				damage = 55,
				attack_attribute = 1,
				cld_list = {
					{
						box = {
							4,
							6,
							9
						},
						offset = {
							1.02,
							0,
							1.22
						}
					}
				},
				centerPosFun = function(arg_7_0)
					local var_7_0 = arg_7_0 * 3

					return Vector3(math.sin(var_7_0) * 8, 0.75, math.cos(var_7_0) * 8)
				end,
				rotationFun = function(arg_8_0)
					return Vector3(0, arg_8_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
				end
			}
		},
		{
			id = 5,
			type = "BattleBuffDamageWall",
			trigger = {
				"onStack",
				"onUpdate"
			},
			arg_list = {
				count = 6,
				effect = "shield06",
				damage = 55,
				attack_attribute = 1,
				cld_list = {
					{
						box = {
							4,
							6,
							9
						},
						offset = {
							1.02,
							0,
							1.22
						}
					}
				},
				centerPosFun = function(arg_9_0)
					local var_9_0 = arg_9_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

					return Vector3(math.sin(var_9_0) * 8, 0.75, math.cos(var_9_0) * 8)
				end,
				rotationFun = function(arg_10_0)
					return Vector3(0, arg_10_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
				end
			}
		},
		{
			id = 6,
			type = "BattleBuffDamageWall",
			trigger = {
				"onStack",
				"onUpdate"
			},
			arg_list = {
				count = 6,
				effect = "shield06",
				damage = 55,
				attack_attribute = 1,
				cld_list = {
					{
						box = {
							4,
							6,
							9
						},
						offset = {
							1.02,
							0,
							1.22
						}
					}
				},
				centerPosFun = function(arg_11_0)
					local var_11_0 = arg_11_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

					return Vector3(math.sin(var_11_0) * 8, 0.75, math.cos(var_11_0) * 8)
				end,
				rotationFun = function(arg_12_0)
					return Vector3(0, arg_12_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
				end
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_13_0)
						local var_13_0 = arg_13_0 * 3

						return Vector3(math.sin(var_13_0) * 3, 0.75, math.cos(var_13_0) * 3)
					end,
					rotationFun = function(arg_14_0)
						return Vector3(0, arg_14_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_15_0)
						local var_15_0 = arg_15_0 * 3 + 2.512

						return Vector3(math.sin(var_15_0) * 3, 0.75, math.cos(var_15_0) * 3)
					end,
					rotationFun = function(arg_16_0)
						return Vector3(0, arg_16_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_17_0)
						local var_17_0 = arg_17_0 * 3 - 2.512

						return Vector3(math.sin(var_17_0) * 3, 0.75, math.cos(var_17_0) * 3)
					end,
					rotationFun = function(arg_18_0)
						return Vector3(0, arg_18_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 55,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_19_0)
						local var_19_0 = arg_19_0 * 3

						return Vector3(math.sin(var_19_0) * 8, 0.75, math.cos(var_19_0) * 8)
					end,
					rotationFun = function(arg_20_0)
						return Vector3(0, arg_20_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 55,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_21_0)
						local var_21_0 = arg_21_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_21_0) * 8, 0.75, math.cos(var_21_0) * 8)
					end,
					rotationFun = function(arg_22_0)
						return Vector3(0, arg_22_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 55,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_23_0)
						local var_23_0 = arg_23_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_23_0) * 8, 0.75, math.cos(var_23_0) * 8)
					end,
					rotationFun = function(arg_24_0)
						return Vector3(0, arg_24_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_25_0)
						local var_25_0 = arg_25_0 * 3

						return Vector3(math.sin(var_25_0) * 3, 0.75, math.cos(var_25_0) * 3)
					end,
					rotationFun = function(arg_26_0)
						return Vector3(0, arg_26_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_27_0)
						local var_27_0 = arg_27_0 * 3 + 2.512

						return Vector3(math.sin(var_27_0) * 3, 0.75, math.cos(var_27_0) * 3)
					end,
					rotationFun = function(arg_28_0)
						return Vector3(0, arg_28_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_29_0)
						local var_29_0 = arg_29_0 * 3 - 2.512

						return Vector3(math.sin(var_29_0) * 3, 0.75, math.cos(var_29_0) * 3)
					end,
					rotationFun = function(arg_30_0)
						return Vector3(0, arg_30_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 60,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_31_0)
						local var_31_0 = arg_31_0 * 3

						return Vector3(math.sin(var_31_0) * 8, 0.75, math.cos(var_31_0) * 8)
					end,
					rotationFun = function(arg_32_0)
						return Vector3(0, arg_32_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 60,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_33_0)
						local var_33_0 = arg_33_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_33_0) * 8, 0.75, math.cos(var_33_0) * 8)
					end,
					rotationFun = function(arg_34_0)
						return Vector3(0, arg_34_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 60,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_35_0)
						local var_35_0 = arg_35_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_35_0) * 8, 0.75, math.cos(var_35_0) * 8)
					end,
					rotationFun = function(arg_36_0)
						return Vector3(0, arg_36_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_37_0)
						local var_37_0 = arg_37_0 * 3

						return Vector3(math.sin(var_37_0) * 3, 0.75, math.cos(var_37_0) * 3)
					end,
					rotationFun = function(arg_38_0)
						return Vector3(0, arg_38_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_39_0)
						local var_39_0 = arg_39_0 * 3 + 2.512

						return Vector3(math.sin(var_39_0) * 3, 0.75, math.cos(var_39_0) * 3)
					end,
					rotationFun = function(arg_40_0)
						return Vector3(0, arg_40_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_41_0)
						local var_41_0 = arg_41_0 * 3 - 2.512

						return Vector3(math.sin(var_41_0) * 3, 0.75, math.cos(var_41_0) * 3)
					end,
					rotationFun = function(arg_42_0)
						return Vector3(0, arg_42_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 65,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_43_0)
						local var_43_0 = arg_43_0 * 3

						return Vector3(math.sin(var_43_0) * 8, 0.75, math.cos(var_43_0) * 8)
					end,
					rotationFun = function(arg_44_0)
						return Vector3(0, arg_44_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 65,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_45_0)
						local var_45_0 = arg_45_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_45_0) * 8, 0.75, math.cos(var_45_0) * 8)
					end,
					rotationFun = function(arg_46_0)
						return Vector3(0, arg_46_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 65,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_47_0)
						local var_47_0 = arg_47_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_47_0) * 8, 0.75, math.cos(var_47_0) * 8)
					end,
					rotationFun = function(arg_48_0)
						return Vector3(0, arg_48_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_49_0)
						local var_49_0 = arg_49_0 * 3

						return Vector3(math.sin(var_49_0) * 3, 0.75, math.cos(var_49_0) * 3)
					end,
					rotationFun = function(arg_50_0)
						return Vector3(0, arg_50_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_51_0)
						local var_51_0 = arg_51_0 * 3 + 2.512

						return Vector3(math.sin(var_51_0) * 3, 0.75, math.cos(var_51_0) * 3)
					end,
					rotationFun = function(arg_52_0)
						return Vector3(0, arg_52_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_53_0)
						local var_53_0 = arg_53_0 * 3 - 2.512

						return Vector3(math.sin(var_53_0) * 3, 0.75, math.cos(var_53_0) * 3)
					end,
					rotationFun = function(arg_54_0)
						return Vector3(0, arg_54_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 70,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_55_0)
						local var_55_0 = arg_55_0 * 3

						return Vector3(math.sin(var_55_0) * 8, 0.75, math.cos(var_55_0) * 8)
					end,
					rotationFun = function(arg_56_0)
						return Vector3(0, arg_56_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 70,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_57_0)
						local var_57_0 = arg_57_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_57_0) * 8, 0.75, math.cos(var_57_0) * 8)
					end,
					rotationFun = function(arg_58_0)
						return Vector3(0, arg_58_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 70,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_59_0)
						local var_59_0 = arg_59_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_59_0) * 8, 0.75, math.cos(var_59_0) * 8)
					end,
					rotationFun = function(arg_60_0)
						return Vector3(0, arg_60_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_61_0)
						local var_61_0 = arg_61_0 * 3

						return Vector3(math.sin(var_61_0) * 3, 0.75, math.cos(var_61_0) * 3)
					end,
					rotationFun = function(arg_62_0)
						return Vector3(0, arg_62_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_63_0)
						local var_63_0 = arg_63_0 * 3 + 2.512

						return Vector3(math.sin(var_63_0) * 3, 0.75, math.cos(var_63_0) * 3)
					end,
					rotationFun = function(arg_64_0)
						return Vector3(0, arg_64_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_65_0)
						local var_65_0 = arg_65_0 * 3 - 2.512

						return Vector3(math.sin(var_65_0) * 3, 0.75, math.cos(var_65_0) * 3)
					end,
					rotationFun = function(arg_66_0)
						return Vector3(0, arg_66_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 75,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_67_0)
						local var_67_0 = arg_67_0 * 3

						return Vector3(math.sin(var_67_0) * 8, 0.75, math.cos(var_67_0) * 8)
					end,
					rotationFun = function(arg_68_0)
						return Vector3(0, arg_68_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 75,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_69_0)
						local var_69_0 = arg_69_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_69_0) * 8, 0.75, math.cos(var_69_0) * 8)
					end,
					rotationFun = function(arg_70_0)
						return Vector3(0, arg_70_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 75,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_71_0)
						local var_71_0 = arg_71_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_71_0) * 8, 0.75, math.cos(var_71_0) * 8)
					end,
					rotationFun = function(arg_72_0)
						return Vector3(0, arg_72_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_73_0)
						local var_73_0 = arg_73_0 * 3

						return Vector3(math.sin(var_73_0) * 3, 0.75, math.cos(var_73_0) * 3)
					end,
					rotationFun = function(arg_74_0)
						return Vector3(0, arg_74_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_75_0)
						local var_75_0 = arg_75_0 * 3 + 2.512

						return Vector3(math.sin(var_75_0) * 3, 0.75, math.cos(var_75_0) * 3)
					end,
					rotationFun = function(arg_76_0)
						return Vector3(0, arg_76_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_77_0)
						local var_77_0 = arg_77_0 * 3 - 2.512

						return Vector3(math.sin(var_77_0) * 3, 0.75, math.cos(var_77_0) * 3)
					end,
					rotationFun = function(arg_78_0)
						return Vector3(0, arg_78_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 80,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_79_0)
						local var_79_0 = arg_79_0 * 3

						return Vector3(math.sin(var_79_0) * 8, 0.75, math.cos(var_79_0) * 8)
					end,
					rotationFun = function(arg_80_0)
						return Vector3(0, arg_80_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 80,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_81_0)
						local var_81_0 = arg_81_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_81_0) * 8, 0.75, math.cos(var_81_0) * 8)
					end,
					rotationFun = function(arg_82_0)
						return Vector3(0, arg_82_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 80,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_83_0)
						local var_83_0 = arg_83_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_83_0) * 8, 0.75, math.cos(var_83_0) * 8)
					end,
					rotationFun = function(arg_84_0)
						return Vector3(0, arg_84_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_85_0)
						local var_85_0 = arg_85_0 * 3

						return Vector3(math.sin(var_85_0) * 3, 0.75, math.cos(var_85_0) * 3)
					end,
					rotationFun = function(arg_86_0)
						return Vector3(0, arg_86_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_87_0)
						local var_87_0 = arg_87_0 * 3 + 2.512

						return Vector3(math.sin(var_87_0) * 3, 0.75, math.cos(var_87_0) * 3)
					end,
					rotationFun = function(arg_88_0)
						return Vector3(0, arg_88_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_89_0)
						local var_89_0 = arg_89_0 * 3 - 2.512

						return Vector3(math.sin(var_89_0) * 3, 0.75, math.cos(var_89_0) * 3)
					end,
					rotationFun = function(arg_90_0)
						return Vector3(0, arg_90_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 85,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_91_0)
						local var_91_0 = arg_91_0 * 3

						return Vector3(math.sin(var_91_0) * 8, 0.75, math.cos(var_91_0) * 8)
					end,
					rotationFun = function(arg_92_0)
						return Vector3(0, arg_92_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 85,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_93_0)
						local var_93_0 = arg_93_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_93_0) * 8, 0.75, math.cos(var_93_0) * 8)
					end,
					rotationFun = function(arg_94_0)
						return Vector3(0, arg_94_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 85,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_95_0)
						local var_95_0 = arg_95_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_95_0) * 8, 0.75, math.cos(var_95_0) * 8)
					end,
					rotationFun = function(arg_96_0)
						return Vector3(0, arg_96_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_97_0)
						local var_97_0 = arg_97_0 * 3

						return Vector3(math.sin(var_97_0) * 3, 0.75, math.cos(var_97_0) * 3)
					end,
					rotationFun = function(arg_98_0)
						return Vector3(0, arg_98_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_99_0)
						local var_99_0 = arg_99_0 * 3 + 2.512

						return Vector3(math.sin(var_99_0) * 3, 0.75, math.cos(var_99_0) * 3)
					end,
					rotationFun = function(arg_100_0)
						return Vector3(0, arg_100_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_101_0)
						local var_101_0 = arg_101_0 * 3 - 2.512

						return Vector3(math.sin(var_101_0) * 3, 0.75, math.cos(var_101_0) * 3)
					end,
					rotationFun = function(arg_102_0)
						return Vector3(0, arg_102_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 90,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_103_0)
						local var_103_0 = arg_103_0 * 3

						return Vector3(math.sin(var_103_0) * 8, 0.75, math.cos(var_103_0) * 8)
					end,
					rotationFun = function(arg_104_0)
						return Vector3(0, arg_104_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 90,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_105_0)
						local var_105_0 = arg_105_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_105_0) * 8, 0.75, math.cos(var_105_0) * 8)
					end,
					rotationFun = function(arg_106_0)
						return Vector3(0, arg_106_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 90,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_107_0)
						local var_107_0 = arg_107_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_107_0) * 8, 0.75, math.cos(var_107_0) * 8)
					end,
					rotationFun = function(arg_108_0)
						return Vector3(0, arg_108_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_109_0)
						local var_109_0 = arg_109_0 * 3

						return Vector3(math.sin(var_109_0) * 3, 0.75, math.cos(var_109_0) * 3)
					end,
					rotationFun = function(arg_110_0)
						return Vector3(0, arg_110_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_111_0)
						local var_111_0 = arg_111_0 * 3 + 2.512

						return Vector3(math.sin(var_111_0) * 3, 0.75, math.cos(var_111_0) * 3)
					end,
					rotationFun = function(arg_112_0)
						return Vector3(0, arg_112_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_113_0)
						local var_113_0 = arg_113_0 * 3 - 2.512

						return Vector3(math.sin(var_113_0) * 3, 0.75, math.cos(var_113_0) * 3)
					end,
					rotationFun = function(arg_114_0)
						return Vector3(0, arg_114_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 95,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_115_0)
						local var_115_0 = arg_115_0 * 3

						return Vector3(math.sin(var_115_0) * 8, 0.75, math.cos(var_115_0) * 8)
					end,
					rotationFun = function(arg_116_0)
						return Vector3(0, arg_116_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 95,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_117_0)
						local var_117_0 = arg_117_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_117_0) * 8, 0.75, math.cos(var_117_0) * 8)
					end,
					rotationFun = function(arg_118_0)
						return Vector3(0, arg_118_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 95,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_119_0)
						local var_119_0 = arg_119_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_119_0) * 8, 0.75, math.cos(var_119_0) * 8)
					end,
					rotationFun = function(arg_120_0)
						return Vector3(0, arg_120_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	{
		effect_list = {
			{
				id = 1,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_121_0)
						local var_121_0 = arg_121_0 * 3

						return Vector3(math.sin(var_121_0) * 3, 0.75, math.cos(var_121_0) * 3)
					end,
					rotationFun = function(arg_122_0)
						return Vector3(0, arg_122_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 2,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_123_0)
						local var_123_0 = arg_123_0 * 3 + 2.512

						return Vector3(math.sin(var_123_0) * 3, 0.75, math.cos(var_123_0) * 3)
					end,
					rotationFun = function(arg_124_0)
						return Vector3(0, arg_124_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 234, 0)
					end
				}
			},
			{
				id = 3,
				type = "BattleBuffShieldWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					do_when_hit = "intercept",
					effect = "shield05",
					count = 2,
					bulletType = 3,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_125_0)
						local var_125_0 = arg_125_0 * 3 - 2.512

						return Vector3(math.sin(var_125_0) * 3, 0.75, math.cos(var_125_0) * 3)
					end,
					rotationFun = function(arg_126_0)
						return Vector3(0, arg_126_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 54, 0)
					end
				}
			},
			{
				id = 4,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 100,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_127_0)
						local var_127_0 = arg_127_0 * 3

						return Vector3(math.sin(var_127_0) * 8, 0.75, math.cos(var_127_0) * 8)
					end,
					rotationFun = function(arg_128_0)
						return Vector3(0, arg_128_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
					end
				}
			},
			{
				id = 5,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 100,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_129_0)
						local var_129_0 = arg_129_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_2

						return Vector3(math.sin(var_129_0) * 8, 0.75, math.cos(var_129_0) * 8)
					end,
					rotationFun = function(arg_130_0)
						return Vector3(0, arg_130_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 210, 0)
					end
				}
			},
			{
				id = 6,
				type = "BattleBuffDamageWall",
				trigger = {
					"onStack",
					"onUpdate"
				},
				arg_list = {
					count = 6,
					effect = "shield06",
					damage = 100,
					attack_attribute = 1,
					cld_list = {
						{
							box = {
								4,
								6,
								9
							},
							offset = {
								1.02,
								0,
								1.22
							}
						}
					},
					centerPosFun = function(arg_131_0)
						local var_131_0 = arg_131_0 * 3 + ys.Battle.BattleConfig.SHIELD_CENTER_CONST_4

						return Vector3(math.sin(var_131_0) * 8, 0.75, math.cos(var_131_0) * 8)
					end,
					rotationFun = function(arg_132_0)
						return Vector3(0, arg_132_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST - 20, 0)
					end
				}
			}
		}
	},
	init_effect = "",
	name = "",
	time = 10,
	picture = "",
	desc = "守卫之盾",
	stack = 1,
	id = 152361,
	icon = 152361,
	last_effect = ""
}
