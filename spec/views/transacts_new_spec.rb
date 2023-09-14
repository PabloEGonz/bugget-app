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
      @user.save!
      visit new_category_transact_path(@first_category)
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
    end

    it 'After creating a new transaction, displays categorys transactions' do
        fill_in 'transact[name]', with: 'electric bill'
        fill_in 'transact[amount]', with: 20.30
        check 'transact[category_ids][]'
        click_on 'Post transaction'
        expect(page).to have_current_path(category_path(@first_category))
      end

      it 'Check if new transaction is displayed' do
        fill_in 'transact[name]', with: 'electric bill'
        fill_in 'transact[amount]', with: 20.30
        check 'transact[category_ids][]'
        click_on 'Post transaction'
        expect(page).to have_content('electric bill')
        expect(page).to have_content('20.30')
      end
  end
end