require 'rails_helper'

RSpec.describe 'Category', type: :system do
  describe 'Category index page' do
    before(:each) do
      @user = User.create(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @first_category = Category.create(
        name: 'my category',
        icon: 'https://static.vecteezy.com/system/resources/previews/000/627/536/original/vector-money-icon-symbol-sign.jpg',
        user: @user
      )

      @second_category = Category.create(
        name: 'my second category',
        icon: 'https://static.vecteezy.com/system/resources/previews/000/507/312/non_2x/piggy-bank-icon-design-vector.jpg',
        user: @user
      )
      @user.save!
      visit '/categories'
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
    end

    it 'makes sure all the categories are displaying' do
      expect(page).to have_content(@first_category.name)
      expect(page).to have_content(@second_category.name)
    end

    it 'makes sure add a category button works' do
      expect(page).to have_content('Add new category')
      click_on 'Add new category'

      expect(page).to have_current_path(new_category_path)
    end
  end
end
