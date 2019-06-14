require 'rails_helper'

  config.include Rails.application.routes.url_helpers

RSpec.describe MenuCategory, type: :model do

  before(:each) do 
     @url  = root_path

      @user = User.create(email:'anneonymous@yopmail.com', password:'azerty', first_name: 'Anne', last_name: "Onymous")
      @menu = Menu.create(name:'ETE 18 menu carte', title: 'Menu Carte : 38 €', subtitle:'Entrée + Plat ou Plat + Dessert', user: @user)
      @cat_entree = CategoryType.create(name:'entrée', user: @user)
      @menu_categ = MenuCategory.create(menu: @menu, category_type: @cat_entree, order: 0)

  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@menu_categ).to be_a(MenuCategory)
      expect(@menu_categ).to be_valid
    end

    describe "#menu" do
      it "should not be valid without menu id" do
        bad_menu_category = MenuCategory.create(category_type: @cat_entree, order: 0)
        expect(bad_menu_category).not_to be_valid
        expect(bad_menu_category.errors.include?(:menu)).to eq(true)
      end
    end

    describe "#category_type" do
      it "should not be valid without category_type" do
        bad_menu_category =  MenuCategory.create(menu: @menu, order: 0)
        expect(bad_menu_category).not_to be_valid
        expect(bad_menu_category.errors.include?(:category_type)).to eq(true)
      end
    end


  end

  context "associations" do


  end



  context "public instance methods" do

  end

end