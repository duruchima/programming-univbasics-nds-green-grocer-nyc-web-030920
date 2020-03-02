def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0
  while i < collection.length do
    return collection[i] if name == collection[i][:item]
    i += 1
  end
  nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  index = 0
  new_cart = []

  while index < cart.count do
    item_name = cart[index][:item]
    sought_item = find_item_by_name_in_collection(item_name, new_cart)
    if sought_item
      sought_item[:count] += 1
    else
      cart[index][:count] = 1
      new_cart << cart[index]
    end
    index += 1
  end

  new_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon|
    coupon.each do |attribute, value|
      name = coupon[:item]

      if cart[name] && cart[name][:count] >= coupon[:num]
        if cart["#{name} W/COUPON"]
          cart["#{name} W/COUPON"][:count] += 1
        else
          cart["#{name} W/COUPON"] = {:price => coupon[:cost],
          :clearance => cart[name][:clearance], :count => 1}
        end

      cart[name][:count] -= coupon[:num]
    end
  end
end
  cart
end
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
