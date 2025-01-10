# Battle Brothers Mod Patches

Various patches to mods for the game Battle Brothers ([Steam](https://store.steampowered.com/app/365360/Battle_Brothers/), [GOG](https://www.gog.com/game/battle_brothers), [Developer Site](http://battlebrothersgame.com/buy-battle-brothers/)).

## Table of contents

-   [Patches](#patches)
-   [Requirements](#requirements)
-   [Installation](#installation)
-   [Uninstallation](#uninstallation)
-   [Acknowledgements](#acknowledgements)

## Patches

These patches aim to make certain mods compatible or more smoothly integrated.

### **[Of Flesh and Faith+](https://github.com/jcsato/of_flesh_and_faith_plus) & [Legends](https://github.com/Battle-Brothers-Legends/Legends-public)**

Updates the new content in OFF+ to be compatible with Legends.

### **[Of Flesh and Faith+](https://github.com/jcsato/of_flesh_and_faith_plus) & [Reforged](https://github.com/Battle-Modders/mod-reforged)**

Fixes some minor incompatibilities between OFF+ and Reforged:
- The Drill Sergeant is no longer hidden when playing as the Rune Chosen, as Reforged changes how retinue unlocks work
- Bros added by some of the more important events in OFF+ are now guaranteed to spawn with weapon perk trees applicable to their mainhand weapon, as normal recruits are.
- The special perks added in the Southern Assassins origin will properly unlock the next row of perks as in vanilla.

### **[Of Flesh and Faith+](https://github.com/jcsato/of_flesh_and_faith_plus) & [Additional Equipment](https://github.com/jcsato/sato_additional_equipment_mod)**

Makes one of the starting Assassins in the OFF+ Assassin origin start with the Reinforced Padded Armor from Additional Equipment.

### **[Expanded Markets](https://github.com/jcsato/sato_expanded_markets_mod) & [Additional Equipment](https://github.com/jcsato/sato_additional_equipment_mod)**

Adds Masked Nomad Light Helmets from Additional Equipment to the list of Nomad gear that can show up in marketplaces with Expanded Markets.

## Requirements

1) [Modding Script Hooks](https://www.nexusmods.com/battlebrothers/mods/42) (v20 or later)
2) The relevant mods being patched

## Installation

1) Download the mod from the [releases page](https://github.com/jcsato/bbros_mod_patches/releases/latest)
2) Without extracting, put the relevant `<patch_name>_*.zip` file in your game's data directory
    1) For Steam installations, this is typically: `C:\Program Files (x86)\Steam\steamapps\common\Battle Brothers\data`
    2) For GOG installations, this is typically: `C:\Program Files (x86)\GOG Galaxy\Games\Battle Brothers\data`

## Uninstallation

1) Remove the `<patch_name>_*.zip` file from your game's data directory

## Acknowledgements
- Big thanks to the Legends team, especially Luft, Breaky, and Chopeks, for their help in getting the Legends patch off the ground.
