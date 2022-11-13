::mods_registerMod("off_plus_additional_equipment_patch", 1.0, "OFF+ & Additional Equipment Patch");

::mods_queue("off_plus_additional_equipment_patch", "of_flesh_and_faith_plus, sato_additional_equipment(>=3.2)", function() {
	::mods_hookExactClass("scenarios/world/southern_assassins_scenario", function(sas) {
		local onSpawnAssets = ::mods_getMember(sas, "onSpawnAssets");

		::mods_override(sas, "onSpawnAssets", function() {
			onSpawnAssets();

			local roster = World.getPlayerRoster();
			local bros = roster.getAll();
			local items = bros[1].getItems();
			items.unequip(items.getItemAtSlot(Const.ItemSlot.Body));
			items.equip(new("scripts/items/armor/oriental/reinforced_padded_armor"));
		});
	});
});
