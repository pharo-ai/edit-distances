"
The Manhattan distance is the absoulte sum off all the distances between coordinates.

More info: [Manhattan distance](https://computervision.fandom.com/wiki/Manhattan_distance)
"
Class {
	#name : #AIManhattanDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AIManhattanDistance class >> distanceBetween: anObject and: anotherObject [

	^ anObject manhattanDistanceTo: anotherObject
]
