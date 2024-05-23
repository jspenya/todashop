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
  },
  {
    name: 'Demon Eater',
    sub_description: '',
    game: Game.find_by_name('Steam'),
    price: 500.00,
    image_link: 'https://community.cloudflare.steamstatic.com/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KW1Zwwo4NUX4oFJZEHLbXK9QlSPcU8rA1YXkHfVeHixMfSV1JjIw1SuL6aLwJt3P33dDxW6c6JmIGZkPK6YeKDkD0Hu8R027nC9t302wDhrUJrN2HzJdKUIAM8YgmE-1O2yebpg4j84sqCpPG6Jg/330x192',
    is_bidding: true
  },
  {
    name: 'Fractal Horns',
    sub_description: '',
    game: Game.find_by_name('Steam'),
    price: 300.00,
    image_link: 'https://community.cloudflare.steamstatic.com/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KW1Zwwo4NUX4oFJZEHLbXL5B5QK5l9vR5PXkPCReis08qcUk93JApWia6gORVvwfHEcDlH09C3hoeO2fb3au3Uzm4BuMNy0ryS9Nmm3w3m_RZlamH0IISVcwE8YQ6F81PqxLzxxcjrOGl8rcI/330x192',
    is_bidding: true
  },
  {
    name: 'Shadow Daggers',
    sub_description: '',
    game: Game.find_by_name('Steam'),
    price: 1000.00,
    image_link: 'https://community.cloudflare.steamstatic.com/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpovbSsLQJfw-bbeQJB-eOmgZODqPv7Ib7um25V4dB8xL2V9NrwjAbi_kZrMW73JYeTJ1U8aVHZrFG-k7y9jMXtu8ibyHY3vSA8pSGK_-dllGc/360fx360f',
    is_bidding: true
  },
  {
    name: 'Survival Knife',
    sub_description: '',
    game: Game.find_by_name('Steam'),
    price: 1500.00,
    image_link: 'https://community.cloudflare.steamstatic.com/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQh5hlcX0nvUOGsx8DdQBJjIAVHubSaIAlp1fb3cjxM5c_4xYHaz6ChY7jTkzgJ6p0gjr6S9In231awrUBqYGj0JYPGJFI3ZQ2F8k_-n7nNhv9VGA/360fx360f',
    is_bidding: true
  },
  {
    name: 'Karambit',
    sub_description: '',
    game: Game.find_by_name('Steam'),
    price: 12500.00,
    image_link: 'https://community.cloudflare.steamstatic.com/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQh5hlcX0nvUOGsx8DdQBJjIAVHubSaIAlp1fb3ejxQ7dG0nZTFw_H3a--IlTwCuMQl3r2UoY6n3QLj80I5MDr0JIbBJg9qYFnRrFS_wvCv28FbcdtZVg/360fx360f',
    is_bidding: true
  }
]

products.each do |product|
  Product.find_or_create_by!(product)
end

puts "Seeding done! 🌱"
