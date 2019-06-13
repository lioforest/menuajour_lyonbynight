class User < ApplicationRecord
  after_create :welcome_send
  after_create :default_data_user, :initialize_name_and_first_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :menus, dependent: :destroy
  has_many :item_types, dependent: :destroy
  has_many :category_types, dependent: :destroy
  has_many :subscriptions, dependent: :destroy



################################################
################## Methods #####################
################################################

#***************** Public *********************#

def create_new_category_type(_name)
  CategoryType.create(name: _name, user: self)
end

def create_new_menu(_name, _title, _subtitle)
  Menu.create(name: _name, title: _title, subtitle: _subtitle, user: self)
end

def category_type_by_id(_category_type_id)
  self.category_types.find(_category_type_id)
end

def category_type_by_menu_category(_menu_category)
  _menu_category.category_type
end

def delete_example_item_types
  self.item_types.where("name LIKE ?", "EXEMPLE : %").destroy_all
end

def has_example_item_types?
  self.item_types.where("name LIKE ?", "EXEMPLE : %").length !=0
end

#***************** Private ********************#

private

#after_create
def welcome_send
  UserMailer.welcome_email(self).deliver_now
end

def initialize_name_and_first_name
  self.last_name = "" if self.last_name.nil?
  self.first_name = "" if self.first_name.nil?
  self.save
end

def default_data_user

  cat_entree = CategoryType.create(name:'Entrée', user: self)
  cat_plat = CategoryType.create(name:'Viande', user: self)
  cat_fromage = CategoryType.create(name:'Fromage', user: self)
  cat_dessert = CategoryType.create(name:'Dessert', user: self)
  cat_boissons = CategoryType.create(name:'Boissons', user: self)

#entrées
cat_entree.create_new_item_type('EXEMPLE : Assiette provençale', "Mesclun d'asperges et tomates confites sauce Parmesan",11.20)
cat_entree.create_new_item_type('EXEMPLE : Gaspacho Andalou',"servi avec sa mousse de chèvre et Chorizo grillé",12.00)
cat_entree.create_new_item_type('EXEMPLE : Tartare de thon','servi avec des pousses de germes et une émulsion citron "combava"',12.50)

#plats
cat_plat.create_new_item_type('EXEMPLE : Steak de thon',"cuisiné en croute de sésame doré à l'huile fumée",22.00)
cat_plat.create_new_item_type('EXEMPLE : T-Bone de veau grillé',"accompagné de jus provençal au parmesan et basilic",23.00)
cat_plat.create_new_item_type('EXEMPLE : Filet de boeuf (Salers ou Aubrac)',"poêlé façon Rossini, tranche de foie gras grillée, jus aux Truffes",26.00)

#fromages
cat_fromage.create_new_item_type('EXEMPLE : Fromage blanc','au coulis de fruits rouges ou crème épaisse',4.00)
cat_fromage.create_new_item_type('EXEMPLE : Demi Saint-Marcellin','Saint-Marcellin affiné "Mère Richard"',5.00)

#desserts
cat_dessert.create_new_item_type('EXEMPLE : Tiramisu','tiramisu au caramel beurre salé et spéculoos',7.00)
cat_dessert.create_new_item_type('EXEMPLE : crème brûlée',"servi avec une mini madeleine au miel d'acacia",6.50)
cat_dessert.create_new_item_type('EXEMPLE : Fondant au chocolat','servi avec un caramel de mangue et une boule de glace à la vanille',6.80)


#boissons
cat_boissons.create_new_item_type('EXEMPLE : Coca-cola',"",2.50)
cat_boissons.create_new_item_type('EXEMPLE : Limonade',"",2.50)
cat_boissons.create_new_item_type('EXEMPLE : Espresso',"",2.00)
cat_boissons.create_new_item_type('EXEMPLE : Grand crème',"",2.50)

menu = self.create_new_menu('Exemple de menu','Menu Carte : 34 €','Entrée + Plat ou Plat + Dessert')

self.category_types.each do |category_type|
  menu.add_category(category_type)
end

menu.categories.each do |category|
  category.category_type.item_types.each do |item_type|
    category.add_item(item_type)
  end
end

end

end
