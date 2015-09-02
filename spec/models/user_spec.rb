require 'spec_helper'

RSpec.describe User do
  context 'Valid user' do
    it 'Create a valid user' do
      user = FactoryGirl.build(:user)
      expect(user.save).to eql true
    end

    it 'validate auth user' do
      user = FactoryGirl.create(:user)
      expect(User.validate_token(user.id, user.token)).to eql true
    end

    it 'Signup valid user' do
      user = { email: 'angelbotto@gmail.com', password: '12345' }
      expect(User.signup(user)).to be_persisted
    end

    it 'Signin valid user' do
      FactoryGirl.create(:user)
      expect(User.signin('angelbotto@gmail.com', '12345')).to be_persisted
    end
  end

  context 'Invalid user' do
    it 'Create user without valid email' do
      user = FactoryGirl.build(:user, email: 'angelbotto')
      expect(user.save).to eql false
    end

    it 'Create user without  email' do
      user = FactoryGirl.build(:user, email: nil)
      expect(user.save).to eql false
    end

    it 'Create 2 users with same  email' do
      FactoryGirl.create(:user)
      angel = FactoryGirl.build(:user)
      expect(angel.save).to eql false
    end

    it 'validate auth user' do
      user = FactoryGirl.create(:user)
      expect(User.validate_token('1', user.token)).to eql false
    end

    it 'Signup invalid user' do
      user = { password: '12345' }
      expect(User.signup(user)[:email]).to include('is invalid')
    end

    it 'Signin invalid user' do
      FactoryGirl.create(:user)
      expect(User.signin('angelbotto@gmail.com', '1')).to eql false
    end
  end
end
