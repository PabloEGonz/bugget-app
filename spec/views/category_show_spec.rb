require 'rails_helper'

RSpec.describe 'Category', type: :system do
  describe 'Category show page' do
    before(:each) do
      @user = User.create(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @first_category = Category.create(
        name: 'my category',
        icon: 'https://static.vecteezy.com/system/resources/previews/000/627/536/original/vector-money-icon-symbol-sign.jpg',
        user: @user
      )

      @transaction = Transact.create(name: 'coffe', amount: 2.30, user: @user)
      @transaction.categories << @first_category
      @user.save!
      visit '/categories'
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
    end

    it 'when you click on the category takes user to category show' do
      click_on @first_category.name

      expect(page).to have_current_path(category_path(@first_category))
    end

    it 'shows the transactions info under that category' do
      visit category_path(@first_category)
      expect(page).to have_content(@transaction.name)
      expect(page).to have_content(@transaction.amount)
    end

    it 'shows add a new transaction button' do
      visit category_path(@first_category)
      expect(page).to have_content('Add a transaction')
    end

    it 'takes you to add a new transaction form' do
      visit category_path(@first_category)
      click_on 'Add a transaction'

      expect(page).to have_current_path(new_category_transact_path(@first_category))
    end
  end
end
