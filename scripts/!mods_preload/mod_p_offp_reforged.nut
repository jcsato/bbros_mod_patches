::mods_registerMod("off_plus_reforged_patch", 1.1, "OFF+ & Reforged Patch");

::mods_queue("off_plus_reforged_patch", "of_flesh_and_faith_plus, mod_reforged, mod_dynamic_perks", function() {
	// Sometimes bros added in events who've had their equipment altered after setStartValuesEx is called
	//  won't have a weapon perk tree for their equipped weapon, which is a feature of Reforged.
	local ensureWeaponGroupForEquipment = function(dude) {
		local items = dude.getItems();
		local applicablePerkGroups = ::Reforged.getWeaponPerkGroups(items.getItemAtSlot(Const.ItemSlot.Mainhand));
		local hasApplicablePerkGroup = false;

		foreach (group in applicablePerkGroups) {
			if (dude.getPerkTree().hasPerkGroup(group))
				hasApplicablePerkGroup = true;
		}

		if (!hasApplicablePerkGroup) {
			local existingWeaponGroups = [];
			local category = ::DynamicPerks.PerkGroupCategories.findById("pgc.rf_weapon");
			foreach (groupID in category.getGroups())
			{
				if (dude.getPerkTree().hasPerkGroup(groupID))
					existingWeaponGroups.push(groupID);
			}

			dude.getPerkTree().removePerkGroup(existingWeaponGroups[Math.rand(0, existingWeaponGroups.len() - 1)]);
			dude.getPerkTree().addPerkGroup(applicablePerkGroups[Math.rand(0, applicablePerkGroups.len() - 1)]);
		}
	}

	::mods_hookNewObject("retinue/followers/drill_sergeant_follower", function(dsf) {
		local isVisible = dsf.isVisible;

		// Force DS visibility to true
		// Reforged removes the permanent injury requirement so he should no longer be disabled for Rune Chosen
		dsf.isVisible = function() {
			if (World.Assets.getOrigin().getID() == "scenario.runeknights")
				return true;
			else
				return isVisible();
		};
	});

	// Reforged relies on a perk tier, rather than player.m.PerkPointsSpent, to determine rows of perks unlocked
	::mods_hookExactClass("scenarios/world/southern_assassins_scenario", function(sas) {
		local addPoisonSpeciality = ::mods_getMember(sas, "addPoisonSpeciality");
		local addCombatSpeciality = ::mods_getMember(sas, "addCombatSpeciality");
		local addPhilosophy = ::mods_getMember(sas, "addPhilosophy");

		::mods_override(sas, "addPoisonSpeciality", function(_bro) {
			addPoisonSpeciality(_bro);
			_bro.setPerkTier(_bro.getPerkTier() + 1);
		});

		::mods_override(sas, "addCombatSpeciality", function(_bro) {
			addCombatSpeciality(_bro);
			_bro.setPerkTier(_bro.getPerkTier() + 1);
		});

		::mods_override(sas, "addPhilosophy", function(_bro) {
			addPhilosophy(_bro);
			_bro.setPerkTier(_bro.getPerkTier() + 1);
		});
	});

	::mods_hookNewObject("events/offplus_oathtakers_events/special/oathtaker_brings_oaths_event", function(oboe) {
		local scaleBroForOaths = oboe.scaleBroForOaths;
		oboe.scaleBroForOaths = function(dude) {
			scaleBroForOaths(dude);
			ensureWeaponGroupForEquipment(dude);
		}
	});

	::mods_hookNewObject("events/offplus_runeknights_events/events/death_knight_confrontation_event", function(dkce) {
		foreach(screen in dkce.m.Screens) {
			if (screen.ID == "A") {
				local start = screen.start;
				screen.start = function(_event) {
					start(_event);
					ensureWeaponGroupForEquipment(_event.m.Dude);
				};
			}
		}
	});

	local promisedPotentialPerk = ::Const.Perks.LookupMap["perk.rf_promised_potential"];
	if ("verifyPrerequisites" in promisedPotentialPerk) {
		local verifyPrerequisites = promisedPotentialPerk.verifyPrerequisites;

		promisedPotentialPerk.verifyPrerequisites = function(_player, _tooltip) {
			if (_player.getPerkPointsSpent() == 1 && ("State" in World) && World.State != null && World.Assets.getOrigin() != null && World.Assets.getOrigin().getID() == "scenario.southern_assassins")
				return true;

			return verifyPrerequisites(_player, _tooltip);
		}
	}

	local discoveredTalentPerk = ::Const.Perks.LookupMap["perk.rf_discovered_talent"];
	if ("verifyPrerequisites" in discoveredTalentPerk) {
		local verifyPrerequisites = discoveredTalentPerk.verifyPrerequisites;

		discoveredTalentPerk.verifyPrerequisites = function(_player, _tooltip) {
			if (_player.getPerkPointsSpent() == 1 && ("State" in World) && World.State != null && World.Assets.getOrigin() != null && World.Assets.getOrigin().getID() == "scenario.southern_assassins")
				return true;

			return verifyPrerequisites(_player, _tooltip);
		}
	}
});
