List addAll := method(
     total := 0;
     self foreach(x,
     	  total = total + if(x getSlot("addAll"), 
	  	x addAll, 
		if(x ?asNumber, if(x asNumber isNan not, x asNumber, 0), 0))
	 )
)

list("5",2,list("4",10,"fifty")) addAll println

list(
	list(5,4,3),
	list(9,15,2),
	list(1,4,7)
) addAll println
