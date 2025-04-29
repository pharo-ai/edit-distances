Class {
	#name : 'AIJaroWinklerDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'jaroWinklerDistance'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'running' }
AIJaroWinklerDistanceTest >> setUp [
	super setUp.

	jaroWinklerDistance := AIJaroWinklerDistance new
]

{ #category : 'tests' }
AIJaroWinklerDistanceTest >> testDistanceEmptyStrings [

	self assert: (jaroWinklerDistance distanceBetween: '' and: '') equals: 1.0.

	self assert: (jaroWinklerDistance distanceBetween: 'hello' and: '') equals: 0.0.

	self assert: (jaroWinklerDistance distanceBetween: '' and: 'hello') equals: 0.0
]

{ #category : 'tests' }
AIJaroWinklerDistanceTest >> testDistanceExactMatch [

	self assert: (jaroWinklerDistance distanceBetween: 'test' and: 'test') equals: 1.0
]

{ #category : 'tests' }
AIJaroWinklerDistanceTest >> testDistanceExamples [

	self assert: ((jaroWinklerDistance distanceBetween: 'MARTHA' and: 'MARHTA') roundTo: 0.001) equals: 0.961.

	self assert: ((jaroWinklerDistance distanceBetween: 'DWAYNE' and: 'DUANE') roundTo: 0.001) equals: 0.840.
	
    self assert: ((jaroWinklerDistance distanceBetween: 'CRATE' and: 'TRACE') roundTo: 0.001) equals: 0.733.
	
    self assert: (jaroWinklerDistance distanceBetween: 'ABCD' and: 'EFGH') equals: 0.0
]

{ #category : 'tests' }
AIJaroWinklerDistanceTest >> testDistanceNoMatch [

	self assert: (jaroWinklerDistance distanceBetween: 'ABCD' and: 'EFGH') equals: 0.0
]

{ #category : 'tests' }
AIJaroWinklerDistanceTest >> testDistanceWithNumberStrings [

	| distance |
	distance := jaroWinklerDistance distanceBetween: '12345' and: '54321'.
	self assert: distance < 0.5.
	
	distance := jaroWinklerDistance distanceBetween: 'A1B2' and: 'A1B3'.
	self assert: distance > 0.8.
]
