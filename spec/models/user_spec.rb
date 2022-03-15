require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "password and password_confirmation match" do
      count = User.count
      @user = User.create(:name => "Gleb", :email => "gleb.shkut@gmail.com", :password => "ksjfIIfs23c9sd", :password_confirmation => "ksjfIIfs23c9sd")
      
      expect(User.count).to eql(count + 1)
      expect(User.last).to eql(@user)
    end

    it "password and password_confirmation don't match" do
      count = User.count
      @user = User.create(:name => "Gleb", :email => "gleb.shkut@gmail.com", :password => "ksjfIIf_MISTAKE_23c9sd", :password_confirmation => "ksjfIIfs23c9sd")
      
      expect(User.count).to eql(count)
      expect(User.last).not_to eql(@user)
    end
    
    it "user2 is not saved, if email is UPPERCASE of existing one" do
      @user1 = User.new(:name => "Gleb", :email => "TEST@TEST.com", :password => "ksjfIIfs23c9sd", :password_confirmation => "ksjfIIfs23c9sd")
      @user1.save
      @user2 = User.new(:name => "NotGleb", :email => "test@test.COM", :password => "sjfijo2j23ff", :password_confirmation => "sjfijo2j23ff")
      
      expect(@user2.save).to be false
    end
    
    it "user is not saved if name is nil" do
      @user = User.new(:email => "TEST@TEST.com", :password => "ksjfIIfs23c9sd", :password_confirmation => "ksjfIIfs23c9sd")
      
      expect(@user.save).to be false
    end
    
    it "user is not saved if password is less than 8 chars" do
      @user = User.new(:email => "TEST@TEST.com", :password => "passwor", :password_confirmation => "passwor")
      
      expect(@user.save).to be false
    end
  end


  describe '.authenticate_with_credentials' do
    it "user is successfully authenticated" do
      user = User.create(:name => "NotGleb", :email => "test@test.com", :password => "password", :password_confirmation => "password")

      expect(User.last).to eql user
      
      expect(User.authenticate_with_credentials("test@test.com", "password")).to_not be_nil
    end

    it "user is successfully authenticated if email include white spaces" do
      user = User.create(:name => "NotGleb", :email => "test@test.com", :password => "password", :password_confirmation => "password")

      expect(User.last).to eql user
      
      expect(User.authenticate_with_credentials("  test@test.com  ", "password")).to_not be_nil
    end

    it "user is successfully authenticated if email has Upper Case letters" do
      user = User.create(:name => "NotGleb", :email => "test@test.com", :password => "password", :password_confirmation => "password")

      expect(User.last).to eql user
      
      expect(User.authenticate_with_credentials("tEst@teSt.com", "password")).to_not be_nil
    end
  end


end
