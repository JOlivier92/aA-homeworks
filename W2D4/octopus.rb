def sluggish_octopus(arr)
  max_size = 0
  index = []
  arr.each_with_index do |el1,i|
    arr.each_with_index do |el2,j|
      delta = el1.length - el2.length
      if delta > max_size
        max_size = delta
        index = [i,j]
      end
    end
  end
  index
end

def clever_octopus(arr)
  max_size = 0
  biggest_fish = ""
  arr.each_with_index do |el|
    if el.length > max_size
      max_size = el.length
      biggest_fish = el
    end
  end
  biggest_fish
end
