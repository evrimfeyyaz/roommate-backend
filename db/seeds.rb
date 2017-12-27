room_service_categories = [
  {
    title: 'Breakfast'
  }
]

breakfast_items = [
  {
    title:       'Mexican Omelet',
    description: 'Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant.',
    price:       16
  },
  {
    title:       'French Omelet',
    description: 'Three egg omelet with Roquefort cheese, chives, and ham. With a side of roasted potatoes, and your choice of toast or croissant.',
    price:       18
  },
  {
    title:       'Healthy Veggie Omelet',
    description: 'Three egg whites with spinach, mushrooms, caramelized onions, tomatoes and low-fat feta cheese. With herbed quinoa, and your choice of rye or whole-grain toast.',
    price:       19
  },
  {
    title:       'Smoked Salmon Eggs Benedict',
    description: 'Smoked salmon, poached eggs, diced red onions and Hollandaise sauce on an English muffin. With a side of roasted potatoes.',
    price:       18
  },
  {
    title:       'Sausage and Sun-Dried Tomato Quiche',
    description: 'Fresh parsley, Italian sausage, shallots, garlic, sun-dried tomatoes and mozzarella cheese in an all-butter crust. With a side of mixed fruits.',
    price:       22
  },
  {
    title:       'Creme Brûlée French Toast',
    description: 'Thick slices of French toast bread, brown sugar, half-and-half and vanilla, topped with powdered sugar. With two eggs served any style, and your choice of smoked bacon or smoked ham.',
    price:       18
  },
  {
    title:       'Buttermilk Waffles',
    description: 'Two buttermilk waffles, topped with whipped cream and maple syrup, a side of two eggs served any style, and your choice of smoked bacon or smoked ham.',
    price:       16
  },
  {
    title:       'Fried Chicken and Waffles',
    description: 'Breaded fried chicken with waffles, and a side of maple syrup.',
    price:       22
  },
  {
    title:       'Fresh Croissants',
    description: 'Two butter croissants of your choice (plain, almond or cheese). With a side of herb butter or house-made hazelnut spread.',
    price:       12
  }
]

RoomServiceCategory.create!(room_service_categories)
p "Created #{RoomServiceCategory.count} room service categories."

breakfast_category = RoomServiceCategory.find_by(title: 'Breakfast')
breakfast_category.items << RoomServiceItem.create!(breakfast_items)
p "Created #{breakfast_category.items.count} room service items in Breakfast."