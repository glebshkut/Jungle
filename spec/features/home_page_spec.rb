require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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

  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_css 'article.product', count: 10
  end

end
