// Wheat
/obj/item/seeds/wheat
	name = "pack of wheat seeds"
	desc = "These may, or may not, grow into wheat."
	icon_state = "seed-wheat"
	species = "wheat"
	plantname = "Wheat Stalks"
	product = /obj/item/reagent_containers/food/snacks/grown/wheat
	production = 1
	yield = 4
	potency = 15
	icon_dead = "wheat-dead"
	mutatelist = list(/obj/item/seeds/wheat/oat, /obj/item/seeds/wheat/meat)
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.04)

/obj/item/reagent_containers/food/snacks/grown/wheat
	seed = /obj/item/seeds/wheat
	name = "wheat"
	desc = "Sigh... wheat... a-grain?"
	gender = PLURAL
	icon_state = "wheat"
	filling_color = "#F0E68C"
	bitesize_mod = 2
	foodtype = GRAIN
	grind_results = list(/datum/reagent/consumable/flour = 0)
	tastes = list("wheat" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/beer

/obj/item/seeds/wheat/ashen
	name = "ashen hair seeds"
	desc = "Brought over by the western ash tribe, these seeds grow into ashen hair."
	icon_state = "seed-ashhair"
	species = "ashhair"
	plantname = "Ashen Hair"
	product = /obj/item/reagent_containers/food/snacks/grown/wheat/ashen
	production = 1
	yield = 4
	potency = 15
	icon_dead = "ashhair-dead"
	mutatelist = list()
	genes = list(/datum/plant_gene/trait/plant_type/fungal_metabolism)
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.04)

/obj/item/reagent_containers/food/snacks/grown/wheat/ashen
	seed = /obj/item/seeds/wheat/ashen
	name = "ashen hair"
	desc = "A westerners' delicacy."
	gender = PLURAL
	icon_state = "ashhair"
	filling_color = "#4f4f4f"
	bitesize_mod = 2
	foodtype = VEGETABLES
	grind_results = list(/datum/reagent/consumable/flour = 0)
	tastes = list("ash" = 3, "plant" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/beer
	

// Oat
/obj/item/seeds/wheat/oat
	name = "pack of oat seeds"
	desc = "Oat's just a matter of time..."
	icon_state = "seed-oat"
	species = "oat"
	plantname = "Oat Stalks"
	rarity = 10 //Not really new, just better
	product = /obj/item/reagent_containers/food/snacks/grown/oat
	mutatelist = list()

/obj/item/reagent_containers/food/snacks/grown/oat
	seed = /obj/item/seeds/wheat/oat
	name = "oat"
	desc = "Eat oats, do squats."
	gender = PLURAL
	icon_state = "oat"
	filling_color = "#556B2F"
	bitesize_mod = 2
	foodtype = GRAIN
	grind_results = list(/datum/reagent/consumable/flour = 0.5) //So when it grinds it has 50% more flour
	tastes = list("oat" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/ale

// Rice
/obj/item/seeds/wheat/rice
	name = "pack of rice seeds"
	desc = "Rice, rice, baby!"
	icon_state = "seed-rice"
	species = "rice"
	plantname = "Rice Stalks"
	product = /obj/item/reagent_containers/food/snacks/grown/rice
	mutatelist = list()
	growthstages = 3

/obj/item/reagent_containers/food/snacks/grown/rice
	seed = /obj/item/seeds/wheat/rice
	name = "rice"
	desc = "Rice to meet you."
	gender = PLURAL
	icon_state = "rice"
	filling_color = "#FAFAD2"
	bitesize_mod = 2
	foodtype = GRAIN
	grind_results = list(/datum/reagent/consumable/rice = 0)
	tastes = list("rice" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/sake

//Meatwheat - grows into synthetic meat
/obj/item/seeds/wheat/meat
	name = "pack of meatwheat seeds"
	desc = "If you ever wanted to drive a vegetarian to insanity, here's how."
	icon_state = "seed-meatwheat"
	species = "meatwheat"
	plantname = "Meatwheat"
	product = /obj/item/reagent_containers/food/snacks/grown/meatwheat
	rarity = 40
	mutatelist = list()

/obj/item/reagent_containers/food/snacks/grown/meatwheat
	name = "meatwheat"
	desc = "Some blood-drenched wheat stalks. You can crush them into what passes for meat if you squint hard enough."
	icon_state = "meatwheat"
	gender = PLURAL
	filling_color = rgb(150, 0, 0)
	bitesize_mod = 2
	seed = /obj/item/seeds/wheat/meat
	foodtype = MEAT | GRAIN
	grind_results = list(/datum/reagent/consumable/flour = 0, /datum/reagent/blood = 0)
	tastes = list("meatwheat" = 1)
	can_distill = FALSE

/obj/item/reagent_containers/food/snacks/grown/meatwheat/attack_self(mob/living/user)
	user.visible_message("<span class='notice'>[user] crushes [src] into meat.</span>", "<span class='notice'>You crush [src] into something that resembles meat.</span>")
	playsound(user, 'sound/effects/blobattack.ogg', 50, 1)
	var/obj/item/reagent_containers/food/snacks/meat/slab/meatwheat/M = new
	qdel(src)
	user.put_in_hands(M)
	return 1
