"
The Manhattan distance is the absoulte sum off all the distances between coordinates.

More info: [Manhattan distance](https://computervision.fandom.com/wiki/Manhattan_distance)
"
Class {
	#name : #AIManhattanDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #api }
AIManhattanDistance >> distanceBetween: anArray and: anotherArray [

	^ (anArray  - anotherArray ) abs sum 
]
