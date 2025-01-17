"
The Euclidean distance between two points in Euclidean space is the length of a line segment between the two points. It can be calculated from the Cartesian coordinates of the points using the Pythagorean theorem, therefore occasionally being called the Pythagorean distance.

More info on: [Euclidean distance](https://en.wikipedia.org/wiki/Euclidean_distance) 
"
Class {
	#name : 'AIEuclideanDistance',
	#superclass : 'AIAbstractEditDistance',
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'api' }
AIEuclideanDistance >> distanceBetween: firstPoint and: secondPoint [
	"It follows the Euclidean distance between two points formula"

	^ (firstPoint asPMVector - secondPoint asPMVector) norm
]
