// write a censor trait with a method that will replace the curse words shoot and darn with pucky and beans alternatives. use a map to store the curse words and their alternatives.
//load the word map from a file
package censor {
	trait Censor {
		def censor(text : String) : String = {
			return text.replace("shoot","pucky").replace("darn","beans")
		}

		def censorMap(replacements : Map[String, String], text: String) : String = {
			return replacements.foldLeft(text)((text, replacement) => text.replace(replacement._1, replacement._2))
		}
	}
}