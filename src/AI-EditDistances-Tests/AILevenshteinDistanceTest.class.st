Class {
	#name : #AILevenshteinDistanceTest,
	#superclass : #TestCase,
	#category : #'AI-EditDistances-Tests'
}

{ #category : #tests }
AILevenshteinDistanceTest >> testDistanceCaseSensitive [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := 'honda'.

	actual := firstString levenshteinDistanceTo: secondString.
	expected := 5.

	self assert: actual equals: expected
]

{ #category : #tests }
AILevenshteinDistanceTest >> testDistanceEmptyStrings [

	| firstString secondString expected actual |
	firstString := ''.
	secondString := ''.

	actual := firstString levenshteinDistanceTo: secondString.
	expected := 0.

	self assert: actual equals: expected
]

{ #category : #tests }
AILevenshteinDistanceTest >> testDistanceNoPermutation [

	| firstString secondString expected actual |
	firstString := 'AZ'.
	secondString := 'ZA'.

	actual := firstString levenshteinDistanceTo: secondString.
	expected := 2.

	self assert: actual equals: expected
]

{ #category : #tests }
AILevenshteinDistanceTest >> testDistanceOneReplace [

	| firstString secondString expected actual |
	firstString := 'A'.
	secondString := 'Z'.

	actual := firstString levenshteinDistanceTo: secondString.
	expected := 1.

	self assert: actual equals: expected
]

{ #category : #tests }
AILevenshteinDistanceTest >> testDistanceRemoveAll [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := ''.

	actual := firstString levenshteinDistanceTo: secondString.
	expected := 5.

	self assert: actual equals: expected
]

{ #category : #'*AI-EditDistances-Tests' }
AILevenshteinDistanceTest >> testDistanceToUsingAILevenshteinDistance [

	| result actual |
	result := 'zork' distanceTo: 'fork' using: AILevenshteinDistance new.
	actual := 1.
	self assert: result equals: actual
]

{ #category : #tests }
AILevenshteinDistanceTest >> testDistanceTwoAddOneReplace [

	| firstString secondString expected actual |
	firstString := 'HONDA'.
	secondString := 'HYUNDAI'.

	actual := firstString levenshteinDistanceTo: secondString.
	expected := 3.

	self assert: actual equals: expected
]

{ #category : #tests }
AILevenshteinDistanceTest >> testRecursiveDistanceCaseSensitive [
	| firstString secondString expected actual |
	
	firstString := 'HONDA'.
	secondString := 'honda'.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 5.
	
	self assert: actual equals: expected.
]

{ #category : #tests }
AILevenshteinDistanceTest >> testRecursiveDistanceEmptyStrings [
	| firstString secondString expected actual |
	
	firstString := ''.
	secondString := ''.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 0.
	
	self assert: actual equals: expected.
]

{ #category : #tests }
AILevenshteinDistanceTest >> testRecursiveDistanceNoPermutation [

	| firstString secondString expected actual |
	firstString := 'AZ'.
	secondString := 'ZA'.

	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 2.

	self assert: actual equals: expected
]

{ #category : #tests }
AILevenshteinDistanceTest >> testRecursiveDistanceOneReplace [

	| firstString secondString expected actual |
	firstString := 'A'.
	secondString := 'Z'.

	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 1.

	self assert: actual equals: expected
]

{ #category : #tests }
AILevenshteinDistanceTest >> testRecursiveDistanceRemoveAll [
	| firstString secondString expected actual |
	
	firstString := 'HONDA'.
	secondString := ''.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 5.
	
	self assert: actual equals: expected.
]

{ #category : #tests }
AILevenshteinDistanceTest >> testRecursiveDistanceTwoAddOneReplace [
	| firstString secondString expected actual |
	
	firstString := 'HONDA'.
	secondString := 'HYUNDAI'.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 3.
	
	self assert: actual equals: expected.
]
