import crafttweaker.item.IIngredient;

val dyes = [
	<ore:dyeWhite>,
	<ore:dyeOrange>,
	<ore:dyeMagenta>,
	<ore:dyeLightBlue>,
	<ore:dyeYellow>,
	<ore:dyeLime>,
	<ore:dyePink>,
	<ore:dyeGray>,
	<ore:dyeLightGrey>,
	<ore:dyeCyan>,
	<ore:dyePurple>,
	<ore:dyeBlue>,
	<ore:dyeBrown>,
	<ore:dyeGreen>,
	<ore:dyeRed>,
	<ore:dyeBlack>,
] as IIngredient[];
val stainedGlass = <minecraft:stained_glass>.definition;

recipes.addShaped(
	"Craft Runes",
	<quark:rune> * 4,
	[
		[<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>],
		[<ore:blockGlassColorless>, <ore:stone>,               <ore:blockGlassColorless>],
		[<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>],
	]
);

for i in 0 to 16 {
	val glass = stainedGlass.makeStack(i);
	recipes.addShaped(
		"Craft " + i + " Runes",
		<quark:rune>.definition.makeStack(i) * 4,
		[
			[glass, glass,       glass],
			[glass, <ore:stone>, glass],
			[glass, glass,       glass],
		]
	);
	recipes.addShapeless(
		"Dye " + i + " Rune",
		<quark:rune>.definition.makeStack(i),
		[<quark:rune:*>, dyes[i]]
	);
	print(i);
}
