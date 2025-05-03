Class {
	#name : 'AIDamerauLevenshteinDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'levenshteinRestricted',
		'damerauLevenshtein'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AIDamerauLevenshteinDistanceTest >> setUp [

	super setUp.
	damerauLevenshtein := AIDamerauLevenshteinDistance new
]

{ #category : 'tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceCaseSensitive [

	self assert: (damerauLevenshtein distanceBetween: 'HONDA' and: 'honda') equals: 5.
]

{ #category : 'tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceEmptyStrings [

	self assert: (damerauLevenshtein distanceBetween: '' and: '') equals: 0.
	

]

{ #category : '*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneAddOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'a cat' and: 'a abct') equals: 2.
]

{ #category : 'tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneReplace [

	self assert: (damerauLevenshtein distanceBetween: 'A' and: 'Z') equals: 1.
]

{ #category : 'tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'AZ' and: 'ZA') equals: 1.
]

{ #category : '*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceOneSwapOneDeletion [

	self assert: (damerauLevenshtein distanceBetween: 'abbbc' and: 'cbba') equals: 2.
]

{ #category : 'tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceRemoveAll [
	
	self assert: (damerauLevenshtein distanceBetween: 'HONDA' and: '') equals: 5.
]

{ #category : '*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceThreeSwapsOneDeletion [

	self assert: (damerauLevenshtein distanceBetween: 'abcccabcccde' and: 'cccbabaedcc') equals: 7.
]

{ #category : '*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoReplacesOneAddOneSwap [

	self assert: (damerauLevenshtein distanceBetween: 'HONDA' and: 'HYUNADI') equals: 4.
]

{ #category : '*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapsOneDeletion [

	self assert: (damerauLevenshtein distanceBetween: 'abcba' and: 'baab') equals: 3.
]

{ #category : '*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapsThreeReplaces [

	self assert: (damerauLevenshtein distanceBetween: 'agaaloli' and: 'gananail') equals: 5.
]

{ #category : '*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDamerauDistanceTwoSwapsTwoReplaces [

	self assert: (damerauLevenshtein distanceBetween: 'hannah' and: 'nahhan') equals: 4.
]

{ #category : '*AI-EditDistances-Tests' }
AIDamerauLevenshteinDistanceTest >> testDistanceToUsingAIDamerauLevenshteinDistance [


	self assert: (damerauLevenshtein distanceBetween: 'zork' and: 'fork') equals: 1.

]

{ #category : 'tests' }
AIDamerauLevenshteinDistanceTest >> testFillFirstTwoRowsAndColumns [
	| max result |
	damerauLevenshtein distanceMatrix: (CTArray2D rows: 5 columns: 5).
	max := 10.
	result := CTArray2D rows: 5 columns: 5 contents:
		{ { max . max . max . max . max } .
		  { max . 0 . 1 . 2 . 3 } . 
		  { max . 1 . nil . nil . nil } .
		  { max . 2 . nil . nil . nil } .
		  { max . 3 . nil . nil . nil } } flattened.
	damerauLevenshtein fillFirstTwoRowsAndColumnsWith: 'AAAAA' and: 'BBBBB'.
	self assert: damerauLevenshtein distanceMatrix equals: result
]
