Class {
	#name : 'AICosineSimilarityDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'cosineDistance'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AICosineSimilarityDistanceTest >> setUp [

	super setUp.
	cosineDistance := AICosineSimilarityDistance new
]

{ #category : '*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testCosineSimilarityDistanceTo [

	self assert: (cosineDistance distanceBetween: #(3 45 7 2) and: #(2 54 13 15)) closeTo: 0.9722
]
