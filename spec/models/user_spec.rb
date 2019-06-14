require 'rails_helper'

RSpec.describe User, type: :model do
     @url  = 'http://localhost:3000/'

  before(:each) do 

      @user = User.create(email:'anneonymous@yopmail.com', password:'azerty', first_name: 'Anne', last_name: "Onymous")

  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#email" do
      it "should not be valid without email" do
        bad_user = User.create(last_name: 'Onymous', password:'azerty')
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:email)).to eq(true)
      end
    end

    describe "#password" do
      it "should not be valid without password" do
        bad_user = User.create(email:'test1@yopmail.com', first_name: "Anne")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:password)).to eq(true)
      end
    end


    describe "#last_name_and_fist_name" do
      it "should be valid without last_name and first_name" do
        good_user = User.create(email:'test3@yopmail.com', password:'azerty')
        expect(good_user).to be_a(User)
        expect(good_user).to be_valid
      end
    end


  end

  context "associations" do

    describe "item_types" do
      it "should have_many item_types" do
        itemType = ItemType.create(name: 'Test1', description: "Mesclun d'asperges et tomates confites sauce Parmesan", price: 12.00, user: @user)
        itemType2 = ItemType.create(name: 'Test2', description: "", price: 12.00, user: @user)

        expect(@user.item_types.include?(itemType)).to eq(true)
      end
    end

  end



  context "public instance methods" do


  end

end