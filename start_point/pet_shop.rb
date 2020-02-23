# require('pry')
# require('pry-byebug')

# pet_shop = {
#   pets: [
#     {
#       name: "Sir Percy",
#       pet_type: :cat,
#       breed: "British Shorthair",
#       price: 500
#     },
#     {
#       name: "King Bagdemagus",
#       pet_type: :cat,
#       breed: "British Shorthair",
#       price: 500
#     },
#     {
#       name: "Sir Lancelot",
#       pet_type: :dog,
#       breed: "Pomsky",
#       price: 1000,
#     },
#     {
#       name: "Arthur",
#       pet_type: :dog,
#       breed: "Husky",
#       price: 900,
#     },
#     {
#       name: "Tristan",
#       pet_type: :dog,
#       breed: "Basset Hound",
#       price: 800,
#     },
#     {
#       name: "Merlin",
#       pet_type: :cat,
#       breed: "Egyptian Mau",
#       price: 1500,
#     }
#   ],
#   admin: {
#     total_cash: 1000,
#     pets_sold: 0,
#   },
#   name: "Camelot of Pets"
# }

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, added_num)
  pet_shop[:admin][:pets_sold] += added_num
end

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

def pets_by_breed(pet_shop, specific_breed)

  pet_array = []

  pet_shop[:pets].each() do |pet|
    pet_array.push(pet[:breed])
  end

  pet_array.find_all() do |breed_name|
    breed_name == specific_breed
  end

end

def find_pet_by_name(pet_shop, a_name)

  found_name = pet_shop[:pets].find() do |pet|
    pet[:name] == a_name
  end

  return found_name

end

def remove_pet_by_name(pet_shop, a_name)

  pet_shop[:pets].each_with_index() do |pet, index|

    if( pet[:name] == a_name )
      pet_shop[:pets].delete_at(index)
    end

  end

end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)

  if( customer[:cash] >= new_pet[:price] )
    return true
  else
    return false
  end

end

def give_pet_price(pet_shop, pet_name)

  identified_pet = pet_shop[:pets].find() do |pet|
    pet[:name] == pet_name
  end

  if(identified_pet == nil)
    return nil
  else
    return identified_pet[:price]
  end

end

def sell_pet_to_customer(pet_shop, pet, customer)

  if( pet != nil )

    an_amount = give_pet_price(pet_shop, pet[:name])

    if( customer_cash(customer) >= an_amount )

      customer_can_afford_pet(customer, pet)
      remove_customer_cash(customer, an_amount)
      add_or_remove_cash(pet_shop, an_amount)

      add_pet_to_customer(customer, pet)
      remove_pet_by_name(pet_shop, pet[:name])
      increase_pets_sold(pet_shop, 1)
      
    end

  end

end
