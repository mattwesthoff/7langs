import org.scalatest._

//use fold left to compute the total size of a list of strings
object Sizer {
	def sizeOfListOfStrings(list : List[String]) : Int = list.foldLeft(0)( (sum, i) => sum + i.length)
}

class SizerSpec extends FlatSpec with Matchers {
	"ListSizer" should "correctly compute number of total chars in strings" in {
		Sizer.sizeOfListOfStrings(List("today","things","on","words","pizza")) should be (23)
	}
}