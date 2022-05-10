Class {
	#name : #AIEuclideanDistanceTest,
	#superclass : #TestCase,
	#instVars : [
		'metric'
	],
	#category : #'AI-EditDistances-Tests'
}

{ #category : #running }
AIEuclideanDistanceTest >> setUp [

	super setUp.
	metric := AIEuclideanDistance new
]

{ #category : #'*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceFourDimensions [

	self assert: (metric distanceBetween: #(0 3 4 5) and: #(7 6 3 -1)) closeTo: 9.74679434481
]

{ #category : #'*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceThreeDimensions [

	self
		assert: (metric distanceBetween: #( -5.1 4 -3.1 ) and: #( 4 5.9 -2.2 ))
		closeTo: 9.3397
]

{ #category : #'*AI-EditDistances-Tests' }
AIEuclideanDistanceTest >> testEuclideanDistanceTwoDimensions [

	self
		assert: (metric distanceBetween: #( -3.54 7 ) and: #( -11.64 9.9 ))
		closeTo: 8.603488.

	self
		assert: (metric distanceBetween: #( 0 1 ) and: #( 1 0))
		closeTo: 2 sqrt
]
