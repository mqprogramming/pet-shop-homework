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
