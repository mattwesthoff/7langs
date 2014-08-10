import censor._

class Impl extends censor.Censor

val replacements = (for (line <- scala.io.Source.fromFile("replacements.txt").getLines) yield (line.split(" ")(0) -> line.split(" ")(1))).toMap 
val text = scala.io.Source.fromFile("text.txt").mkString

val result = (new Impl()).censorMap(replacements, text)
println(result)