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

  scenario "They see a single product" do

    # ACT
    visit root_path
    # page.find(:class, '.product').click
    # find(:css, '.product.description').click
    find(:css, '.product:first-child header a').click
    # DEBUG / VERIFY

    # EXPECTATION
    expect(page).to have_content 'review'

    # current HTML
    puts page.html
    save_screenshot('product_detail.png')
  end

end

