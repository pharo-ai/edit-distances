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
