Class {
	#name : 'AIHellingerDistanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'metric'
	],
	#category : 'AI-EditDistances-Tests',
	#package : 'AI-EditDistances-Tests'
}

{ #category : 'tests' }
AIHellingerDistanceTest >> assert: aNumber closeTo: anotherNumber epsilon: epsilonValue [

    | difference |

    difference := aNumber - anotherNumber.
    self 
		assert: difference abs <= epsilonValue
		description: (aNumber asString, ' is not close to ', anotherNumber asString, ' with epsilon ', epsilonValue asString).

]

{ #category : 'running' }
AIHellingerDistanceTest >> setUp [

	super setUp.
	metric := AIHellingerDistance new
]

{ #category : 'tests' }
AIHellingerDistanceTest >> testDifferentDistribution1 [

	| p q |
	p := #( 0.36 0.48 0.16 ).
	q := #( 0.33 0.33 0.33 ).
	self
		assert: (metric distanceBetween: p and: q)
		closeTo: 0.15049826726881443
		epsilon: 0.001
]

{ #category : 'tests' }
AIHellingerDistanceTest >> testDifferentDistribution2 [

	| p q |
	p := #( 0.25 0.25 0.25 0.25 ).
	q := #( 0.1 0.2 0.3 0.4 ).
	self
		assert: (metric distanceBetween: p and: q)
		closeTo: 0.167
		epsilon: 0.001
]

{ #category : 'tests' }
AIHellingerDistanceTest >> testDifferentDistribution3 [

	| p q |
	p := #( 0 0.5 0.5 ).
	q := #( 1 0 0 ).
	self
		assert: (metric distanceBetween: p and: q)
		closeTo: 1.0
		epsilon: 0.0001
]

{ #category : 'tests' }
AIHellingerDistanceTest >> testDifferentDistribution4 [

	| p q |
	p := #( 0.2 0.3 0.1 0.4 ).
	q := #( 0.1 0.4 0.3 0.2 ).
	self
		assert: (metric distanceBetween: p and: q)
		closeTo: 0.2368980623511251
		epsilon: 0.0001
]

{ #category : 'tests' }
AIHellingerDistanceTest >> testEqualDistributions [

    | p q |

    p := #(0.5 0.5) asArray.
    q := #(0.5 0.5) asArray.

    self assert: (metric distanceBetween: p and: q) equals: 0.0.
]

{ #category : 'tests' }
AIHellingerDistanceTest >> testInvalidDistributions [

    | p q |

    p := #(0.4 0.4 0.4) asArray.
    q := #(0.3 0.3) asArray.

    self should: [ metric distanceBetween: p and: q ] raise: Error.

]
