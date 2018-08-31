class LRUCache < Array
  attr_reader :cache, :size
  def initialize(cache_size)
    @size = cache_size
    @cache = []
  end

  def add(object)
    index_of_obj = self.checkCache(object)
    if index_of_obj
      self.remove_from_cache(index_of_obj)
      self << object
      return self, "asd"
    end

    if self.length >= @size
      self.shift unless self.empty?
      self << object
    else
      self << object
    end
  end

  def show
    print self
  end

  def count
    self.size
  end

  #private

  def checkCache(object)
    self.each_with_index do |el,i|
      if el == object
        return i
      end
    end
    return nil
  end

  def remove_from_cache(index)
    self.delete_at(index)
  end
end

if __FILE__ == $PROGRAM_NAME
  johnny_cache = LRUCache.new(4)
  johnny_cache.add("I walk the line")
  johnny_cache.add(5)
  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})
  p johnny_cache
end
