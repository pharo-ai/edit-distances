Class {
	#name : 'AIManhattanDistanceTest',
	#superclass : 'TestCase',
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'tests' }
AIManhattanDistanceTest >> testManhattanDistanceTo [

	| metric |
	metric := AIManhattanDistance new.
	
	self assert: (metric distanceBetween: #( 10 20 10 ) and: #( 10 20 20 ) ) equals: 10
]

{ #category : 'tests' }
AIManhattanDistanceTest >> testEmptyCollections [
	"Checks that the Manhattan distance between empty collections is 0."
	
	| metric |
	metric := AIManhattanDistance new.
	self assert: (metric distanceBetween: #() and: #()) equals: 0
]

{ #category : 'tests' }
AIManhattanDistanceTest >> testIdenticalCollections [
	"Checks that the Manhattan distance between identical collections is 0."
	
	| metric |
	metric := AIManhattanDistance new.
	self assert: (metric distanceBetween: #(1 2 3) and: #(1 2 3)) equals: 0
]

{ #category : 'tests' }
AIManhattanDistanceTest >> testNegativeNumbers [
	"Checks Manhattan distance with negative numbers."
	
	| metric |
	metric := AIManhattanDistance new.
	self assert: (metric distanceBetween: #(-1 2 -3) and: #(1 -2 3)) equals: 12
]

{ #category : 'tests' }
AIManhattanDistanceTest >> testFloatingPointNumbers [
	"Checks Manhattan distance with floating-point numbers."
	
	| metric |
	metric := AIManhattanDistance new.
	self assert: (metric distanceBetween: #(1.5 2.5) and: #(0.5 0.5)) equals: 3.0
]