::mods_registerMod("expanded_markets_additional_equipment_patch", 1.0, "Expanded Markets & Additional Equipment Patch");

::mods_queue("expanded_markets_additional_equipment_patch", "sato_expanded_markets(>=1.2), sato_additional_equipment(>=3.2)", function() {
	::SEM_SOUTHERN_ARMOR.extend([
		"helmets/oriental/masked_nomad_light_helmet",
		"helmets/oriental/masked_nomad_light_helmet"
	])
});
