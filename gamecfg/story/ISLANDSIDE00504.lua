return {
	id = "ISLANDSIDE00504",
	mode = 10,
	map = {
		{
			100400,
			10010040
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			characterId = 0,
			say = "Homeric, I've got news.",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Commander... Did you find anything?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Yup. I figured out the cause. That metallic rattling you heard probably came from Moo Moo Cow's cowbell.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "What? But... What about the red eyes I saw? Was that the cow as well?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Correct. The cowbell was a bit banged up and hung pretty loose, so that's why it sounded odd.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "As for the red eyes, that was probably just the way the light reflected off of its eyes.",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I suspect the cow was startled by a person suddenly showing up, so it froze in place and stared at you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "So, I worked myself up and got scared over nothing this whole time...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "Well, now that we know what it was, we can get back to our work without fear.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Although... I'm not the only one who heard strange sounds. Amerigo said she heard them, too, and they were different from mine.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "If you can, please go and speak to her. There might be something else going on at the ranch.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "More strange sounds? Alright. I'll ask what that's about.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
