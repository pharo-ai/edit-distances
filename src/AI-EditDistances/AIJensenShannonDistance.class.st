Class {
	#name : 'AIJensenShannonDistance',
	#superclass : 'AIAbstractEditDistance',
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'api' }
AIJensenShannonDistance >> distanceBetween: firstString and: secondString [
	"Compute the Jensen-Shannon distance between two strings.
	Returns a value between 0 and 1, where 0 means identical distributions & 1.0 means completely different."

	| firstDist secondDist jsDivergence |
	(firstString isEmpty and: [ secondString isEmpty ]) ifTrue: [ ^ 0.0 ].
	firstString isEmpty ifTrue: [ ^ 1.0 ].
	secondString isEmpty ifTrue: [ ^ 1.0 ].

	firstDist := self getProbabilityDistribution: firstString.
	secondDist := self getProbabilityDistribution: secondString.
	jsDivergence := self
		                jensenShannonDivergence: firstDist
		                and: secondDist.
		
	jsDivergence < 0 ifTrue: [ jsDivergence := 0.0 ].
	^ jsDivergence sqrt
]

{ #category : 'private' }
AIJensenShannonDistance >> getProbabilityDistribution: aString [
	"Convert a string to a probability distribution (character frequencies)"

	| charCount dist |
	charCount := Dictionary new.
	dist := Dictionary new.

	aString do: [ :char |
		charCount at: char put: (charCount at: char ifAbsent: 0) + 1 ].

	charCount keysAndValuesDo: [ :char :count |
		dist at: char put: (count asFloat / aString size asFloat) ].

	^ dist
]

{ #category : 'private' }
AIJensenShannonDistance >> jensenShannonDivergence: firstDist and: secondDist [
	"Calculate the Jensen-Shannon divergence between two probability distributions"

	| allKeys midpointDist firstKL secondKL |
	allKeys := Set new.
	allKeys
		addAll: firstDist keys;
		addAll: secondDist keys.

	midpointDist := Dictionary new.
	allKeys do: [ :key |
			| p1 p2 |
			p1 := firstDist at: key ifAbsent: 0.0.
			p2 := secondDist at: key ifAbsent: 0.0.
			midpointDist at: key put: p1 + p2 / 2.0 ].

	firstKL := self kullbackLeiblerDivergence: firstDist to: midpointDist.
	secondKL := self
		            kullbackLeiblerDivergence: secondDist
		            to: midpointDist.

	^ ( firstKL + secondKL ) / 2.0
]

{ #category : 'private' }
AIJensenShannonDistance >> kullbackLeiblerDivergence: pDist to: qDist [
	"Calculate the Kullback-Leibler divergence of pDist relative to qDist.
	Note: qDist must contain all keys present in pDist"

	| divergence |
	divergence := 0.0.

	pDist keysAndValuesDo: [ :key :pValue |
			| qValue |
			pValue > 0 ifTrue: [
					qValue := qDist at: key.
					"qValue should never be 0 here since we prepare qDist to contain all keys from pDist"
					qValue > 0 ifTrue: [
						divergence := divergence
						              + (pValue * (pValue / qValue) ln / 2 ln) ] ] ].

	^ divergence
]
