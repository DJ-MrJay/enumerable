require_relative 'my_enumerable'

class MyList
  include MyEnumerable

  attr_accessor :list

  def initialize(*args)
    @list = args.flatten
  end

  def each
    index = 0
    while index < @list.length
      yield @list[index]
      index += 1
    end
  end
end

# Tests

list = MyList.new(1, 2, [3, 4], 5, [6, [7, 8]])

puts "all?: #{list.all? { |item| item > 0 }}" # all?: true
puts "any?: #{list.any? { |item| item > 5 }}" # any?: true
puts "filter: #{list.filter { |item| item.even? }}" # filter: [2, 4, 6, 8]
