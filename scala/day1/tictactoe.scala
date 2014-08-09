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
		game.foreach { row => if (TicTacToe.isRowWinner(row)) return (true) }
		if (isRowWinner(for (row <- game) yield row(0) )) return (true)
		if (isRowWinner(for (row <- game) yield row(1) )) return (true)
		if (isRowWinner(for (row <- game) yield row(2) )) return (true)

		var i = 0
		val diaglr = for (row <- game) yield { 
			i += 1
			row(i - 1)
		}

		if (isRowWinner(diaglr)) return (true)

		i = 2
		val diagrl = for (row <- game) yield { 
			i -= 1
			row(i + 1)
		}
		if (isRowWinner(diagrl)) return true

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

  	it should "be over if there are three-of-a-kind in a diagonal" in {
  		var game = Array(Array("o","x","o"),Array("","o","x"),Array("","x","o"))
    	TicTacToe.isGameOver(game) should be (true)
    	game = Array(Array("o","x","x"),Array("","x",""),Array("x","",""))
    	TicTacToe.isGameOver(game) should be (true)
  	}
}