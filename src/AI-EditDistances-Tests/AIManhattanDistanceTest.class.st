Class {
	#name : #AIManhattanDistanceTest,
	#superclass : #TestCase,
	#category : #'AI-EditDistances-Tests'
}

{ #category : #tests }
AIManhattanDistanceTest >> testDistanceToUsingAIManhattanDistance [

	| result actual |
	result := #( 10 20 10 )
		distanceTo: #( 10 20 20 )
		using: AIManhattanDistance new.
	actual := 10.
	self assert: (result closeTo: actual)
]

{ #category : #tests }
AIManhattanDistanceTest >> testManhattanDistanceTo [

	| result actual metric |
	metric := AIManhattanDistance new.
	result := metric distanceBetween: #( 10 20 10 ) and: #( 10 20 20 ).
	actual := 10.
	self assert: (result closeTo: actual)
]
