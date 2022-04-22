Class {
	#name : #AIRestrictedDamerauLevenshteinDistanceTest,
	#superclass : #TestCase,
	#category : #'AI-EditDistances-Tests'
}

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testDistanceToUsingAIRestrictedDamerauLevenshteinDistance [

	| result actual |
	result := 'zork' distanceTo: 'fork' using: AIRestrictedDamerauLevenshteinDistance new.
	actual := 1.
	self assert: result equals: actual
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceCaseSensitive [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := 'honda'.

	actual := firstString restrictedDamerauLevenshteinDistanceTo: secondString.
	expected := 5.

	self assert: actual equals: expected
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceEmptyStrings [

	| firstString secondString expected actual |
	firstString := ''.
	secondString := ''.

	actual := firstString restrictedDamerauLevenshteinDistanceTo:  secondString.
	expected := 0.

	self assert: actual equals: expected
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceNoPermutation [

	| firstString secondString expected actual |
	firstString := 'AZ'.
	secondString := 'ZA'.

	actual := firstString restrictedDamerauLevenshteinDistanceTo: secondString.
	expected := 2.

	self assert: actual equals: expected
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceOneReplace [

	| firstString secondString expected actual |
	firstString := 'A'.
	secondString := 'Z'.

	actual := firstString restrictedDamerauLevenshteinDistanceTo: secondString.
	expected := 1.

	self assert: actual equals: expected
]

{ #category : #tests }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceRemoveAll [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := ''.

	actual := firstString restrictedDamerauLevenshteinDistanceTo: secondString.
	expected := 5.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTransposition [

	| firstString secondString expected actual |
	firstString := 'a cat'.
	secondString := 'an act'.

	actual := firstString restrictedDamerauLevenshteinDistanceTo: secondString.
	expected := 2.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AIRestrictedDamerauLevenshteinDistanceTest >> testRestrictedDamerauDistanceTwoAddOneReplace [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := 'HYUNDAI'.

	actual := firstString restrictedDamerauLevenshteinDistanceTo: secondString.
	expected := 3.

	self assert: actual equals: expected
]
