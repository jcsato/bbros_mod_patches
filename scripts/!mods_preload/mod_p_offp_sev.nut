::mods_registerMod("off_plus_equipment_variants_patch", 1.1, "OFF+ & Equipment Variants Patch");

// Don't require, but load after, the Additional Equipment patch if it's present as it also hooks scaleBroForOaths
::mods_queue("off_plus_equipment_variants_patch", "of_flesh_and_faith_plus, sato_equipment_variants(>=1.6), >off_plus_additional_equipment_patch", function() {
	::mods_hookExactClass("scenarios/world/oathtakers_scenario", function(os) {
		local onSpawnAssets = ::mods_getMember(os, "onSpawnAssets");

		::mods_override(os, "onSpawnAssets", function() {
			onSpawnAssets();

			local roster = World.getPlayerRoster();
			local bros = roster.getAll();
			local items = bros[0].getItems();

			local colorScheme = ::SatoEquipment.Helpers.Oathtakers.getColorSchemeFromArmor(items);
			::SatoEquipment.Helpers.Oathtakers.setEquipmentColorScheme(items, colorScheme);

			items = bros[1].getItems();

			colorScheme = ::SatoEquipment.Helpers.Oathtakers.getColorSchemeFromArmor(items);
			::SatoEquipment.Helpers.Oathtakers.setEquipmentColorScheme(items, colorScheme);
		});
	});

	::mods_hookExactClass("events/offplus_oathtakers_events/special/oathtaker_brings_oaths_event", function(oboe) {
		local scaleBroForOaths = ::mods_getMember(oboe, "scaleBroForOaths");

		::mods_override(oboe, "scaleBroForOaths", function(dude) {
			scaleBroForOaths(dude);

			local items = dude.getItems();
			local colorScheme = ::SatoEquipment.Helpers.Oathtakers.getColorSchemeFromArmor(items);
			::SatoEquipment.Helpers.Oathtakers.setEquipmentColorScheme(items, colorScheme);
		});
	});
});
