def range (start,last)
  array = []
  (start).upto(last) do |number|
    array << number
  end
  array
end

def range_recurse (start,last)
  return [] if start > last
  return [start] + range_recurse(start+1,last) if start<=last
end

def exp(num, power)
  return num if power == 1
  num * exp(num, power -1)
end

def exp2(num, power)
  return 1 if power == 0
  return num if power == 1
  return num * num if power == 2
  if num.even?
    exp2(num, power/2) ** 2
  elsif num.odd?
    num * (exp2(num, (power -1) / 2) ** 2)
  end
end


def deep_copy(arr)
  duped = []
  return [] if arr.empty?
  if !arr.empty?
    arr.each do |el|
      if el.is_a?(Array)
        duped << deep_copy(el)
      else
      duped << el
      end
    end
  end
  duped
end
#
# def fib(num)
#   arr = []
#   return arr if num == 1
#   return arr << 1 if num == 1
#   if num == 2
#     arr << 1
#     fib(num-1)
#   else
#     arr << fib(num-1) + (num - 2)
#   end
#   arr
# end
# #
#
# fib(3)
#
# fib(2) + fib(1)
# 1 , 1 , 2 , 3 , 5


def fib (num)
  arr = []

  (0).upto(num-1) do |idx|
    if idx == 0
      arr << 1
    elsif idx == 1
      arr << 1
    else
      arr << (arr[idx-2] + arr[idx-1])
    end
  end
  arr
end

def fib(num)
  return [1] if (0..1).include?(num)
  return [1,1] if num == 2
  # return [number_before. current_number]
  # concat to another call of fib
  old_results = fib(num-1) #[1,1]
  second_last = old_results[-2] #1
  last = old_results.last #1
  sum = second_last + last #2
  old_results << sum #[1,1,2]
  # take last results
  # grab last two elements
  # add two elements together
  # add that sum to old results
end




# ([1,2,3,4],5)
#([2,3],3)
def bsearch(array,target)
  return nil if array.count == 0
  sorted = array.sort
  half = (sorted.length)/2
  if sorted[half] == target
    half
  elsif sorted[half] > target
    bsearch(sorted[0...half],target)
  elsif sorted[half] < target
    new_array = sorted[(half+1)..sorted.count]
    result = bsearch(new_array,target)
    (result.nil?) ? nil : (half+1) + result
  end

end




end
