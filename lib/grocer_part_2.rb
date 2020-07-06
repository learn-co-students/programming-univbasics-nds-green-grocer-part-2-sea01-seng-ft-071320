require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  coupons.each do |coupon|
    cart.each do |grocery_item|
      if grocery_item[:item] == coupon[:item]
        num = coupon[:num] #initialize number of items per coupon
        
        #create the item w/ coupon hash
        item_w_coupon = {}
        grocery_item.each { |k, v| item_w_coupon[k] = v }
        item_w_coupon[:item] += " W/COUPON"
        item_w_coupon[:price] = coupon[:cost] / num
        item_w_coupon[:count] = 0
        
        #mutate the grocery_item and item_w_coupon hashes for each set of couponed items
        while grocery_item[:count] >= num do
          item_w_coupon[:count] += num
          grocery_item[:count] -= num
        end
        
        if item_w_coupon[:count] > 0
          cart << item_w_coupon
        end
      end #end if grocery_item[:item] == coupon[:item]
    end #end cart.each
  end #end coupons.each
  
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  cart.each do |item|
    if item[:clearance]
      item[:price] *= 0.8
      item[:price].round(2)
    end
  end
  
  cart
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
  
  register = consolidate_cart(cart)
  apply_coupons(register, coupons)
  apply_clearance(register)
  
  total_price = 0
  register.each { |item| total_price += (item[:count] * item[:price]) }
  
  if total_price > 100
    total_price *= 0.9
  end
  
  total_price.round(2)
end
