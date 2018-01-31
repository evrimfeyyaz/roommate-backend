room_service_categories = [
  { title: 'Breakfast' },
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

# Ensure we get the same items each time the database is seeded.
Faker::Config.random = Random.new(42)

# Create room service categories.
RoomServiceCategory.create!(room_service_categories)
p "Created #{RoomServiceCategory.count} room service categories."

# Create items in each category.
room_service_categories.each_with_index do |category, index|
  category = RoomServiceCategory.find_by(title: category[:title])

  items = []
  Faker::UniqueGenerator.clear
  # We shuffle the descriptions to mix up the item order in each category.
  # Supplying the same random number generator retains this "random" order in each seeding.
  food_descriptions.shuffle(random: Random.new(index)).each do |food_description|
    items << {
      title: Faker::Food.unique.dish,
      description: food_description,
      price: rand(1..50),
      thumbnail: Rails.root.join('seed/smoked-salmon-eggs-benedict-thumbnail.jpg').open,
      image: Rails.root.join('seed/baked-dijon-salmon.jpg').open
    }
  end

  category.room_service_items << RoomServiceItem.create!(items)

  p "Created #{category.room_service_items.count} items in #{category.title}."
end