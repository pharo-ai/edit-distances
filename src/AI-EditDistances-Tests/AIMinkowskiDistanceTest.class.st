Class {
	#name : 'AIMinkowskiDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'levenshteinRestricted',
		'damerauLevenshtein',
		'metric'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AIMinkowskiDistanceTest >> setUp [

	super setUp.
	metric := AIMinkowskiDistance p: 3
]

{ #category : 'tests' }
AIMinkowskiDistanceTest >> testDistance2WithP3 [

	metric p: 3.
	self
		assert: (metric distanceBetween: #( 0 2 3 4 ) and: #( 2 4 3 7 ))
		closeTo: 3.503398060386724
]

{ #category : 'tests' }
AIMinkowskiDistanceTest >> testDistanceWithP2 [

	metric p: 2.
	self
		assert: (metric distanceBetween: #( 1 4 7 12 23 ) and: #( 2 5 6 10 20 ))
		closeTo: 4.0
]

{ #category : 'tests' }
AIMinkowskiDistanceTest >> testDistanceWithP3 [

	metric p: 3.
	self
		assert: (metric distanceBetween: #( 1 2 3 4 5 6 ) and: #( 7 8 9 10 11 12 ))
		closeTo: 10.902723556992836
]
