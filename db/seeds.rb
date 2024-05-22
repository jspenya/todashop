# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#

# Create Games
# ["Mobile Legends", "Steam"].each do |name|
#   Game.find_or_create_by!(name:)
# end
puts "Seeding data.."

unless User.exists?
  User.create(first_name: 'Juan', last_name: 'Dela Cruz', email: 'juan@delacruz.com', password: 'password', password_confirmation: 'password')
end

games = [
  {
    name: 'Mobile Legends',
    image_link: 'https://yt3.googleusercontent.com/xzNabrcydSGOHhSBqVSpX_ozH7WdcQ7eMA08UfOX8v5X_7S-0MWwTNzebgAs0t-iqV1B_Lxd=s900-c-k-c0x00ffffff-no-rj',
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore est assumenda quam, earum mollitia nulla. Recusandae tempore, vero voluptas sunt modi inventore, laudantium consequuntur omnis nesciunt, dolore fugiat ullam eius.'
  },
  {
    name: 'Steam',
    image_link: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Steam_icon_logo.svg/800px-Steam_icon_logo.svg.png',
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam placeat nulla obcaecati, quam harum id blanditiis earum expedita labore dolor impedit ducimus nihil quis hic illum facere omnis esse veritatis?'
  }
]

games.each do |g|
  Game.find_or_create_by!(g)
end

products = [
  {
    name: '11 Diamonds',
    sub_description: '(10 + 1 bonus)',
    game: Game.find_by_name('Mobile Legends'),
    price: 9.50,
    image_link: 'https://cdn1.codashop.com/S/content/common/images/denom-image/MLBB/100x100/50orless_MLBB_Diamonds.png',
  },
  {
    name: '56 Diamonds',
    sub_description: '(51 + 5 bonus)',
    game: Game.find_by_name('Mobile Legends'),
    price: 47.50,
    image_link: 'https://cdn1.codashop.com/S/content/common/images/denom-image/MLBB/100x100/50ormore_MLBB_Diamonds.png'
  },
  {
    name: '223 Diamonds',
    sub_description: '(203 + 20 bonus)',
    game: Game.find_by_name('Mobile Legends'),
    price: 190.00,
    image_link: 'https://cdn1.codashop.com/S/content/common/images/denom-image/MLBB/100x100/150orMore_MLBB_Diamonds.png'
  },
  {
    name: '200 Funds',
    sub_description: '₱ 200.00',
    game: Game.find_by_name('Steam'),
    price: 200.00,
    image_link: 'https://www.pngkey.com/png/full/238-2385804_50-steam-wallet-gift-card-steam-wallet-gift.png'
  },
  {
    name: '400 Funds',
    sub_description: '₱ 400.00',
    game: Game.find_by_name('Steam'),
    price: 400.00,
    image_link: 'https://www.pngkey.com/png/full/238-2385804_50-steam-wallet-gift-card-steam-wallet-gift.png'
  },
  {
    name: '600 Funds',
    sub_description: '₱ 600.00',
    game: Game.find_by_name('Steam'),
    price: 600.00,
    image_link: 'https://www.pngkey.com/png/full/238-2385804_50-steam-wallet-gift-card-steam-wallet-gift.png'
  }
]

products.each do |product|
  Product.find_or_create_by!(product)
end

puts "Seeding done! 🌱"
