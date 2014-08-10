import org.scalatest._

sealed abstract class result
case object X extends result
case object O extends result
case object Draw extends result
case object Ongoing extends result

object TicTacToe {
	def isGroupWinner(group : Array[String]) : result = {
		group.groupBy(i => i).map(t => (t._1, t._2.length)).foreach { p => p._1 match {
				case "x" => if (p._2 == group.length) return X
				case "o" => if (p._2 == group.length) return O
				case "" => return Ongoing
				case _ =>
			}
		}
		return Draw
	}

	def isGameOver(game : Array[Array[String]]) : result = {

		var checks = game
		val boardRange = (0 until game.length).toArray
		for (i <- boardRange) {
			checks +:= (for (row <- game) yield row(i))  //columns
		}

		checks +:= (for (i <- boardRange) yield game(i)(i))
		checks +:= (for (i <- boardRange) yield game(i)(game.length - 1 - i))

		var draw = true
		checks.foreach { 
			row => {
				TicTacToe.isGroupWinner(row) match {
					case X => return X
					case O => return O
					case Ongoing => draw = false
					case Draw => 
				}
			}
		}

		if (draw) return Draw else Ongoing
	}
}

class TicTacToeSpec extends FlatSpec with Matchers {
	"A Game" should "not be over if it's empty" in {
		var game = Array(Array("","",""),Array("","",""),Array("","",""))
		TicTacToe.isGameOver(game) should be (Ongoing)
	}

	it should "not be over if no one has one and there are still moves" in {
		var game = Array(Array("o","x","o"),Array("x","x","o"),Array("x","",""))
		TicTacToe.isGameOver(game) should be (Ongoing)
	}

	it should "be over if there are three x's in a row" in {
    	var game = Array(Array("","",""),Array("x","x","x"),Array("","",""))
    	TicTacToe.isGameOver(game) should be (X)
  	}

  	it should "be over if there are three o's in a row" in {
  		var game = Array(Array("","",""),Array("","",""),Array("o","o","o"))
    	TicTacToe.isGameOver(game) should be (O)
  	}

  	it should "be over if there are three x's in a column" in {
  		var game = Array(Array("o","x","o"),Array("","x","x"),Array("o","x","o"))
    	TicTacToe.isGameOver(game) should be (X)
  	}

  	it should "be over if there are three-of-a-kind in a diagonal" in {
  		var game = Array(Array("o","x","o"),Array("","o","x"),Array("","x","o"))
    	TicTacToe.isGameOver(game) should be (O)
    	game = Array(Array("o","x","x"),Array("","x",""),Array("x","",""))
    	TicTacToe.isGameOver(game) should be (X)
  	}

  	it should "be a draw if no one won but no empty spaces" in {
  		var game = Array(Array("x","o","x"),Array("o","x","o"),Array("o","x","o"))
  		TicTacToe.isGameOver(game) should be (Draw)
  	}
}