"
The overlap coefficient, or Szymkiewicz–Simpson coefficient, is a similarity measure that measures the overlap between two finite sets.

More info: [Overlap coefficient](https://en.wikipedia.org/wiki/Overlap_coefficient)
"
Class {
	#name : 'AISzymkiewiczSimpsonDistance',
	#superclass : 'AIAbstractEditDistance',
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'api' }
AISzymkiewiczSimpsonDistance >> distanceBetween: aSet and: anotherSet [

	| intersection minSize |
	intersection := (aSet intersection: anotherSet ) size.
	minSize := aSet size min: anotherSet size.
	^ (intersection / minSize) asFloat
]
