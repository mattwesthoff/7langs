; find a queue impl that blocks when the queue is empty and waits for a new item
; user refs to create a vector of accounts in memory. create debit and credit funcs to change the balance of an accounts
; sleeping barber - write a multithreaded program to determine how many haircuts a barber can give in ten seconds
	; a barber shop takes customers
	; customers arrive at random intervals, from 10 - 30 ms
	; barber shop has three chairs in the waiting room
	; one barber and one barber chair
	; when the barber's chair is empty a customer sits in the chair, wakes up the barber and gets a haircut
	; if the chairs are fill all new customers turn away
	; haircuts take 20 ms
	; after a customer receives a haircut he gets up a leaves