"base division, 4/0 = #{4/0}" interpolate println
Number setSlot("division", Number getSlot("/"))
Number setSlot("/", method(d, if(d == 0, 0, self division(d))))
"new division on Number, 4/0 = #{4/0}" interpolate println
"just to prove we didn't break regular division, 12/3 = #{12/3}" interpolate println
