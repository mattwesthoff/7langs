(ns day1.oo)

(defprotocol CreepyWizard
	"wizards that are creepy"
	(hide [this] "the wizard hides")
	(smell-bad [this component] "the wizard unleashes a 'component' that smells really bad"))

(defrecord DocWeirdo [] 
	CreepyWizard
	(hide [this] "DocWeirdo hides in a nearby closet!")
	(smell-bad [this component] (str "DocWeirdo reaches in a bag and throws " component " at you!  It smells awful!")))