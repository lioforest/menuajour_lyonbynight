# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#seeding user
User.create(email:'menuajour@yopmail.com', password:'azerty', first_name: 'Anne', last_name: "O'nymous")


MenuCategory.destroy_all
MenuItem.destroy_all
MenuModel.destroy_all
#seeding menu_categories
category = MenuCategory.create(name:'entrée', user_id: User.first.id)
category = MenuCategory.create(name:'plat chaud', user_id: User.first.id)
category = MenuCategory.create(name:'plat froid', user_id: User.first.id)
category = MenuCategory.create(name:'plat du jour', user_id: User.first.id)
category = MenuCategory.create(name:'dessert', user_id: User.first.id)
category = MenuCategory.create(name:'fromage', user_id: User.first.id)
category = MenuCategory.create(name:'boissons', user_id: User.first.id)
category = MenuCategory.create(name:'vin blanc', user_id: User.first.id)
category = MenuCategory.create(name:'vin rouge', user_id: User.first.id)
category = MenuCategory.create(name:'rosé', user_id: User.first.id)
category = MenuCategory.create(name:'bières', user_id: User.first.id)



#seeding menu_items


#entrées
MenuItem.create(name: 'Assiette provençale', description: "Mesclun d'asperges et tomates confites sauce Parmesan", price: 12.00, user_id:User.first.id)
MenuItem.create(name: 'Gaspacho Andalou', description: "servi avec sa mousse de chèvre et Chorizo grillé", price: 12.00, user_id:User.first.id)
MenuItem.create(name: 'Tartare de thon', description: 'servi avec des pousses de germes et une émulsion citron "combava"', price: 12.00, user_id:User.first.id)
MenuItem.create(name: 'Salade de basse cour', description: "Mesclun gourmand aux magrets fumés maison, foie gras de canard et haricots verts", price: 12.00, user_id:User.first.id)

#plats
MenuItem.create(name: 'Steak de thon', description: "cuisiné en croute de sésame doré à l'huile fumée", price: 22.00, user_id:User.first.id)
MenuItem.create(name: 'Pavé de sandre', description: 'roti sur sa peau servi avec une émulsion de vin de Xérès "Tio Pepe"', price: 24.00, user_id:User.first.id)
MenuItem.create(name: 'T-Bone de veau grillé', description: "accompagné de jus provençal au parmesan et basilic", price: 23.00, user_id:User.first.id)
MenuItem.create(name: 'Filet de boeuf (Salers ou Aubrac)', description: "poêlé façon Rossini, tranche de foie gras grillée, jus aux Truffes", price: 26.00, user_id:User.first.id)


#fromages
MenuItem.create(name: 'Fromage blanc', description: 'au coulis de fruits rouges ou crème épaisse', price: 4.00, user_id:User.first.id)
MenuItem.create(name: 'Faisselle de chèvre frais', description: '"Mauvernay à Courzieu" venant du marché de la Croix Rousse', price: 4.00, user_id:User.first.id)
MenuItem.create(name: 'Demi Saint-Marcellin', description: 'Saint-Marcellin affiné "Mère Richard"', price: 5.00, user_id:User.first.id)
MenuItem.create(name: 'Fromage de brebis', description: '', price: 5.00, user_id:User.first.id)

#desserts
MenuItem.create(name: 'Tiramisu', description: 'tiramisu au caramel beurre salé et spéculoos', price: 7.00, user_id:User.first.id)
MenuItem.create(name: 'crème brûlée à la Verveine', description: "servi avec une mini madeleine au miel d'acacia", price: 7.00, user_id:User.first.id)
MenuItem.create(name: 'Mille-feuille pistache', description: 'servi avec un sorbet à la framboise', price: 7.00, user_id:User.first.id)
MenuItem.create(name: 'Fondant au chocolat', description: 'servi avec un caramel de mangue et une boule de glace à la vanille', price: 7.00, user_id:User.first.id)
MenuItem.create(name: 'assortiment gourmand', description: "un café ou un thé accompagné d'une séléction de nos desserts", price: 7.00, user_id:User.first.id)


#boissons
MenuItem.create(name: 'Coca-cola', description: "", price: 2.50, user_id:User.first.id)
MenuItem.create(name: 'Coca Zero', description: "", price: 2.50, user_id:User.first.id)
MenuItem.create(name: 'Jus de Pomme', description: "", price: 2.00, user_id:User.first.id)
MenuItem.create(name: 'Limonade', description: "", price: 2.50, user_id:User.first.id)
MenuItem.create(name: 'Espresso', description: "", price: 1.50, user_id:User.first.id)
MenuItem.create(name: 'Deca', description: "", price: 1.50, user_id:User.first.id)
MenuItem.create(name: 'Grand crème', description: "", price: 3.50, user_id:User.first.id)
MenuItem.create(name: 'Double espresso', description: "", price: 3.00, user_id:User.first.id)
MenuItem.create(name: 'Allongé', description: "", price: 3.00, user_id:User.first.id)
MenuItem.create(name: 'Bière pression', description: "50cl", price: 6.50, user_id:User.first.id)
MenuItem.create(name: 'Bière pression', description: "25cl", price: 3.00, user_id:User.first.id)

#seeding menu_models


MenuModel.create(name:'ETE 18 menu carte', title: 'Menu Carte : 38 €', subtitle:'Entrée + Plat ou Plat + Dessert', user_id:User.first.id)
MenuModel.create(name:'ETE 18 menu du jour', title: 'Menu du jour : 17 €', subtitle:'Entrée du jour + Plat du jour ou Plat du jour + Dessert du jour', user_id:User.first.id)
MenuModel.create(name:'ETE 18 express', title: 'Formule express : 16 €', subtitle:"Plateau de poisson grillé à l'huile d'olive, purée de pommes de terre Maison, méli-mélo de salade et légumes du marché", user_id:User.first.id)
MenuModel.create(name:'PRINTEMPS 2019', title: '', subtitle:'', user_id:User.first.id)
