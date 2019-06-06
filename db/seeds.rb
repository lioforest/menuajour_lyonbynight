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
it = ItemType.create(name: 'Assiette provençale', description: "Mesclun d'asperges et tomates confites sauce Parmesan", price: 12.00, user: u)
it.category_types.append(cat_entree)
it = ItemType.create(name: 'Gaspacho Andalou', description: "servi avec sa mousse de chèvre et Chorizo grillé", price: 12.00, user: u)
it.category_types.append(cat_entree)
it = ItemType.create(name: 'Tartare de thon', description: 'servi avec des pousses de germes et une émulsion citron "combava"', price: 12.00, user: u)
it.category_types.append(cat_entree)
it = ItemType.create(name: 'Salade de basse cour', description: "Mesclun gourmand aux magrets fumés maison, foie gras de canard et haricots verts", price: 12.00, user: u)
it.category_types.append(cat_entree)

#plats
it = ItemType.create(name: 'Steak de thon', description: "cuisiné en croute de sésame doré à l'huile fumée", price: 22.00, user: u)
it.category_types.append(cat_plat_chaud)
it = ItemType.create(name: 'Pavé de sandre', description: 'roti sur sa peau servi avec une émulsion de vin de Xérès "Tio Pepe"', price: 24.00, user: u)
it.category_types.append(cat_plat_chaud)
it = ItemType.create(name: 'T-Bone de veau grillé', description: "accompagné de jus provençal au parmesan et basilic", price: 23.00, user: u)
it.category_types.append(cat_plat_chaud)
it = ItemType.create(name: 'Filet de boeuf (Salers ou Aubrac)', description: "poêlé façon Rossini, tranche de foie gras grillée, jus aux Truffes", price: 26.00, user: u)
it.category_types.append(cat_plat_chaud)


#fromages
it = ItemType.create(name: 'Fromage blanc', description: 'au coulis de fruits rouges ou crème épaisse', price: 4.00, user: u)
it.category_types.append(cat_fromage)
it = ItemType.create(name: 'Faisselle de chèvre frais', description: '"Mauvernay à Courzieu" venant du marché de la Croix Rousse', price: 4.00, user: u)
it.category_types.append(cat_fromage)
it = ItemType.create(name: 'Demi Saint-Marcellin', description: 'Saint-Marcellin affiné "Mère Richard"', price: 5.00, user: u)
it.category_types.append(cat_fromage)
it = ItemType.create(name: 'Fromage de brebis', description: '', price: 5.00, user: u)
it.category_types.append(cat_fromage)

#desserts
it = ItemType.create(name: 'Tiramisu', description: 'tiramisu au caramel beurre salé et spéculoos', price: 7.00, user: u)
it.category_types.append(cat_dessert)
it = ItemType.create(name: 'crème brûlée à la Verveine', description: "servi avec une mini madeleine au miel d'acacia", price: 7.00, user: u)
it.category_types.append(cat_dessert)
it = ItemType.create(name: 'Mille-feuille pistache', description: 'servi avec un sorbet à la framboise', price: 7.00, user: u)
it.category_types.append(cat_dessert)
it = ItemType.create(name: 'Fondant au chocolat', description: 'servi avec un caramel de mangue et une boule de glace à la vanille', price: 7.00, user: u)
it.category_types.append(cat_dessert)
it = ItemType.create(name: 'assortiment gourmand', description: "un café ou un thé accompagné d'une séléction de nos desserts", price: 7.00, user: u)
it.category_types.append(cat_dessert)


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



Menu.create(name:'ETE 18 menu carte', title: 'Menu Carte : 38 €', subtitle:'Entrée + Plat ou Plat + Dessert', user: u)
Menu.create(name:'ETE 18 menu du jour', title: 'Menu du jour : 17 €', subtitle:'Entrée du jour + Plat du jour ou Plat du jour + Dessert du jour', user: u)
Menu.create(name:'ETE 18 express', title: 'Formule express : 16 €', subtitle:"Plateau de poisson grillé à l'huile d'olive, purée de pommes de terre Maison, méli-mélo de salade et légumes du marché", user: u)
Menu.create(name:'PRINTEMPS 2019', title: '', subtitle:'', user: u)
