Class {
	#name : #AIRestrictedDamerauLevenshteinDistanceTest,
	#superclass : #TestCase,
	#instVars : [
		'levenshteinRestricted'
	],
	#category : #'AI-EditDistances-Tests'
}

{ #category : #running }
AIRestrictedDamerauLevenshteinDistanceTest >> setUp [

	super setUp.
	levenshteinRestricted := AIRestrictedDamerauLevenshteinDistance new
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testDistanceToUsingAIRestrictedDamerauLevenshteinDistance [

	| result actual |
	result := levenshteinRestricted distanceBetween: 'zork' and: 'fork'.
	actual := 1.
	self assert: result equals: actual
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceCaseSensitive [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := 'honda'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 5.

	self assert: actual equals: expected
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceEmptyStrings [

	| firstString secondString expected actual |
	firstString := ''.
	secondString := ''.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 0.

	self assert: actual equals: expected
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceNoPermutation [

	| firstString secondString expected actual |
	firstString := 'AZ'.
	secondString := 'ZA'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 1.

	self assert: actual equals: expected
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceOneReplace [

	| firstString secondString expected actual |
	firstString := 'A'.
	secondString := 'Z'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 1.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceOneSwapTwoAdd [

	| firstString secondString expected actual |
	firstString :=  'agag'.
	secondString := 'aggaag'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 2.

	self assert: actual equals: expected
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceRemoveAll [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := ''.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 5.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTowReplaceOneAddOneSwap [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := 'HYUNADI'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 4.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTransposition [

	| firstString secondString expected actual |
	firstString := 'an act'.
	secondString := 'a cat'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 2.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoSwapThreeReplace [

	| firstString secondString expected actual |
	firstString := 'agaaloli'.
	secondString := 'gananail'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 5.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoSwapTwoReplace [

	| firstString secondString expected actual |
	firstString :=  'hannah'.
	secondString := 'nahhan'.

	actual := levenshteinRestricted distanceBetween: firstString and: secondString.
	expected := 4.

	self assert: actual equals: expected
]
