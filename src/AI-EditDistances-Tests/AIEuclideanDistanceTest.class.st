Class {
	#name : #AIEuclideanDistanceTest,
	#superclass : #TestCase,
	#category : #'AI-EditDistances-Tests'
}

{ #category : #'*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceTo [

	| metric |
	
	metric := AIEuclideanDistance new.
	self assert: (metric distanceBetween: #(0 3 4 5) and: #(7 6 3 -1)) closeTo: 9.74679434481
]

{ #category : #'*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceTwoDimentional [

	| metric |
	metric := AIEuclideanDistance new.
	self assert: (metric distanceBetween: #( 0 1 ) and: #( 1 0 )) closeTo: 2 sqrt
]
