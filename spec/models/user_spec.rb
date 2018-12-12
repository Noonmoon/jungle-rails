require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is valid with valid attributes" do
      @user = User.new
      @user.first_name = "nick"
      @user.last_name = "apache"
      @user.password =  "rem"
      @user.password_confirmation = "rem"
      @user.email = "rem@rem.rem"
      @user.save
      expect(@user).to be_present
    end

    it "is not valid without a password" do
      @user = User.new
      @user.first_name = "nick"
      @user.last_name = "apache"
      @user.password =  nil
      @user.password_confirmation = "rem"
      @user.email = "rem@rem.rem"
      @user.save
      expect(@user.password).to be_present
    end

    it "is not valid without a password_confirmation" do
      @user = User.new
      @user.first_name = "nick"
      @user.last_name = "apache"
      @user.password =  "rem"
      @user.password_confirmation = nil
      @user.email = "rem@rem.rem"
      @user.save
      expect(@user.password_confirmation).to be_present
    end

    it "is not valid with different password and password_confirmation" do
      @user = User.new
      @user.first_name = "nick"
      @user.last_name = "apache"
      @user.password =  "rem"
      @user.password_confirmation = "mer"
      @user.email = "rem@rem.rem"
      @user.save
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it "is not valid with non-unique email" do
      @user1 = User.new
      @user2 = User.new

      @user1.first_name = "rem"
      @user1.email = "Rem"
      @user1.save

      @user2.first_name = "nom"
      @user2.email = "rem"
      @user2.save

      expect(@user2).to be_nil
    end

    it "is not valid without email, first name, last name" do
      @user = User.new
      @user.first_name = nil
      @user.last_name = nil
      @user.password =  "rem"
      @user.password_confirmation = "rem"
      @user.email = nil
      @user.save
      expect(@user.email).to be_present
      expect(@user.first_name).to be_present
      expect(@user.last_name).to be_present
    end

    it "is not valid if password under 5 characters" do
      @user = User.new
      @user.first_name = "nick"
      @user.last_name = "apache"
      @user.password =  "ra"
      @user.password_confirmation = "ra"
      @user.email = "rem@rem.rem"
      @user.save

      expect(@user).to be_present
    end
  end

  describe '.authenticate_with_credentials' do

  end
end



