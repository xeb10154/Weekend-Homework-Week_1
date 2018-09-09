# Q1
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

# Q2
def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

# Q3
def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

# Q4
def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

# Q5
def increase_pets_sold(pet_shop, amount)
  pet_shop[:admin][:pets_sold] += amount
end

# Q6
def stock_count(pet_shop)
  pet_shop[:pets].length
end

# Q7
def pets_by_breed(pet_shop, breed)

  type_array = []
  counter = 0

  for each in pet_shop[:pets]
    if (pet_shop[:pets][counter][:breed] == breed)
      type_array.push(pet_shop[:pets][counter][:name])
      counter += 1
    end
  end

  return type_array
end

# Q8 + Q9
def find_pet_by_name(pet_shop, petName)

  for each in pet_shop[:pets]
    if (each[:name] == petName)
      return each
    end
  end
  return nil
end

# 10
def remove_pet_by_name(pet_shop, petName)
  for each in pet_shop[:pets]
    if (each[:name] == petName)
      pet_shop[:pets].delete(each)
    end
  end
end

# Q11
def add_pet_to_stock(pet_shop, newPet)
  pet_shop[:pets].push(newPet)
end

# Q12
def customer_cash(custIndex)
  return custIndex[:cash]
end

# Q13
def remove_customer_cash(custIndex, amount)
  custIndex[:cash] -= amount
end

# Q14
def customer_pet_count(custIndex)
  return custIndex[:pets].length
end

# Q15
def add_pet_to_customer(custIndex, newPet)
  custIndex[:pets].push(newPet)
end

# # Optional

# Q16

def customer_can_afford_pet(custIndex, newPet)
  afford = false
  if custIndex[:cash] >= newPet[:price]
    afford = true
  end
  return afford
end

def sell_pet_to_customer(pet_shop, newPet, custIndex)

  # if pet exists and is affordable then proceed with transaction.

  # # WHY DOES THIS LINE NOT WORK???
  # affordable = customer_can_afford_pet(custIndex, newPet)

  if (newPet != nil && customer_can_afford_pet(custIndex, newPet) == true)
    # add to customer pet count
    add_pet_to_customer(custIndex, newPet)

    # rm from pet shop stock
    remove_pet_by_name(pet_shop, newPet[:name])

    # increase pets sold
    increase_pets_sold(pet_shop, 1)

    # rm from customer cash
    remove_customer_cash(custIndex, newPet[:price])

    # add to shop (cash)
    add_or_remove_cash(pet_shop, newPet[:price])
  end

end
