require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  # Create data in the database

  before :each do
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

  scenario "User clicks add to cart and cart increases by one" do

    # ACT
    visit '/login'
    # page.find(:class, '.product').click
    # find(:css, '.product.description').click
    # find(:css, "#email").set('gordon682008forever@gmail.com');
    # find(:css, "#password").set('123456789');
    fill_in 'email', with: 'gordon682008forever@gmail.com'
    fill_in 'password', with: '123456789'
    save_screenshot('test.png')
    click_button 'Submit'
    # find(:css, "input[name='commit']").click
    # u = User.authenticate_with_credentials('yujie@gmail.com', '12345678')
    save_screenshot('after-submit.png')

    visit root_path

    find(:css, '.product:first-child footer form button').click
    # DEBUG / VERIFY

    # EXPECTATION
    # cart = find(:css, '.nav navbar-nav navbar-right:nth-child(2) a')
    expect(page).to have_content ' My Cart (1)'

    # current HTML
    puts page.html
    save_screenshot('add_to_cart.png')
  end




end
