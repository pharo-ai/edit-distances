"
The Euclidean distance between two points in Euclidean space is the length of a line segment between the two points. It can be calculated from the Cartesian coordinates of the points using the Pythagorean theorem, therefore occasionally being called the Pythagorean distance.

More info on: [Euclidean distance](https://en.wikipedia.org/wiki/Euclidean_distance) 
"
Class {
	#name : #AIEuclideanDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #api }
AIEuclideanDistance >> distanceBetween: firstPoint and: secondPoint [

	"It follows the Euclidean distance between two points formula.
	The code is not idiomatic because of performance. We see that writting this instead of 
	(firstPoint - secondPoint raisedTo: 2) sum sqrt"

	| sum |
	sum := 0.0.
	1 to: firstPoint size do: [ :i | 
		| diff |
		diff := (firstPoint at: i) asFloat - (secondPoint at: i) asFloat.
		sum := sum + (diff * diff) ].
	^ sum sqrt
]
