Class {
	#name : #StringMetricsTest,
	#superclass : #TestCase,
	#category : #'AI-EditDistances-Tests'
}

{ #category : #'as yet unclassified' }
StringMetricsTest >> testLevenshteinDistanceAB [
	| firstString secondString expected actual |
	
	firstString := 'A'.
	secondString := 'B'.
	
	actual := firstString levenshteinDistanceTo: secondString.
	expected := 1.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testLevenshteinDistanceEmptyStrings [
	| firstString secondString expected actual |
	
	firstString := ''.
	secondString := ''.
	
	actual := firstString levenshteinDistanceTo: secondString.
	expected := 0.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testLevenshteinDistanceHondaHondaCaseSensitive [
	| firstString secondString expected actual |
	
	firstString := 'HONDA'.
	secondString := 'honda'.
	
	actual := firstString levenshteinDistanceTo: secondString.
	expected := 5.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testLevenshteinDistanceHondaHyundai [
	| firstString secondString expected actual |
	
	firstString := 'HONDA'.
	secondString := 'HYUNDAI'.
	
	actual := firstString levenshteinDistanceTo: secondString.
	expected := 3.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testLevenshteinDistanceKittenSitting [
	| firstString secondString expected actual |
	
	firstString := 'KITTEN'.
	secondString := 'SITTING'.
	
	actual := firstString levenshteinDistanceTo: secondString.
	expected := 3.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testLevenshteinDistanceOneEmpty [
	| firstString secondString expected actual |
	
	firstString := 'HONDA'.
	secondString := ''.
	
	actual := firstString levenshteinDistanceTo: secondString.
	expected := 5.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testLevenshteinDistanceSittingKitten [
	| firstString secondString expected actual |
	
	firstString := 'SITTING'.
	secondString := 'KITTEN'.
	
	actual := firstString levenshteinDistanceTo: secondString.
	expected := 3.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testRecursiveLevenshteinDistanceAB [
	| firstString secondString expected actual |
	
	firstString := 'A'.
	secondString := 'B'.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 1.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testRecursiveLevenshteinDistanceEmptyStrings [
	| firstString secondString expected actual |
	
	firstString := ''.
	secondString := ''.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 0.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testRecursiveLevenshteinDistanceHondaHondaCaseSensitive [
	| firstString secondString expected actual |
	
	firstString := 'HONDA'.
	secondString := 'honda'.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 5.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testRecursiveLevenshteinDistanceHondaHyundai [
	| firstString secondString expected actual |
	
	firstString := 'HONDA'.
	secondString := 'HYUNDAI'.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 3.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testRecursiveLevenshteinDistanceKittenSitting [
	| firstString secondString expected actual |
	
	firstString := 'KITTEN'.
	secondString := 'SITTING'.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 3.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testRecursiveLevenshteinDistanceOneEmpty [
	| firstString secondString expected actual |
	
	firstString := 'HONDA'.
	secondString := ''.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 5.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
StringMetricsTest >> testRecursiveLevenshteinDistanceSittingKitten [
	| firstString secondString expected actual |
	
	firstString := 'SITTING'.
	secondString := 'KITTEN'.
	
	actual := firstString recursiveLevenshteinDistanceTo: secondString.
	expected := 3.
	
	self assert: actual equals: expected.
]
