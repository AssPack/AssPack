import mods.forestry.ThermionicFabricator;

function glassNBT(i as int) as crafttweaker.item.IItemStack {
	return <extratrees:drink>.withTag({glassware: i as short});
}

for i in 0 to 15 {
	val ni = (i + 1) % 15;

	print(glassNBT(i).displayName);
	ThermionicFabricator.removeCast(glassNBT(i));

	recipes.addShapeless("" + i + " to " + ni, glassNBT(ni), [glassNBT(i)], null);
}
val wax = <forestry:beeswax> as crafttweaker.item.IIngredient;
ThermionicFabricator.addCast(
	glassNBT(0) * 8,
	[
		[wax, wax,  wax],
		[wax, null, wax],
		[wax, wax,  wax]
	],
	<liquid:glass> * 1000
);
