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
AIEuclideanDistance >> distanceBetween: anObject and: anotherObject [

	^ anObject euclideanDistanceTo: anotherObject
]
