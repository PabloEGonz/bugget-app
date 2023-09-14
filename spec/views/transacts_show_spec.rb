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
      visit category_path(@first_category)
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
    end

    it 'shows the transactions info under that category' do
        click_on @transaction.name
    expect(page).to have_current_path(transact_path(@transaction))
    end

    it 'display the transactions info' do
        visit transact_path(@transaction)
        expect(page).to have_content(@transaction.name)
      expect(page).to have_content(@transaction.amount)
    end
  end
end
