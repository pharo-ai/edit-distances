Class {
	#name : 'AIShinglesSimilarityTest',
	#superclass : 'TestCase',
	#instVars : [
		'metric'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AIShinglesSimilarityTest >> setUp [ 
	super setUp.
	
	metric := AIShinglesSimilarity
		slidingWindowSize: 2
		maxEncodingSize: 5.
]

{ #category : 'tests' }
AIShinglesSimilarityTest >> testEncode [

	| sequence encodedSequence expected |
	
	sequence := #(lorem ipsum dolor sit amet).
	encodedSequence := metric encode: sequence.
	
	expected := { 
		110081445 . "#(lorem ipsum) hash"
		193669754 . "#(ipsum dolor) hash"
		253862900 . "#(dolor sit) hash"
		179038235 "#(sit amet) hash"
	} asSet.

	self assert: encodedSequence equals: expected.
	
]

{ #category : 'tests' }
AIShinglesSimilarityTest >> testEncodeLongSequence [

	| sequence encodedSequence expected |
	
	sequence := #(lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua).
	encodedSequence := metric encode: sequence.
	
	expected := #(2699233 71776270 72413348 77831009 78373547) asSet.

	self assert: encodedSequence equals: expected.
]

{ #category : 'tests' }
AIShinglesSimilarityTest >> testNoSimilarity [

	| sequence1 sequence2 similarity |
	sequence1 := #( lorem ipsum dolor sit amet ).
	sequence2 := #( one two three ).

	similarity := metric distanceBetween: sequence1 and: sequence2.

	self assert: similarity equals: 0
]

{ #category : 'tests' }
AIShinglesSimilarityTest >> testShingleFor [

	| tokens shingle expected |
	tokens := #( lorem ipsum dolor ).
	shingle := metric shingleFor: tokens.

	expected := 43853569. "#(lorem ipsum dolor) hash"

	self assert: shingle equals: expected
]

{ #category : 'tests' }
AIShinglesSimilarityTest >> testSimilarityBetweenAnd [

	| sequence1 sequence2 similarity |
	sequence1 := #( lorem ipsum dolor sit amet ).
	sequence2 := #( hello world lorem ipsum ).

	similarity := metric distanceBetween: sequence1 and: sequence2.

	self assert: similarity closeTo: 1 / 4 + (1 / 3) / 2
]

{ #category : 'tests' }
AIShinglesSimilarityTest >> testSimilarityLongSequenceSmallChange [

	| sequence1 sequence2 similarity |
	
	sequence1 := #(lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua).
	sequence2 := #(ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna NEWWORD aliqua).
	
	similarity := metric distanceBetween: sequence1 and: sequence2.
	
	self assert: similarity closeTo: 4/5.
]

{ #category : 'tests' }
AIShinglesSimilarityTest >> testSimilaritySameSequence [

	| sequence similarity |
	sequence := #( lorem ipsum dolor sit amet ).
	similarity := metric distanceBetween: sequence and: sequence.

	self assert: similarity equals: 1
]
