require 'rails_helper'

  config.include Rails.application.routes.url_helpers

RSpec.describe Menu, type: :model do

  before(:each) do 
      @url  = root_path

      @user = User.create(email:'anneonymous@yopmail.com', password:'azerty', first_name: 'Anne', last_name: "Onymous")

      @menu = Menu.create(name:'ETE 18 menu carte', title: 'Menu Carte : 38 €', subtitle:'Entrée + Plat ou Plat + Dessert', user: @user)

  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@menu).to be_a(Menu)
      expect(@menu).to be_valid
    end

    describe "#name" do
      it "should not be valid without name" do
        bad_menu = Menu.create(title: 'Menu Carte : 38 €', subtitle:'Entrée + Plat ou Plat + Dessert', user: @user)
        expect(bad_menu).not_to be_valid
        expect(bad_menu.errors.include?(:name)).to eq(true)
      end
    end

    describe "#user" do
      it "should not be valid without user" do
        bad_menu = Menu.create(name:'ETE 18 menu carte', title: 'Menu Carte : 38 €', subtitle:'Entrée + Plat ou Plat + Dessert')
        expect(bad_menu).not_to be_valid
        expect(bad_menu.errors.include?(:user)).to eq(true)
      end
    end

    describe "#menuunique" do
      it "should not be valid if the name is not unique for the same user" do
      bad_menu_0 = Menu.create(name:'ETE 18 menu carte', title: 'Menu Carte : 38 €', subtitle:'Entrée + Plat ou Plat + Dessert', user: @user)
      bad_menu = Menu.create(name:'ETE 18 menu carte', title: 'Menu Carte : 38 €', subtitle:'Entrée + Plat ou Plat + Dessert', user: @user)
        expect(bad_menu).not_to be_valid
        expect(bad_menu.errors.include?(:name)).to eq(true)
      end
    end


    describe "#title" do
      it "should be valid without title" do
        good_menu = Menu.create(name:'ETE 18 menu carte2', subtitle:'Entrée + Plat ou Plat + Dessert', user: @user)
        expect(good_menu).to be_a(Menu)
        expect(good_menu).to be_valid
      end
    end


  end

  context "associations" do

    describe "menu_category" do
      it "should have_many menu_category" do
          cat_entree = CategoryType.create(name:'entrée', user: @user)
          cat_plat_chaud = CategoryType.create(name:'plat chaud', user: @user)
          menu_categ = @menu.add_category(cat_entree)
          menu_categ2 = @menu.add_category(cat_plat_chaud)

        expect(@menu.categories.include?(menu_categ)).to eq(true)
      end
    end


  end



  context "public instance methods" do

    describe "add_category_by_id" do
      it "should create a menu_category" do
          cat_entree = CategoryType.create(name:'entrée', user: @user)
          menu_categ = @menu.add_category(cat_entree)
        expect(@menu.categories.first.name).to eq("entrée")
      end
    end

  end

end