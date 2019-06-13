require 'rails_helper'

RSpec.describe ItemType, type: :model do

  before(:each) do 
     @user = User.create(email:'anneonymous@yopmail.com', password:'azerty', first_name: 'Anne', last_name: "Onymous")
     @itemType = ItemType.create(name: 'Salade', description: "Salade de tomates", price: 12.00, user: @user)

  end
        expect(@user.item_types.include?(itemType)).to eq(true)

  context "validation" do

    it "is valid with valid attributes" do
      expect(@itemType).to be_a(item_type)
      expect(@itemType).to be_valid
    end

    describe "#name" do
      it "should not be valid without name" do
        bad_itemType = ItemType.create(name: "Salade")
        expect(bad_itemType).not_to be_valid
        expect(bad_itemType.errors.include?(:name)).to eq(true)
      end
    end

    describe "#description" do
      it "should not be valid without description" do
        bad_itemType = ItemType.create(description: "Salade de tomates")
        expect(bad_itemType).not_to be_valid
        expect(bad_itemType.errors.include?(:description)).to eq(true)
      end
    end


  end

  context "associations" do

    describe "users" do
      it "should one user" do
        itemType = ItemType.create(name: 'Assiette provençale', description: "Mesclun d'asperges et tomates confites sauce Parmesan", price: 12.00, user: @user)

        expect(@user.itemTypes.include?(itemType)).to eq(true)
      end
    end

  end



  context "public instance methods" do

    describe "#name_and_price" do

      it "should return a name follow with the price like name - 12" do
        expect(@itemType.name_and_price).to be_a(String)
      end

      it "should return the full name" do
        itemType_1 = ItemType.create(name: 'Salade', description: "Salade de tomates", price: 12.00, user: @user)
        expect(itemType_1.name_and_price).to eq("Salade - 12.0€")
        itemType_1 = ItemType.create(name: 'Steak', description: "Steak de Thon", price: 15.00, user: @user)
        expect(itemType_1.name_and_price).to eq("Steak - 15.0€")
      end
    end

  end

end