require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) {'Yujie'}
  let(:email) {'yujie@gmail.com'}
  let(:password) {'12345678'}
  let(:password_confirmation) {'12345678'}
  let(:user) {User.new(name: name, email: email, password: password, password_confirmation: password_confirmation)}

  context 'when password and password_confirmation does not match' do
    it 'should not be valid' do
      user.password_confirmation = '1234567'
      expect(user).to_not be_valid
    end
  end

  context 'when password is not provided' do
    it 'should not be valid' do
      user.password = nil
      expect(user).to_not be_valid
    end
  end

  context 'when password length is smaller than 6' do
    it 'should not be valid' do
      u = User.new(email: 'testuser@gmail.com', password: '12345')
      u.password.length < 6
      expect(u).to_not be_valid
    end
  end

  context 'when email already exists' do
    it 'should not be valid' do
      user.save
      u = User.new(email: 'YuJie@gmail.com', password: '12345')
      u.save
      expect(u.errors.get(:email)).to eq(["has already been taken"])
    end
  end

  context 'when email is not provided' do
    it 'should not be valid' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end

  context 'when name is not provided' do
    it 'should not be valid' do
      user.name = nil
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should match credentials in the database' do
      user.save
      u = User.authenticate_with_credentials('yujie@gmail.com', '12345678')
      expect(u).to eq user
    end

    it 'should match credentials in the database with blanks' do
      user.save
      u = User.authenticate_with_credentials(' yujie@gmail.com ', '12345678')
      expect(u).to eq user
    end

    it 'should match credentials in the database with case conditions' do
      user.save
      u = User.authenticate_with_credentials('Yujie@Gmail.com', '12345678')
      expect(u).to eq user
    end
  end

end
