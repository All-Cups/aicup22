require './model/unit_order'

module Model

# Player's (team's) orders
class Order
    # Orders for each of your units
    attr_accessor :unit_orders

    def initialize(unit_orders)
        @unit_orders = unit_orders
    end

    # Read Order from input stream
    def self.read_from(stream)
        unit_orders = Hash.new
        stream.read_int().times do |_|
            unit_orders_key = stream.read_int()
            unit_orders_value = Model::UnitOrder.read_from(stream)
            unit_orders[unit_orders_key] = unit_orders_value
        end
        Order.new(unit_orders)
    end

    # Write Order to output stream
    def write_to(stream)
        stream.write_int(@unit_orders.length())
        @unit_orders.each do |unit_orders_key, unit_orders_value|
            stream.write_int(unit_orders_key)
            unit_orders_value.write_to(stream)
        end
    end

    def to_s
        string_result = "Order { "
        string_result += "unit_orders: "
        string_result += "{ "
        unit_orders_index = 0
        @unit_orders.each do |unit_orders_key, unit_orders_value|
            if unit_orders_index != 0
                string_result += ", "
            end
            string_result += unit_orders_key.to_s
            string_result += " => "
            string_result += unit_orders_value.to_s
            unit_orders_index += 1
        end
        string_result += " }"
        string_result += " }"
        string_result
    end

    def to_str
        to_s
    end
end

end