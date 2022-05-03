Class {
	#name : #AIDamerauLevenshteinDistanceTest,
	#superclass : #TestCase,
	#instVars : [
		'levenshteinRestricted',
		'damerauLevenshtein'
	],
	#category : #'AI-EditDistances-Tests'
}

{ #category : #running }
AIDamerauLevenshteinDistanceTest >> setUp [

	super setUp.
	damerauLevenshtein := AIDamerauLevenshteinDistance new
]

{ #category : #tests }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceCaseSensitive [

	self assert: (damerauLevenshtein distanceBetween: 'HONDA' and: 'honda') equals: 5.
]

{ #category : #tests }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceEmptyStrings [

	self assert: (damerauLevenshtein distanceBetween: '' and: '') equals: 0.
	

]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneAddOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'a abct' and: 'a cat') equals: 2.
]

{ #category : #tests }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneReplace [

	self assert: (damerauLevenshtein distanceBetween: 'A' and: 'Z') equals: 1.
]

{ #category : #tests }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'AZ' and: 'ZA') equals: 1.
]

{ #category : #tests }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceRemoveAll [
	
	self assert: (damerauLevenshtein distanceBetween: 'HONDA' and: '') equals: 5.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTowReplaceOneAddOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'HONDA' and: 'HYUNADI') equals: 4.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoAdd [

	self assert: (damerauLevenshtein distanceBetween: 'agag' and: 'aggaag') equals: 2.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapThreeReplace [

	self assert: (damerauLevenshtein distanceBetween: 'agaaloli' and: 'gananail') equals: 5.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapTwoReplace [

	self assert: (damerauLevenshtein distanceBetween: 'hannah' and: 'nahhan') equals: 4.
]

{ #category : #'*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDistanceToUsingAIDamerauLevenshteinDistance [


	self assert: (damerauLevenshtein distanceBetween: 'zork' and: 'fork') equals: 1.

]

{ #category : #tests }
AIDamerauLevenshteinDistanceTest >> testFillFirstTwoRowsAndColumnsMaxDistance [

	| max result |
	damerauLevenshtein distanceMatrix: (Array2D rows: 5 columns: 5).
	max := 100.
	result := Array2D new.
	result rows: 5 columns: 5 contents:
		{ { max . max . max . max . max } .
		  { max . 0 . 1 . 2 . 3 } . 
		  { max . 1 . nil . nil . nil } .
		  { max . 2 . nil . nil . nil } .
		  { max . 3 . nil . nil . nil } } flattened.
	damerauLevenshtein fillFirstTwoRowsAndColumnsMaxDistance: max.
	self assert: damerauLevenshtein distanceMatrix equals: result
]
