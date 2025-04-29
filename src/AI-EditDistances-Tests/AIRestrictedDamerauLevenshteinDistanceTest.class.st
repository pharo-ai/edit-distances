Class {
	#name : 'AIRestrictedDamerauLevenshteinDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'levenshteinRestricted'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AIRestrictedDamerauLevenshteinDistanceTest >> setUp [

	super setUp.
	levenshteinRestricted := AIRestrictedDamerauLevenshteinDistance new
]

{ #category : '*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testDistanceToUsingAIRestrictedDamerauLevenshteinDistance [


	self assert: (levenshteinRestricted distanceBetween: 'zork' and: 'fork') equals: 1.

]

{ #category : 'tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceCaseSensitive [

	self assert: (levenshteinRestricted distanceBetween: 'HONDA' and: 'honda') equals: 5.
]

{ #category : 'tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceEmptyStrings [

	self assert: (levenshteinRestricted distanceBetween: '' and: '') equals: 0.
	

]

{ #category : '*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceOneAddOneSwap [

	self assert: (levenshteinRestricted distanceBetween: 'an act' and: 'a cat') equals: 2.
]

{ #category : 'tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceOneReplace [

	self assert: (levenshteinRestricted distanceBetween: 'A' and: 'Z') equals: 1.
]

{ #category : 'tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceOneSwap [

	self assert: (levenshteinRestricted distanceBetween: 'AZ' and: 'ZA') equals: 1.
]

{ #category : 'tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceRemoveAll [
	
	self assert: (levenshteinRestricted distanceBetween: 'HONDA' and: '') equals: 5.
]

{ #category : '*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoAdds [

	self assert: (levenshteinRestricted distanceBetween: 'agag' and: 'aggaag') equals: 2.
]

{ #category : '*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoReplacesOneAddOneSwap [

	self assert: (levenshteinRestricted distanceBetween: 'HONDA' and: 'HYUNADI') equals: 4.
]

{ #category : '*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoSwapsThreeReplaces [

	self assert: (levenshteinRestricted distanceBetween: 'agaaloli' and: 'gananail') equals: 5.
]

{ #category : '*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoSwapsTwoReplaces [

	self assert: (levenshteinRestricted distanceBetween: 'hannah' and: 'nahhan') equals: 4.
]
