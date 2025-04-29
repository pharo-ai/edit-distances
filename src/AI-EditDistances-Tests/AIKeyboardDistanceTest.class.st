Class {
	#name : 'AIKeyboardDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'keyboardDistance'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AIKeyboardDistanceTest >> setUp [
	super setUp.
	keyboardDistance := AIKeyboardDistance new
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceAdjacentKeys [

	self
		assert: (keyboardDistance distanceBetween: 'cat' and: 'vat') equals: 1.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceEmptyStrings [

	self assert: (keyboardDistance distanceBetween: '' and: '') equals: 0.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceFirstStringEmpty [

	self assert: (keyboardDistance distanceBetween: '' and: 'hello') equals: 5.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceIdenticalStrings [

	self assert: (keyboardDistance distanceBetween: 'cat' and: 'cat') equals: 0.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceLengthDifference [

	self
		assert: (keyboardDistance distanceBetween: 'hello' and: 'hell')
		equals: 1.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceMultipleCharacterDifferences [

	| distance |
	distance := keyboardDistance distanceBetween: 'keyboard' and: 'leopard'.
	self assert: distance > 0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceRowRelationships [

	| qz qa qs |
    qz := keyboardDistance distanceBetween: 'q' and: 'z'.
    qa := keyboardDistance distanceBetween: 'q' and: 'a'.
    qs := keyboardDistance distanceBetween: 'q' and: 's'.
    
    self assert: qz > qa.
    self assert: qs > qa.
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceSecondStringEmpty [

	self assert: (keyboardDistance distanceBetween: 'world' and: '') equals: 5.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceSpecialCharacters [

	self assert:
		(keyboardDistance distanceBetween: 'test!' and: 'test@') equals: 1.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceTwoKeysApart [

	self
		assert: (keyboardDistance distanceBetween: 'hello' and: 'kello')
		equals: 2.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceUnknownCharacter [

	self assert: (keyboardDistance keyDistance: $q and: $€) equals: 5.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceUppercaseAndLowercase [

	self
		assert: (keyboardDistance distanceBetween: 'Test' and: 'test')
		equals: 0.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testDistanceWithSpaces [

	self assert: (keyboardDistance distanceBetween: 'hello world' and: 'hello world') equals: 0.0
]

{ #category : 'tests' }
AIKeyboardDistanceTest >> testKeyDistance [

	self assert: (keyboardDistance keyDistance: $q and: $w) equals: 1.0.
	self assert: (keyboardDistance keyDistance: $a and: $a) equals: 0.0.
	self assert: (keyboardDistance keyDistance: $z and: $m) equals: 6.0.
	self assert: (keyboardDistance keyDistance: $s and: $l) equals: 7.0
]
