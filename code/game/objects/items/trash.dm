//Added by Jack Rost
/obj/item/trash
	icon = 'icons/obj/janitor.dmi'
	desc = "This is rubbish."
	w_class = 1.0

	raisins
		//name = "4no raisins"
		name = "pasas 4no"
		icon_state= "4no_raisins"
	candy
		//name = "candy"
		name = "caramelo"
		icon_state= "candy"
	cheesie
		//name = "cheesie honkers"
		name = "cheesie honkers"
		icon_state = "cheesie_honkers"
	chips
		//name = "chips"
		name = "patatas fritas"
		icon_state = "chips"
	popcorn
		//name = "popcorn"
		name = "palomitas"
		icon_state = "popcorn"
	sosjerky
		//name = "\improper Scaredy's Private Reserve Beef Jerky"
		name = "\improper Scaredy's Private Reserve Beef Jerky"
		icon_state = "sosjerky"
	syndi_cakes
		//name = "syndi-cakes"
		name = "syndi-cakes"
		icon_state = "syndi_cakes"
	waffles
		//name = "waffles"
		name = "gofres"
		icon_state = "waffles"
	plate
		//name = "plate"
		name = "plato"
		icon_state = "plate"
	snack_bowl
		//name = "snack bowl"
		name = "snacks"
		icon_state	= "snack_bowl"
	pistachios
		//name = "pistachios pack"
		name = "pistachos"
		icon_state = "pistachios_pack"
	semki
		//name = "semki pack"
		name = "semillas de girasol"
		icon_state = "semki_pack"
	tray
		//name = "tray"
		name = "tray"
		icon_state = "tray"
	candle
		//name = "candle"
		name = "vela"
		icon = 'icons/obj/candle.dmi'
		icon_state = "candle4"

/obj/item/trash/attack(mob/M, mob/living/user)
	return