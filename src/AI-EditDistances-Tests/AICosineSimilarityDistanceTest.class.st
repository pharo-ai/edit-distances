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

	self assert: (cosineDistance distanceBetween: #(3 45 7 2) and: #(2 54 13 15)) closeTo: 0.9722842517123499
]

{ #category : '*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testZeroVectors [

	"Checks that the Cosine Similarity between zero vectors returns 1.0 or is handled gracefully."
	self should: [ metric distanceBetween: #(0 0 0) and: #(0 0 0) ] raise: Error.
]

{ #category : '*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testIdenticalVectors [

	"Checks that the Cosine Similarity between identical vectors is 1.0."
	self assert: (cosineDistance distanceBetween: #(1 2 3) and: #(1 2 3)) equals: 1.0
]

{ #category : '*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testOrthogonalVectors [

	"Checks that the Cosine Similarity between orthogonal vectors is 0.0."
	self assert: (cosineDistance distanceBetween: #(1 0) and: #(0 1)) closeTo: 0.0
]

{ #category : '*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testDifferentLengths [

	"Checks that an error is raised for collections of different lengths."
	self should: [ cosineDistance distanceBetween: #(1 2) and: #(1 2 3) ] raise: Error
]

{ #category : '*AI-EditDistances-Tests' }
AICosineSimilarityDistanceTest >> testNonNumericInputs [

	"Checks that an error is raised for non-numeric inputs."
	self should: [ cosineDistance distanceBetween: #(1 'a' 3) and: #(1 2 3) ] raise: Error
]