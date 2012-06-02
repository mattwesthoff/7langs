//could handle sublists like addAll, but eh, I get the point

List myAverage := method(
     total := count := 0;
     self foreach(x, 
     	  if (x type != "Number", Exception raise("#{x} is not a number, all elements must be numbers" interpolate))
     	  total = total + x;
     	  count = count + 1;	  
     )
     total / count
)

list(1,2,3,4,5,6) myAverage println

list(1,5,6,list(5,4),"five") myAverage println
