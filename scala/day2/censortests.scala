import org.scalatest._
import censor._

class Impl extends censor.Censor

class CensorSpec extends FlatSpec with Matchers {
	"Censor" should "return a string with no bad words unchanged" in {
		(new Impl()).censor("hey this sentence is fine") should be ("hey this sentence is fine")
	}

	it should "replace all instances of shoot with pucky" in {
		(new Impl()).censor("shoot all the shooting shooters in the shoot") should be ("pucky all the puckying puckyers in the pucky")
	}

	it should "replace all instances of darn with beans" in {
		(new Impl()).censor("darn this darn sunroofed, darn") should be ("beans this beans sunroofed, beans")
	}

	it should "work when passing in a map of words" in {
		val result = (new Impl()).censorMap(Map[String, String]("fart" -> "toots", "twitter" -> "internubs"), "fart this twitter up, fart it up all twittery")
		result should be ("toots this internubs up, toots it up all internubsy")
	}
}