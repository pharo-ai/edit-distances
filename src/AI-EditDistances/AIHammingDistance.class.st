"
The Hamming distance counts the differences between two collections. It can be a collecion of numbers or strings
"
Class {
	#name : #AIHammingDistance,
	#superclass : #AIAbstractEditDistance,
	#instVars : [
		'p'
	],
	#category : #'AI-EditDistances-Distances'
}

{ #category : #api }
AIHammingDistance >> distanceBetween: aCollection and: anotherCollection [

	^ (1 to: aCollection size) count: [ :i | (aCollection at: i) ~= (anotherCollection at: i) ]
]
