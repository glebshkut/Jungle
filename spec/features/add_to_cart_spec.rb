require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    User.create(:name => "Gleb", :email => "gleb.shkut@gmail.com", :password => "password", :password_confirmation => "password")
    visit root_path
    find('#email').set('gleb.shkut@gmail.com')
    find('#password').set('password')
    click_on('Submit')

    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Produce has been added to cart" do
    # ACT
    visit root_path
    first('article.product .button_to').click

    # DEBUG / VERIFY
    within('#navbar') { expect(page).to have_content(' My Cart (1)') }
    # find('#navbar .fa-shopping-cart').click
    visit cart_path
    expect(page).to have_css 'table.table-bordered'
    save_screenshot
  end
end
