import org.scalatest._

//use fold left to compute the total size of a list of strings
object Sizer {
	def sizeOfListOfStrings(list : List[String]) : Int = list.foldLeft(0)( (sum, i) => sum + i.length)
}

class SizerSpec extends FlatSpec with Matchers {
	"ListSizer" should "correctly compute number of total chars in strings" in {
		sizeOfListOfStrings(List("today","things","on","words","pizza")) should be (23)
	}
}

println(Sizer.sizeOfListOfStrings(List("hi","something")))


// write a censor trait with a method that will replace the curse words shoot and darn with pucky and beans alternatives. use a map to store the curse words and their alternatives.
//load the word map from a file


