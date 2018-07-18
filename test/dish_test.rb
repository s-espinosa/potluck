require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'

class DishTest < Minitest::Test
  def test_it_exists
    dish = Dish.new("Couscous Salad", :appetizer)

    assert_instance_of Dish, dish
  end

  def test_it_has_attributes
    dish = Dish.new("Couscous Salad", :appetizer)

    assert_equal "Couscous Salad", dish.name
    assert_equal :appetizer, dish.category
  end

  def test_it_can_have_different_attributes
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entree)

    assert_equal "Cocktail Meatballs", cocktail_meatballs.name
    assert_equal :entree, cocktail_meatballs.category
  end
end
