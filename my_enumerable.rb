module MyEnumerable
  def all?
    self.each { |item| return false unless yield(item) }
    true
  end

  def any?
    self.each { |item| return true if yield(item) }
    false
  end

  def filter
    result = []
    self.each { |item| result << item if yield(item) }
    result
  end
end
