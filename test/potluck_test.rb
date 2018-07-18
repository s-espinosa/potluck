require 'minitest/autorun'
require 'minitest/pride'
require './lib/potluck'
require './lib/dish'

class PotluckTest < Minitest::Test
  def test_it_exists
    pl = Potluck.new("7-13-18")

    assert_instance_of Potluck, pl
  end

  def test_it_has_a_date
    pl = Potluck.new("7-13-18")

    assert_equal "7-13-18", pl.date
  end

  def test_it_starts_with_no_dishes
    pl = Potluck.new("7-13-18")

    assert_equal [], pl.dishes
  end

  def test_it_can_add_dishes
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)

    expected = [couscous_salad, cocktail_meatballs]

    assert_equal expected, potluck.dishes
  end

  def test_it_can_return_categories_of_dishes
    potluck            = Potluck.new("7-13-18")
    couscous_salad     = Dish.new("Couscous Salad", :appetizer)
    summer_pizza       = Dish.new("Summer Pizza", :appetizer)
    roast_pork         = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad        = Dish.new("Candy Salad", :dessert)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)

    expected = [couscous_salad, summer_pizza]
    actual   = potluck.get_all_from_category(:appetizer)

    assert_equal expected, actual

    expected_2 = [candy_salad]
    actual_2   = potluck.get_all_from_category(:dessert)

    assert_equal expected_2, actual_2
  end

  def test_the_ratio_of_a_category_to_the_total_number_of_dishes
    potluck            = Potluck.new("7-13-18")
    couscous_salad     = Dish.new("Couscous Salad", :appetizer)
    summer_pizza       = Dish.new("Summer Pizza", :appetizer)
    roast_pork         = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad        = Dish.new("Candy Salad", :dessert)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)

    expected = 20.0
    actual   = potluck.ratio(:dessert)

    assert_equal expected, actual
  end

  def test_it_can_show_menu
    potluck            = Potluck.new("7-13-18")
    couscous_salad     = Dish.new("Couscous Salad", :appetizer)
    summer_pizza       = Dish.new("Summer Pizza", :appetizer)
    bean_dip           = Dish.new("Bean Dip", :appetizer)
    roast_pork         = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad        = Dish.new("Candy Salad", :dessert)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    expected = {:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]}

    assert_equal expected, potluck.menu
  end
end
