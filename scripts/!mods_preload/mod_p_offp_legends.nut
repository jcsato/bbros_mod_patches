::mods_registerMod("off_plus_legends_patch", 0.4, "OFF+ & Legends Patch");

::mods_queue("off_plus_legends_patch", "of_flesh_and_faith_plus, mod_legends", function() {
	::include("script_hooks/anatomist_vs_oathtaker_event");
	::include("script_hooks/anatomists_experimental_integrity");
	::include("script_hooks/cursed_explorers");
	::include("script_hooks/mutant_wants_hazard_pay_event");
	::include("script_hooks/oathtaker_complains_event");
	::include("script_hooks/oathtaker_vs_cultist_event");
	::include("script_hooks/oathtaker_vs_flagellant_event");
	::include("script_hooks/oathtakers");
	::include("script_hooks/rune_chosen");
	::include("script_hooks/southern_assassins");
	::include("script_hooks/world_map_sprites");
});
