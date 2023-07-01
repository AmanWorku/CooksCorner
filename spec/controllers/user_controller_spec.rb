require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }
  end

  describe 'database_authenticatable' do
    it 'Testng correct email and password' do
      user = User.create(email: 'example@example.com', password: 'Password')
      expect(user.valid_password?('Password')).to eq(true)
    end

    it 'Testing incorrect password' do
      user = User.create(email: 'example@example.com', password: 'Password')
      expect(user.valid_password?('wrong_password')).to eq(false)
    end
  end
end
