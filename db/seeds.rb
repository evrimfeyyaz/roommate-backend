room_service_categories = [
  { title: 'Breakfast', available_from: '06:00', available_until: '11:00' },
  { title: 'Starters and Salads' },
  { title: 'Mains' },
  { title: 'Grills' },
  { title: 'Pasta' },
  { title: 'Pizza' },
  { title: 'Burgers & Wraps' },
  { title: 'Desserts' },
  { title: 'All Day Dining' },
  { title: 'Beverages' },
  { title: 'Wines' },
  { title: 'Cocktails' },
  { title: 'Mocktails' }
]

room_service_item_tags = [
  { title: 'Cereals' },
  { title: 'Seafood' },
  { title: 'Dairy' },
  { title: 'Nuts & Seeds' },
  { title: 'Eggs' },
  { title: 'Mustard & Celery' },
  { title: 'Soya' },
  { title: 'Spicy' },
  { title: 'Healthy' },
  { title: 'Vegetarian' }
]

food_descriptions = [
  'Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant.',
  'Three egg omelet with Roquefort cheese, chives, and ham. With a side of roasted potatoes, and your choice of toast or croissant.',
  'Three egg whites with spinach, mushrooms, caramelized onions, tomatoes and low-fat feta cheese. With herbed quinoa, and your choice of rye or whole-grain toast.',
  'Smoked salmon, poached eggs, diced red onions and Hollandaise sauce on an English muffin. With a side of roasted potatoes.',
  'Fresh parsley, Italian sausage, shallots, garlic, sun-dried tomatoes and mozzarella cheese in an all-butter crust. With a side of mixed fruits.',
  'Thick slices of French toast bread, brown sugar, half-and-half and vanilla, topped with powdered sugar. With two eggs served any style, and your choice of smoked bacon or smoked ham.',
  'Two buttermilk waffles, topped with whipped cream and maple syrup, a side of two eggs served any style, and your choice of smoked bacon or smoked ham.',
  'Breaded fried chicken with waffles, and a side of maple syrup.',
  'Two butter croissants of your choice (plain, almond or cheese). With a side of herb butter or house-made hazelnut spread.',
  '28-day aged 300g USDA Certified Prime Ribeye, rosemary-thyme garlic butter, with choice of two sides.',
  'Breaded fried chicken with waffles. Served with maple syrup.',
  'Fresh Norwegian salmon, lightly brushed with our herbed Dijon mustard sauce, with choice of two sides.',
  'Creamy mascarpone cheese and custard layered between espresso and rum soaked house-made ladyfingers, topped with Valrhona cocoa powder.',
  'Granny Smith apples mixed with brown sugar and butter filling, in a flaky all-butter crust, with ice cream.'
]

# Create room service item choices and options.
toppings_choice = RoomServiceItemChoice.new(title: 'Toppings')
toppings_choice.room_service_item_choice_options << [
  RoomServiceItemChoiceOption.new(title: 'Mango Salsa', price: 0.500),
  RoomServiceItemChoiceOption.new(title: 'Guacamole', price: 0.700),
  RoomServiceItemChoiceOption.new(title: 'Lime'),
  RoomServiceItemChoiceOption.new(title: 'Crushed Nachos'),
  RoomServiceItemChoiceOption.new(title: 'Cheese'),
  RoomServiceItemChoiceOption.new(title: 'Sour Cream'),
  RoomServiceItemChoiceOption.new(title: 'Jalapenos')
]
toppings_choice.save!

sauce_choice = RoomServiceItemChoice.new(title:                        'Sauce',
                                         minimum_number_of_selections: 1,
                                         maximum_number_of_selections: 1)
sauce_choice.room_service_item_choice_options << [
  RoomServiceItemChoiceOption.new(title: 'No Sauce'),
  RoomServiceItemChoiceOption.new(title: 'Lime Yogurt'),
  RoomServiceItemChoiceOption.new(title: 'Chile Con Queso'),
  RoomServiceItemChoiceOption.new(title: 'Spicy Chipotle')
]
sauce_choice.default_option = sauce_choice.room_service_item_choice_options.first
sauce_choice.save!

extras_choice = RoomServiceItemChoice.new(title:                        'Extras',
                                          minimum_number_of_selections: 1,
                                          maximum_number_of_selections: 5)
extras_choice.room_service_item_choice_options << [
  RoomServiceItemChoiceOption.new(title: 'Mango Salsa', price: 0.500),
  RoomServiceItemChoiceOption.new(title: 'Guacamole', price: 0.700),
  RoomServiceItemChoiceOption.new(title: 'Lime'),
  RoomServiceItemChoiceOption.new(title: 'Crushed Nachos'),
  RoomServiceItemChoiceOption.new(title: 'Cheese'),
  RoomServiceItemChoiceOption.new(title: 'Sour Cream'),
  RoomServiceItemChoiceOption.new(title: 'Jalapenos')
]
extras_choice.save!

p "Created #{RoomServiceItemChoice.count} room service item choices and #{RoomServiceItemChoiceOption.count} options."

# Ensure we get the same items each time the database is seeded.
Faker::Config.random = Random.new(42)

# Create room service categories.
RoomServiceCategory.create!(room_service_categories)
p "Created #{RoomServiceCategory.count} room service categories."

# Create room service item tags.
RoomServiceItemTag.create!(room_service_item_tags)
p "Created #{RoomServiceItemTag.count} room service item tags."

# Create items in each category.
room_service_categories.each_with_index do |category, index|
  category = RoomServiceCategory.find_by(title: category[:title])

  items = []
  Faker::UniqueGenerator.clear
  # We shuffle the descriptions to mix up the item order in each category.
  # Supplying the same random number generator retains this "random" order in each seeding.
  food_descriptions.shuffle(random: Random.new(index)).each do |food_description|
    items << {
      title:                     Faker::Food.unique.dish,
      description:               food_description,
      price:                     rand(1..50),
      thumbnail:                 Rails.root.join('seed/smoked-salmon-eggs-benedict-thumbnail.jpg').open,
      image:                     Rails.root.join('seed/baked-dijon-salmon.jpg').open,
      room_service_item_choices: [toppings_choice, sauce_choice, extras_choice],
      room_service_item_tags: RoomServiceItemTag.all.sample(rand(1...RoomServiceItemTag.count))
    }
  end

  category.room_service_items << RoomServiceItem.create!(items)

  p "Created #{category.room_service_items.count} items in #{category.title}."
end