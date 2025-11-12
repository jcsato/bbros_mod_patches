::mods_registerMod("off_plus_additional_equipment_patch", 1.1, "OFF+ & Additional Equipment Patch");

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

	::mods_hookExactClass("events/offplus_oathtakers_events/special/oathtaker_brings_oaths_event", function(oboe) {
		local scaleBroForOaths = ::mods_getMember(oboe, "scaleBroForOaths");

		::mods_override(oboe, "scaleBroForOaths", function(dude) {
			scaleBroForOaths(dude);

			local items = dude.getItems();

			// Loaded after OFF+ so the helper will be accessible
			local oathsUnlocked = ::OFFP.Helpers.getNumOathsUnlocked();

			// Re-scale to account for Decorated Great Helm
			switch (oathsUnlocked) {
				case 1:
					if (items.getItemAtSlot(Const.ItemSlot.Head).getID() == "armor.head.decorated_great_helm") {
						items.unequip(items.getItemAtSlot(Const.ItemSlot.Head));

						local helmets = ["scripts/items/helmets/heavy_mail_coif", "scripts/items/helmets/adorned_closed_flat_top_with_mail"];
						items.equip(new(helmets[Math.rand(0, 1)]));
					}
					break;
				case 2:
					if (items.getItemAtSlot(Const.ItemSlot.Head).getID() == "armor.head.decorated_great_helm") {
						items.unequip(items.getItemAtSlot(Const.ItemSlot.Head));

						local helmets = ["scripts/items/helmets/heavy_mail_coif", "scripts/items/helmets/adorned_closed_flat_top_with_mail"];
						items.equip(new(helmets[Math.rand(0, 1)]));
					}
					break;
				case 3:
					if (items.getItemAtSlot(Const.ItemSlot.Head).getID() != "armor.head.decorated_great_helm" && Math.rand(0, 2) == 0) {
						items.unequip(items.getItemAtSlot(Const.ItemSlot.Head));
						items.equip(new("scripts/items/helmets/decorated_great_helm"));
					}
					break;
				case 4:
					if (Math.rand(0, 1) == 0) {
						items.unequip(items.getItemAtSlot(Const.ItemSlot.Head));
						items.equip(new("scripts/items/helmets/decorated_great_helm"));
					}
					break;
			}
		});
	});
});
