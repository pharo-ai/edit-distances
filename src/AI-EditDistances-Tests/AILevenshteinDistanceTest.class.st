Class {
	#name : 'AILevenshteinDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'levenshteinDistance'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AILevenshteinDistanceTest >> setUp [

	super setUp.
	levenshteinDistance := AILevenshteinDistance new
]

{ #category : 'tests' }
AILevenshteinDistanceTest >> testDistanceCaseSensitive [

	self assert: (levenshteinDistance distanceBetween: 'HONDA' and: 'honda') equals: 5
]

{ #category : 'tests' }
AILevenshteinDistanceTest >> testDistanceEmptyStrings [

	self assert: (levenshteinDistance distanceBetween: '' and: '') equals: 0
]

{ #category : 'tests' }
AILevenshteinDistanceTest >> testDistanceNoPermutation [

	self assert: (levenshteinDistance distanceBetween: 'AZ' and: 'ZA') equals: 2
]

{ #category : 'tests' }
AILevenshteinDistanceTest >> testDistanceOneReplace [

	self assert: (levenshteinDistance distanceBetween: 'A' and: 'Z') equals: 1
]

{ #category : 'tests' }
AILevenshteinDistanceTest >> testDistanceRemoveAll [

	self assert: (levenshteinDistance distanceBetween: 'HONDA' and: '') equals: 5
]

{ #category : 'tests' }
AILevenshteinDistanceTest >> testDistanceToUsingAILevenshteinDistance [
	
	self assert: (levenshteinDistance distanceBetween: 'zork' and: 'fork') equals: 1
]

{ #category : 'tests' }
AILevenshteinDistanceTest >> testDistanceTwoAddOneReplace [

	self assert: (levenshteinDistance distanceBetween: 'HONDA' and: 'HYUNDAI') equals: 3
]

{ #category : 'tests' }
AILevenshteinDistanceTest >> testInsertion[
    self assert: (levenshteinDistance distanceBetween: 'cat' and: 'cats') equals: 1.
]

{ #category : 'tests' }
AILevenshteinDistanceTest >> testUnicode[
    self assert: (levenshteinDistance distanceBetween: 'café' and: 'caffè') equals: 2.
]