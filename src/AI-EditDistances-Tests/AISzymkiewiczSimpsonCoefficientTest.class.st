Class {
	#name : 'AISzymkiewiczSimpsonCoefficientTest',
	#superclass : 'TestCase',
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'tests' }
AISzymkiewiczSimpsonCoefficientTest >> testSzymkiewiczSimpsonDistanceTo [

	| metric |
	
	metric := AISzymkiewiczSimpsonDistance new. 
	
	self assert: (metric distanceBetween: #( 1 2 3 4 5 6 ) asSet  and:  #(1 2 3 ) asSet) closeTo: 1.
	
	self assert: (metric distanceBetween: #( 1000 2 0.5 3 6 88 99 99 99 ) asSet  and:  #( 1000 0.5 99 ) asSet) closeTo: 1.

	self assert: (metric distanceBetween: #( 12 34 56 7 2 3 ) asSet and: #( 3 5 43 ) asSet) closeTo: 0.33333333333.
]

{ #category : 'tests' }
AISzymkiewiczSimpsonCoefficientTest >> testEmptySets [
	"Checks that the Szymkiewicz-Simpson coefficient for empty sets is 1.0."
	| metric |
	metric := AISzymkiewiczSimpsonDistance new.
	self assert: (metric distanceBetween: #() asSet and: #() asSet) equals: 1.0.
]

{ #category : 'tests' }
AISzymkiewiczSimpsonCoefficientTest >> testIdenticalSets [
	"Checks that the Szymkiewicz-Simpson coefficient for identical sets is 1.0."
	| metric |
	metric := AISzymkiewiczSimpsonDistance new.
	self assert: (metric distanceBetween: #(1 2 3) asSet and: #(1 2 3) asSet) equals: 1.0.
]

{ #category : 'tests' }
AISzymkiewiczSimpsonCoefficientTest >> testDisjointSets [
	"Checks that the Szymkiewicz-Simpson coefficient for disjoint sets is 0.0."
	| metric |
	metric := AISzymkiewiczSimpsonDistance new.
	self assert: (metric distanceBetween: #(1 2 3) asSet and: #(4 5 6) asSet) equals: 0.0.
]