class MyStrategy
  def initialize(constants)
  end

  def get_order(game, debug_interface)
    orders = {}
    game.units.each do |unit|
      next if unit.player_id != game.my_id

      orders[unit.id] = Model::UnitOrder.new(
        Model::Vec2.new(-unit.position.x, -unit.position.y),
        Model::Vec2.new(-unit.direction.y, unit.direction.x),
        Model::ActionOrder::Aim.new(true)
      )
    end

    Model::Order.new(orders)
  end

  def debug_update(displayed_tick, debug_interface)
  end

  def finish()
  end
end
