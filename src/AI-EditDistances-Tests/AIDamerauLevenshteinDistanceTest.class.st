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
	damerauLevenshtein distanceMatrix: (CTArray2D width: 5 height: 5).
	max := 10.
	
	result := CTArray2D width: 5 height: 5.
	result atAllPut: nil.
	
	1 to: 5 do: [:i | 
		result atColumn: 1 atRow: i put: max.
		result atColumn: i atRow: 1 put: max.
	].
	
	result atColumn: 2 atRow: 2 put: 0.
	result atColumn: 3 atRow: 2 put: 1.
	result atColumn: 4 atRow: 2 put: 2.
	result atColumn: 5 atRow: 2 put: 3.
	
	result atColumn: 2 atRow: 3 put: 1.
	result atColumn: 2 atRow: 4 put: 2.
	result atColumn: 2 atRow: 5 put: 3.
	
	damerauLevenshtein fillFirstTwoRowsAndColumnsWith: 'AAAAA' and: 'BBBBB'.
	self assert: damerauLevenshtein distanceMatrix equals: result
]
