"
The overlap coefficient,[1] or Szymkiewicz–Simpson coefficient, is a similarity measure that measures the overlap between two finite sets.

More info: [Overlap coefficient](https://en.wikipedia.org/wiki/Overlap_coefficient)
"
Class {
	#name : #AISzymkiewiczSimpsonDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AISzymkiewiczSimpsonDistance class >> distanceBetween: aSet and: anotherSet [

	^ aSet szymkiewiczSimpsonDistanceTo: anotherSet
]
