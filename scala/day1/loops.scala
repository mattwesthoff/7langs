def whileLoop {
	var i = 1
	while ( i <= 3) {
		println(i)
		i += 1
	}
}

def forLoop {
	println("java style")
	for (i <- 0 until args.length) {
		println(args(i))
	}
}

def fluentLoop {
	println("for loop, fluent foreach")
	args.foreach { arg => println(arg) }
}
whileLoop
forLoop //command line arguments
fluentLoop
