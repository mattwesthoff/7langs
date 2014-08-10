import org.scalatest._

sealed abstract class result
case object x extends result
case object o extends result
case object draw extends result
case object undecided extends result

object TicTacToe {
	def isGroupWinner(row : Array[String]) : result = {
		if (row(0) == "") return (undecided)
		if (row(0) == row(1)) {
			if (row(0) == row(2)) return (x)			
		}
		return (undecided)
	}

	def isGameOver(game : Array[Array[String]]) : Boolean = {

		var checks = game
		val boardRange = (0 until game.length).toArray
		for (i <- boardRange) {
			checks +:= (for (row <- game) yield row(i))  //columns
		}

		checks +:= (for (i <- boardRange) yield game(i)(i))
		checks +:= (for (i <- boardRange) yield game(i)(game.length - 1 - i))

		checks.foreach { row => if (TicTacToe.isGroupWinner(row) != undecided) return (true) }

		return (false)
	}
}

class TicTacToeSpec extends FlatSpec with Matchers {
	"A Game" should "not be over if it's empty" in {
		var game = Array(Array("","",""),Array("","",""),Array("","",""))
		TicTacToe.isGameOver(game) should be (false)
	}

	it should "not be over if no one has one and there are still moves" in {
		var game = Array(Array("o","x","o"),Array("x","x","o"),Array("x","",""))
		TicTacToe.isGameOver(game) should be (false)
	}

	it should "be over if there are three x's in a row" in {
    	var game = Array(Array("","",""),Array("x","x","x"),Array("","",""))
    	TicTacToe.isGameOver(game) should be (true)
  	}

  	it should "be over if there are three o's in a row" in {
  		var game = Array(Array("","",""),Array("","",""),Array("o","o","o"))
    	TicTacToe.isGameOver(game) should be (true)
  	}

  	it should "be over if there are three x's in a column" in {
  		var game = Array(Array("o","x","o"),Array("","x","o"),Array("o","x","o"))
    	TicTacToe.isGameOver(game) should be (true)
  	}

  	it should "be over if there are three-of-a-kind in a diagonal" in {
  		var game = Array(Array("o","x","o"),Array("","o","x"),Array("","x","o"))
    	TicTacToe.isGameOver(game) should be (true)
    	game = Array(Array("o","x","x"),Array("","x",""),Array("x","",""))
    	TicTacToe.isGameOver(game) should be (true)
  	}
}