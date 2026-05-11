"
The Manhattan distance is defined as the first norm of the difference of two vectors. This is the absoulte sum of the difference of each coordinate.

More info: [Manhattan distance](https://computervision.fandom.com/wiki/Manhattan_distance)
"
Class {
	#name : 'AIManhattanDistance',
	#superclass : 'AIAbstractEditDistance',
	#category : 'AI-Manhattan-Distance-Distances',
	#package : 'AI-Manhattan-Distance',
	#tag : 'Distances'
}

{ #category : 'api' }
AIManhattanDistance >> distanceBetween: anArray and: anotherArray [

	^ (anArray asPMVector - anotherArray asPMVector) firstNorm
]
