::mods_registerMod("off_plus_equipment_variants_patch", 1.0, "OFF+ & Equipment Variants Patch");

::mods_queue("off_plus_equipment_variants_patch", "of_flesh_and_faith_plus, sato_equipment_variants(>=1.5)", function() {
	::mods_hookExactClass("scenarios/world/oathtakers_scenario", function(os) {
		local onSpawnAssets = ::mods_getMember(os, "onSpawnAssets");

		::mods_override(os, "onSpawnAssets", function() {
			onSpawnAssets();

			local roster = World.getPlayerRoster();
			local bros = roster.getAll();
			local items = bros[0].getItems();
			local helmet = items.getItemAtSlot(Const.ItemSlot.Head);

			// Old Oathtaker always starts with the Heavy Mail Coif and Adorned Mail Hauberk
			// Adorned Mail Hauberk has no color variants, so set the coif to White-Blue
			helmet.setVariant(237);

			items = bros[1].getItems();
			helmet = items.getItemAtSlot(Const.ItemSlot.Head);
			local armor = items.getItemAtSlot(Const.ItemSlot.Body);

			switch(helmet.getVariant()) {
				case 319:
					// Red-Blue
					armor.setVariant(226);
					break;
				case 238:
					// Turquoise-Gold
					armor.setVariant(108);
					break;
				case 320:
					// White-Blue
					armor.setVariant(227);
					break;
			}
		});
	});
});
