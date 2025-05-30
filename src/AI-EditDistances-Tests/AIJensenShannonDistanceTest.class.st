Class {
	#name : 'AIJensenShannonDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'jensenShannonDistance'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AIJensenShannonDistanceTest >> setUp [
	super setUp.
	jensenShannonDistance := AIJensenShannonDistance new
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceCaseSensitive [

	self assert: (jensenShannonDistance distanceBetween: 'abc' and: 'ABC') equals: 1.0
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceCompletelyDifferentStrings [

	self assert: (jensenShannonDistance distanceBetween: 'AAA' and: 'BBB') equals: 1.0.

	self assert: (jensenShannonDistance distanceBetween: 'ABC' and: 'XYZ') equals: 1.0
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceEmptyStrings [

	self assert: (jensenShannonDistance distanceBetween: '' and: '') equals: 0.0
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceIdenticalStrings [

	self assert: (jensenShannonDistance distanceBetween: 'ABC' and: 'ABC') equals: 0.0.

    self assert: (jensenShannonDistance distanceBetween: 'HELLO' and: 'HELLO') equals: 0.0
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceOneEmptyString [

	self assert: (jensenShannonDistance distanceBetween: '' and: 'ABC') equals: 1.0.

	self assert: (jensenShannonDistance distanceBetween: 'ABC' and: '') equals: 1.0
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistancePartialOverlap [

	| result |
	result := jensenShannonDistance distanceBetween: 'ABCD' and: 'ABCE'.
	self assert: result equals: 0.5.

    result := jensenShannonDistance distanceBetween: 'ABC' and: 'ACE'.
	self assert: (result between: 0.4 and: 0.8)
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceSameDistribution [

	self assert: (jensenShannonDistance distanceBetween: 'AAA' and: 'AAAA') equals: 0.0.
	self assert: (jensenShannonDistance distanceBetween: 'AB' and: 'AABB') equals: 0.0
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceSymmetric [

	| distance1 distance2 |
	distance1 := jensenShannonDistance distanceBetween: 'HELLO' and: 'WORLD'.
	distance2 := jensenShannonDistance distanceBetween: 'WORLD' and: 'HELLO'.
	self assert: distance1 equals: distance2
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceValidRange [

	| result |
	result := jensenShannonDistance distanceBetween: 'AABB' and: 'BBCC'.
	self assert: (result between: 0.0 and: 1.0)
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceWithLargeStrings [

	| str1 str2 result |
	str1 := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
	str2 := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
	result := jensenShannonDistance distanceBetween: str1 and: str2.
	self assert: result equals: 0.0.

	str1 := 'AAAABBBBCCCCDDDDEEEEFFFFGGGG'.
	str2 := 'AAAABBBBCCCCDDDDEEEEFFFFHHHH'.
	result := jensenShannonDistance distanceBetween: str1 and: str2.
	self assert: (result between: 0.2 and: 0.4)
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceWithNumericStrings [

	self
		assert: (jensenShannonDistance distanceBetween: '123' and: '123')
		equals: 0.0.

	self
		assert: (jensenShannonDistance distanceBetween: '123' and: '456')
		equals: 1.0
]

{ #category : 'tests' }
AIJensenShannonDistanceTest >> testDistanceWithSpecialCharacters [

	self assert: (jensenShannonDistance distanceBetween: '123' and: '456') equals: 1.0.
	self assert: (jensenShannonDistance distanceBetween: 'A@#' and: 'A@#') equals: 0.0
]
