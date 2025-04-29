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
