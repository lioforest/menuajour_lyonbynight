# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#seeding user
u = User.where(email:'menuajour@yopmail.com')[0]
if u.nil?
  u = User.create(email:'menuajour@yopmail.com', password:'azerty', first_name: 'Anne', last_name: "O'nymous")
end

CategoryType.destroy_all
ItemType.destroy_all
Menu.destroy_all
MenuCategory.destroy_all

#####################################################################
##############   seeding category_types   ###########################
#####################################################################

cat_entree = CategoryType.create(name:'entrée', user: u)
cat_plat_chaud = CategoryType.create(name:'plat chaud', user: u)
cat_plat_froid = CategoryType.create(name:'plat froid', user: u)
cat_plat_du_jour = CategoryType.create(name:'plat du jour', user: u)
cat_dessert = CategoryType.create(name:'dessert', user: u)
cat_fromage = CategoryType.create(name:'fromage', user: u)
cat_boissons = CategoryType.create(name:'boissons', user: u)
cat_vin_blanc = CategoryType.create(name:'vin blanc', user: u)
cat_vin_rouge = CategoryType.create(name:'vin rouge', user: u)
cat_rose = CategoryType.create(name:'rosé', user: u)
cat_bieres = CategoryType.create(name:'bières', user: u)


#####################################################################
##############     seeding item_types     ###########################
#####################################################################

#entrées
itentre1 = ItemType.create(name: 'Assiette provençale', description: "Mesclun d'asperges et tomates confites sauce Parmesan", price: 12.00, user: u)
itentre1.category_types.append(cat_entree)
itentre2 = ItemType.create(name: 'Gaspacho Andalou', description: "servi avec sa mousse de chèvre et Chorizo grillé", price: 12.00, user: u)
itentre2.category_types.append(cat_entree)
itentre3 = ItemType.create(name: 'Tartare de thon', description: 'servi avec des pousses de germes et une émulsion citron "combava"', price: 12.00, user: u)
itentre3.category_types.append(cat_entree)
itentre4 = ItemType.create(name: 'Salade de basse cour', description: "Mesclun gourmand aux magrets fumés maison, foie gras de canard et haricots verts", price: 12.00, user: u)
itentre4.category_types.append(cat_entree)

#plats
itplatc1 = ItemType.create(name: 'Steak de thon', description: "cuisiné en croute de sésame doré à l'huile fumée", price: 22.00, user: u)
itplatc1.category_types.append(cat_plat_chaud)
itplatc2 = ItemType.create(name: 'Pavé de sandre', description: 'roti sur sa peau servi avec une émulsion de vin de Xérès "Tio Pepe"', price: 24.00, user: u)
itplatc2.category_types.append(cat_plat_chaud)
itplatc3 = ItemType.create(name: 'T-Bone de veau grillé', description: "accompagné de jus provençal au parmesan et basilic", price: 23.00, user: u)
itplatc3.category_types.append(cat_plat_chaud)
itplatj1 = ItemType.create(name: 'Filet de boeuf (Salers ou Aubrac)', description: "poêlé façon Rossini, tranche de foie gras grillée, jus aux Truffes", price: 26.00, user: u)
itplatj1.category_types.append(cat_plat_chaud)


#fromages
itfromag1 = ItemType.create(name: 'Fromage blanc', description: 'au coulis de fruits rouges ou crème épaisse', price: 4.00, user: u)
itfromag1.category_types.append(cat_fromage)
itfromag2 = ItemType.create(name: 'Faisselle de chèvre frais', description: '"Mauvernay à Courzieu" venant du marché de la Croix Rousse', price: 4.00, user: u)
itfromag2.category_types.append(cat_fromage)
itfromag3 = ItemType.create(name: 'Demi Saint-Marcellin', description: 'Saint-Marcellin affiné "Mère Richard"', price: 5.00, user: u)
itfromag3.category_types.append(cat_fromage)
itfromag4 = ItemType.create(name: 'Fromage de brebis', description: '', price: 5.00, user: u)
itfromag4.category_types.append(cat_fromage)

#desserts
itdessert1 = ItemType.create(name: 'Tiramisu', description: 'tiramisu au caramel beurre salé et spéculoos', price: 7.00, user: u)
itdessert1.category_types.append(cat_dessert)
itdessert2 = ItemType.create(name: 'crème brûlée à la Verveine', description: "servi avec une mini madeleine au miel d'acacia", price: 7.00, user: u)
itdessert2.category_types.append(cat_dessert)
itdessert3 = ItemType.create(name: 'Mille-feuille pistache', description: 'servi avec un sorbet à la framboise', price: 7.00, user: u)
itdessert3.category_types.append(cat_dessert)
itdessert4 = ItemType.create(name: 'Fondant au chocolat', description: 'servi avec un caramel de mangue et une boule de glace à la vanille', price: 7.00, user: u)
itdessert4.category_types.append(cat_dessert)
itdessert5 = ItemType.create(name: 'assortiment gourmand', description: "un café ou un thé accompagné d'une séléction de nos desserts", price: 7.00, user: u)
itdessert5.category_types.append(cat_dessert)


#boissons
it = ItemType.create(name: 'Coca-cola', description: "", price: 2.50, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Coca Zero', description: "", price: 2.50, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Jus de Pomme', description: "", price: 2.00, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Limonade', description: "", price: 2.50, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Espresso', description: "", price: 1.50, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Deca', description: "", price: 1.50, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Grand crème', description: "", price: 3.50, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Double espresso', description: "", price: 3.00, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Allongé', description: "", price: 3.00, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Bière pression', description: "50cl", price: 6.50, user: u)
it.category_types.append(cat_boissons)
it = ItemType.create(name: 'Bière pression', description: "25cl", price: 3.00, user: u)
it.category_types.append(cat_boissons)


#####################################################################
###################     seeding menus     ###########################
#####################################################################



M1 = Menu.create(name:'ETE 18 menu carte', title: 'Menu Carte : 38 €', subtitle:'Entrée + Plat ou Plat + Dessert', user: u)
M2 = Menu.create(name:'ETE 18 menu du jour', title: 'Menu du jour : 17 €', subtitle:'Entrée du jour + Plat du jour ou Plat du jour + Dessert du jour', user: u)
M3 = Menu.create(name:'ETE 18 express', title: 'Formule express : 16 €', subtitle:"Plateau de poisson grillé à l'huile d'olive, purée de pommes de terre Maison, méli-mélo de salade et légumes du marché", user: u)
M4 = Menu.create(name:'PRINTEMPS 2019', title: '', subtitle:'', user: u)

	M1.add_category(cat_entree)
		M1.categories[0].add_item(itentre1)
		M1.categories[0].add_item(itentre2)
		M1.categories[0].add_item(itentre3)
		M1.categories[0].add_item(itentre4)
	M1.add_category(cat_plat_chaud)
		M1.categories[1].add_item(itplatc1)
		M1.categories[1].add_item(itplatc2)
		M1.categories[1].add_item(itplatc3)
	M1.add_category(cat_plat_du_jour)
		M1.categories[2].add_item(itplatj1)
	M1.add_category(cat_fromage)
		M1.categories[3].add_item(itfromag1)
		M1.categories[3].add_item(itfromag2)
		M1.categories[3].add_item(itfromag3)
		M1.categories[3].add_item(itfromag4)
	M1.add_category(cat_dessert)
		M1.categories[4].add_item(itdessert1)
		M1.categories[4].add_item(itdessert2)
		M1.categories[4].add_item(itdessert3)
		M1.categories[4].add_item(itdessert4)
	s



