"
The overlap coefficient, or Szymkiewicz–Simpson coefficient, is a similarity measure that measures the overlap between two finite sets.

More info: [Overlap coefficient](https://en.wikipedia.org/wiki/Overlap_coefficient)
"
Class {
	#name : #AISzymkiewiczSimpsonDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #accessing }
AISzymkiewiczSimpsonDistance >> distanceBetween: aSet and: anotherSet [

	^ aSet szymkiewiczSimpsonDistanceTo: anotherSet
]
