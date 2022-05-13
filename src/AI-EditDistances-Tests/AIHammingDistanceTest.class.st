Class {
	#name : #AIHammingDistanceTest,
	#superclass : #TestCase,
	#instVars : [
		'levenshteinRestricted',
		'damerauLevenshtein',
		'metric'
	],
	#category : #'AI-EditDistances-Tests'
}

{ #category : #running }
AIHammingDistanceTest >> setUp [

	super setUp.
	metric := AIHammingDistance new
]

{ #category : #tests }
AIHammingDistanceTest >> testDistanceBinaryNumericVector [

	self
		assert: (metric distanceBetween: #(1 1 0 0 1 0) and: #(0 1 0 0 1 1))
		equals: 2
]

{ #category : #tests }
AIHammingDistanceTest >> testDistanceOnStrings [

	self
		assert: (metric distanceBetween:'aaabbbccc' and: 'avabbbcdd')
		equals: 3
]
