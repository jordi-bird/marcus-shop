# Esborra dades prèvies
Rule.delete_all
ItemPartAttributeOption.delete_all
ItemPartAttribute.delete_all
ItemPart.delete_all
Item.delete_all

# ITEM
bike = Item.create!(name: "Bicycle", description: "Build your own custom bicycle")

# === FRAME PART ===
frame = bike.item_parts.create!(name: "Frame", description: "The core structure of the bike")

frame_type_attr = frame.item_part_attributes.create!(name: "Type")
frame_type_attr.item_part_attribute_options.create!([
  { name: "Full-suspension", price: 300, stock: 10 },
  { name: "Diamond", price: 250, stock: 15 },
  { name: "Step-through", price: 200, stock: 20 }
])

frame_finish_attr = frame.item_part_attributes.create!(name: "Finish")
frame_finish_attr.item_part_attribute_options.create!([
  { name: "Matte", price: 30, stock: 50 },
  { name: "Shiny", price: 40, stock: 50 }
])

# === WHEELS PART ===
wheels = bike.item_parts.create!(name: "Wheels", description: "Choose your wheel type")

wheels_type_attr = wheels.item_part_attributes.create!(name: "Type")
wheels_type_attr.item_part_attribute_options.create!([
  { name: "Road wheels", price: 100, stock: 20 },
  { name: "Mountain wheels", price: 150, stock: 15 },
  { name: "Fat bike wheels", price: 180, stock: 10 }
])

# === RIMS SUBPART OF WHEELS ===
rims = bike.item_parts.create!(name: "Rims", description: "Choose your rim color", parent: wheels)

rim_color_attr = rims.item_part_attributes.create!(name: "Color")
rim_color_attr.item_part_attribute_options.create!([
  { name: "Red", price: 15, stock: 10 },
  { name: "Black", price: 10, stock: 25 },
  { name: "Blue", price: 12, stock: 20 }
])

# === CHAIN PART ===
chain = bike.item_parts.create!(name: "Chain", description: "Select chain type")

chain_type_attr = chain.item_part_attributes.create!(name: "Type")
chain_type_attr.item_part_attribute_options.create!([
  { name: "Single-speed chain", price: 25, stock: 30 },
  { name: "8-speed chain", price: 35, stock: 25 }
])

puts "✅ Seed completat correctament!"
puts "Total d'articles: #{Item.count}"


# === REGLAMENT ===
puts "Creant regles..."

# Agafa opcions específiques
mountain_wheels = ItemPartAttributeOption.find_by!(name: "Mountain wheels")
fat_bike_wheels = ItemPartAttributeOption.find_by!(name: "Fat bike wheels")
red_rim = ItemPartAttributeOption.find_by!(name: "Red")
full_suspension = ItemPartAttributeOption.find_by!(name: "Full-suspension")
diamond_frame = ItemPartAttributeOption.find_by!(name: "Diamond")
single_speed_chain = ItemPartAttributeOption.find_by!(name: "Single-speed chain")
eight_speed_chain = ItemPartAttributeOption.find_by!(name: "8-speed chain")
matte_finish = ItemPartAttributeOption.find_by!(name: "Matte")

# 1. Mountain wheels només compatible amb Full-suspension
Rule.create!(
  source_option: full_suspension,
  target_option: mountain_wheels,
  rule_type: "compatibility",
  reciprocal: false
)

Rule.create!(
  source_option: diamond_frame,
  target_option: single_speed_chain,
  rule_type: "compatibility",
  reciprocal: false
)

# 1. Mountain wheels només compatible amb Full-suspension
Rule.create!(
  source_option: diamond_frame,
  target_option: matte_finish,
  rule_type: "incompatibility",
  reciprocal: true
)


# 2. Fat bike wheels incompatible amb Red rim
Rule.create!(
  source_option: fat_bike_wheels,
  target_option: red_rim,
  rule_type: "incompatibility",
  reciprocal: true
)

# 3. Si esculls 8-speed chain, Diamond frame té un suplement de 50
Rule.create!(
  source_option: diamond_frame,
  target_option: eight_speed_chain,
  rule_type: "price_modifier",
  operation: "add",
  value: 50,
  reciprocal: false
)

# 4. Si esculls Matte finish, Fat bike wheels es multiplica ×1.1
Rule.create!(
  source_option: matte_finish,
  target_option: fat_bike_wheels,
  rule_type: "price_modifier",
  operation: "multiply",
  value: 1.1,
  reciprocal: false
)

puts "✅ Regles creades: #{Rule.count}"