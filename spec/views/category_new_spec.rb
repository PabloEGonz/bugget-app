require 'rails_helper'

RSpec.describe 'Category', type: :system do
  describe 'Category new page' do
    before(:each) do
      @user = User.create(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @user.save!
      visit new_category_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
    end

    it 'makes sure all the categories are displaying' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Icon')
    end

    it 'creates new category' do
      fill_in 'category[name]', with: 'savings'
      fill_in 'category[icon]', with: 'https://static.vecteezy.com/system/resources/previews/000/627/536/original/vector-money-icon-symbol-sign.jpg'
      click_on 'Create category'
      expect(page).to have_current_path(categories_path)
    end
  end
end
