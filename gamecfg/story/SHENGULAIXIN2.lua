return {
	fadeOut = 1.5,
	mode = 2,
	id = "SHENGULAIXIN2",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_138",
			say = "THUD!",
			bgm = "theme-room-rosy",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_138",
			say = "The door to the sickroom shuts, and then the footsteps that had been wandering in the area grow more distant.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_138",
			side = 2,
			actorName = "{playername}",
			say = "(Those creepy nurses should be gone by now.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_138",
			say = "As soon as I breathe a sigh of relief, the curtains around my bed are pulled aside with a hard tug.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = "home",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 901072,
			say = "Huff... Puff... I knew I could smell you...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 901072,
			say = "I've got you now, Commander!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Caught off guard, I'm suddenly pushed flat onto the bed. Before I can even fight back, Mogador mounts me, her face flushed and breathing heavily.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 901072,
			say = "I can't help but wonder – why would our dear patient hide in here all alone? Ahah♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Her eyes are darting everywhere, her body is hot to the touch, and she's shockingly strong. One thing is clear: She's not thinking straight.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_138",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 901072,
			actorName = "{playername}",
			live2d = true,
			say = "(Something's wrong with her... I need to find an excuse...)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "I asked for a physical examination.",
					flag = 1
				},
				{
					content = "I got lost.",
					flag = 2
				}
			}
		},
		{
			actor = 901072,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			optionFlag = 1,
			nameColor = "#A9F548FF",
			say = "Heh... That's exactly what I thought.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_138",
			nameColor = "#A9F548FF",
			optionFlag = 1,
			hideRecordIco = true,
			actor = 901072,
			actorName = "{playername}",
			live2d = true,
			say = "In that case...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_138",
			dir = 1,
			optionFlag = 1,
			actor = 901072,
			nameColor = "#A9F548FF",
			live2d = "touch",
			say = "Allow me to do the honors. Heehee♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_138",
			dir = 1,
			optionFlag = 2,
			actor = 901072,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "Lost? Where were you going?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_138",
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hideRecordIco = true,
			actor = 901072,
			actorName = "{playername}",
			live2d = true,
			say = "I was going to get a physical check-up.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_138",
			dir = 1,
			optionFlag = 2,
			actor = 901072,
			nameColor = "#A9F548FF",
			live2d = "touch",
			say = "Then you might as well do it here. I'll perform your physical checkup... Heehee♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_138",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 901072,
			actorName = "{playername}",
			live2d = true,
			say = "How do you expect to do that? There's no equipment here.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			side = 2,
			say = "Haha... I don't need equipment♥ I know the latest and greatest examination method that requires no tools.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She leans over me, her hot breaths caressing my neck.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = "touch2",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 901072,
			say = "*sniff sniff*... It's called an olfactory examination.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 901072,
			say = "Ahh... God, yes... The smell of fresh sweat... *sniff sniff*...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			side = 2,
			say = "Your body's awfully stiff, though... Are you hurt?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_138",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 901072,
			actorName = "{playername}",
			live2d = true,
			say = "Nope.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 901072,
			say = "*sniff sniff*... It's not nice to lie, Commander... Your smell tells the truth...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 901072,
			say = "You know what? I'm going to give you a full-body inspection... Hahhh♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Swiftly and dextrously, she runs her dainty fingers along my body. Those feverish eyes are swirling with lust and elation.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 901072,
			say = "Your clothes are in the way... Mine, too, actually! Let me just...♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "With a rough, impatient motion, she starts pulling on my clothes.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_138",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 901072,
			actorName = "{playername}",
			live2d = true,
			say = "Mogador!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "I try to pin her hands down, but she twists her body and evades my grip with no effort.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			side = 2,
			say = "Hahh, ahh... What a serious expression... Are you feeling nervous? Or embarrassed?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_138",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 901072,
			say = "Okay, I'll turn off the lights to help you calm down. Heehee♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			side = 2,
			nameColor = "#A9F548FF",
			live2d = "login",
			withoutActorName = true,
			blackBg = true,
			say = "Right as she said those words, all the lights in the room went out.",
			hideRecordIco = true,
			live2dParams = {
				"touch_drag4",
				1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			nameColor = "#A9F548FF",
			blackBg = true,
			hideRecordIco = true,
			actor = 901072,
			actorName = "{playername}",
			live2d = true,
			say = "......",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			actor = 901072,
			live2d = true,
			dir = 1,
			blackBg = true,
			nameColor = "#A9F548FF",
			say = "Huff... Puff...♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			side = 2,
			nameColor = "#A9F548FF",
			live2d = true,
			withoutActorName = true,
			blackBg = true,
			say = "Her soft body covers me, and her feverish, hot breath tickles my ear.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			actor = 901072,
			live2d = true,
			dir = 1,
			blackBg = true,
			nameColor = "#A9F548FF",
			say = "There we go... There's nothing to be embarrassed or nervous about... Nobody can see us in the darkness...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901072,
			nameColor = "#A9F548FF",
			side = 2,
			live2d = true,
			dir = 1,
			blackBg = true,
			say = "Now let's continue the examination... Hahh♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
