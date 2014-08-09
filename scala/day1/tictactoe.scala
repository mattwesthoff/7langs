import org.scalatest._

object TicTacToe {
	def isRowWinner(row : Array[String]) : Boolean = {
		if (row(0) == "") return (false)
		if (row(0) == row(1)) {
			if (row(0) == row(2)) return (true)			
		}
		return (false)
	}

	def isGameOver(game : Array[Array[String]]) : Boolean = {
		game.foreach { row => {
			val winner = TicTacToe.isRowWinner(row)
			if (winner == true) return (true)
		}}
		if (isRowWinner(Array(game(0)(0), game(1)(0), game(2)(0)))) return (true)
		if (isRowWinner(Array(game(0)(1), game(1)(1), game(2)(1)))) return (true)
		if (isRowWinner(Array(game(0)(2), game(1)(2), game(2)(2)))) return (true)
		return (false)
	}
}

class TicTacToeSpec extends FlatSpec with Matchers {
	"A Game" should "not be over if it's empty" in {
		var game = Array(Array("","",""),Array("","",""),Array("","",""))
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
}