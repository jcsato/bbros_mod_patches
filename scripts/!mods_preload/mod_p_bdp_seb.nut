::mods_registerMod("bd_plus_enemy_balance_patch", 1.0, "BD+ & Enemy Balance Patch");

::mods_queue("bd_plus_enemy_balance_patch", "blazing_deserts_plus, sato_enemy_balance(>=1.0)", function() {
	::BDP.Arena.EntityTypes.Indebted.Strength = 12;				// Default 10
	::BDP.Arena.EntityTypes.NorthernIndebted.Strength = 12;		// Default 10
});
