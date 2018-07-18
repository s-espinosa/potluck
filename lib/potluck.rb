class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

  def ratio(category)
    (get_all_from_category(category).length / @dishes.length.to_f) * 100
  end

  def menu
    courses = {}
    @dishes.each do |dish|
      if courses[(dish.category.to_s + "s").to_sym] == nil
        courses[(dish.category.to_s + "s").to_sym] = [dish.name]
      else
        courses[(dish.category.to_s + "s").to_sym] << dish.name
      end
    end

    courses.each do |category, names|
      names.sort!
    end

    courses
  end

end
