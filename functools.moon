
map = (fn, a) -> [fn x for _, x in ipairs a]

reduce = (fn, array, initial)->
   local result

   if #array == 0
      if initial != nil
         return initial
      else
         error "Attempted reduce of empty array"
   else if #array == 1
      if initial != nil
         result = fn array[1], initial
      else
         result = array[1]
      return reduce fn, {}, result
   else
      if initial != nil
         result = fn initial, array[1]
         array = [item for item in *array[2,]]
      else
         result = fn array[1], array[2]
         array = [item for item in *array[3,]]

      return reduce(fn, array, result)

print reduce ((a,b)->a+b), (map ((x) -> x*x), {1,2,3})
