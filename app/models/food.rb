class Food
  attr_reader :ndbnumber, :name, :food_group, :data_source, :manufacturer

  def initialize(attributes)
    @ndbnumber = attributes[:ndbno]
    @name = attributes[:name]
    @food_group = attributes[:group]
    @data_source = attributes[:ds]
    @manufacturer = attributes[:manu]
  end
end
