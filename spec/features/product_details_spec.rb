require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "Can see specified product" do
    # ACT
    visit root_path
    first('article.product header').click

    # DEBUG / VERIFY
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end
end
