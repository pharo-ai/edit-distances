Class {
	#name : 'AIEuclideanDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'metric'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AIEuclideanDistanceTest >> setUp [

	super setUp.
	metric := AIEuclideanDistance new
]

{ #category : '*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceFourDimensions [

	self assert: (metric distanceBetween: #(0 3 4 5) and: #(7 6 3 -1)) closeTo: 9.74679434481
]

{ #category : '*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceThreeDimensions [

	self
		assert: (metric distanceBetween: #( -5.1 4 -3.1 ) and: #( 4 5.9 -2.2 ))
		closeTo: 9.339700209321496
]

{ #category : '*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceTwoDimensions [

	self
		assert: (metric distanceBetween: #( -3.54 7 ) and: #( -11.64 9.9 ))
		closeTo: 8.603487664894978.

	self
		assert: (metric distanceBetween: #( 0 1 ) and: #( 1 0))
		closeTo: 2 sqrt
]

{ #category : '*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEmptyCollections [

	"Tests that the Euclidean distance between two empty collections is 0."
	self assert: (metric distanceBetween: #() and: #()) equals: 0.
]

{ #category : '*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testIdenticalCollections [

	"Tests that the Euclidean distance between identical collections is 0."
	self assert: (metric distanceBetween: #(1 2 3) and: #(1 2 3)) equals: 0.
]

{ #category : '*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testDifferentLengths [

	"Tests that an error is raised for collections of different lengths."
	self should: [ metric distanceBetween: #(1 2) and: #(1 2 3) ] raise: Error.
]

{ #category : '*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testNonNumericInputs [

	"Tests that an error is raised for non-numeric inputs."
	self should: [ metric distanceBetween: #(1 'a' 3) and: #(1 2 3) ] raise: Error.
]