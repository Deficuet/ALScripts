return {
	id = "ISLANDSIDE01001",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			animation = "doubt",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "The harbor's entrance is blocked up with freighters wanting to dock... I've got to guide them along!",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "So many orders... but that's a good thing! I'll work overtime to get them done!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Okay, I'll do a review after I've sorted through the requests...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Need to get bigger and faster! Need to set new performance records!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "(Look at her go. So motivated. She must really like her job.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "(She carries out all those tasks around the harbor, big and small.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "(Still, you can't do brain-intensive labor like this forever, or it'll wear you out.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "(I wish I could do something to make her job less tiring, but what?)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "(Hmm. I'll ask Olympic if she has any advice.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
