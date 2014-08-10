import scala.io._
import akka.actor.{Actor, ActorRef, ActorSystem, Props}

object PageLoader {
	def getPageSize(url: String) = Source.fromURL(url).mkString.length
}

class SizerActor(listener : ActorRef) extends Actor {
	val shutdownListener = listener
	def receive = {
		case (url, size) => println("Size for " + url + ": " + size)
		shutdownListener ! ""
	}
}

class ShutdownListener extends Actor {
	var current = 0
	val max = 4
	def receive = {
		case _ => {
			current += 1
			if (current >= max) context.system.shutdown()
		}
	}
}

object Main extends App {
	var urls = List(
		"http://www.twitter.com/",
		"http://www.google.com/",
		"http://www.cnn.com/")

	val system = ActorSystem()
	val shutdownListener = system.actorOf(Props[ShutdownListener], name = "shutdownListener")

	def timeMethod(method : () => Unit) = {
		val start = System.nanoTime
		method()
		val end = System.nanoTime
		println("Method took " + (end-start)/1000000000.0 + " seconds.")
	}

	def getPageSizeSequentially() = {
		for (url <- urls) {
			println(url)
			println("Size for " + url + ": " + PageLoader.getPageSize(url))
		}
	}

	def getPageSizeConcurrently() = {
		for (url <- urls) {
			val sizerActor = system.actorOf(Props(new SizerActor(shutdownListener)), name = "sizer" + url.replace("http://www.","").replace(".com/",""))
			sizerActor ! (url, PageLoader.getPageSize(url))
		}
	}

	def getPageSizeConcurrentlyOneActor() = {
		val sizerActor = system.actorOf(Props(new SizerActor(shutdownListener)), name = "sizer")
		for (url <- urls) {
			sizerActor ! (url, PageLoader.getPageSize(url))
		}
	}

	println("Sequential run:")
	timeMethod { getPageSizeSequentially }

	println("Concurrent run")
	timeMethod { getPageSizeConcurrently }

	println("One actor concurrent")
	timeMethod { getPageSizeConcurrentlyOneActor}
}

