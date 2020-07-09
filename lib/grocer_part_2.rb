require 'pry'
require_relative './part_1_solution.rb'


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
    counter = 0 
    while counter < coupons.length 
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[counter][:num] 
        cart_item[:count] -+ coupons[counter][:num]
      else
        cart_item_with_coupon = {
          :item => couponed_item_name, 
          :price => coupons[counter][:cost] / coupons[counter][:num],
          :clearance => cart_item[:clearance],
          :count => coupons[counter][:num]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end  
    end
    counter += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  counter = 0 
  array_with_clearance  =[]
  
  while counter < cart.length 
    if cart[counter][:clearance] == true 
        cart[counter][:price] = ((cart[counter][:price]) *80 / 100).round(2)
        array_with_clearance << cart[counter]
    else 
        array_with_clearance << cart[counter]
    end
    counter += 1
  end
  array_with_clearance
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
  
  total = 0 
  
  consolidate_cart = consolidate_cart(cart)
  cart_with_coupon = apply_coupons(consolidate_cart, coupons)
  total_cart = apply_clearance(cart_with_coupon)
  
  counter = 0 
  while counter < total_cart.length
    total += total_cart[counter][:price] * total_cart[counter][:count]
    counter += 1 
  end
    if total > 100
     total = (total * 0.90)
    end
  total
end
