"
The Kendall tau rank distance is a metric that counts the number of pairwise disagreements between two ranking lists. The larger the distance, the more dissimilar the two lists are.

More info: [Kendall Tau distance](https://en.wikipedia.org/wiki/Kendall_tau_distance)
"
Class {
	#name : 'AIKendallTauDistance',
	#superclass : 'AIAbstractEditDistance',
	#instVars : [
		'normalizer',
		'tiesInX',
		'tiesInY',
		'discordantPairs',
		'totalPairs',
		'normalizerClass',
		'concordantPairs',
		'willWeNormalizeTheResult'
	],
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'accessing' }
AIKendallTauDistance class >> defaultNormalizer [

	^ AIBKendallTauNormalizer
]

{ #category : 'api' }
AIKendallTauDistance >> distanceBetween: xRankedList and: yRankedList [

	| indexCombinations |
	self putValuesInZero.
	indexCombinations := (1 to: xRankedList size) combinations: 2.

	indexCombinations do: [ :indexPair | 
		| i j inversion1 inversion2 isXiTied isYjTied |
		i := indexPair first.
		j := indexPair second.

		inversion1 := (xRankedList at: i) > (xRankedList at: j) and: [ 
			(yRankedList at: i) < (yRankedList at: j) ].
		inversion2 := (xRankedList at: i) < (xRankedList at: j) and: [ 
			(yRankedList at: i) > (yRankedList at: j) ].
		
		isXiTied := (xRankedList at: i) = (xRankedList at: j).
		isYjTied := (yRankedList at: i) = (yRankedList at: j).
		
		(inversion1 or: inversion2)
			ifTrue: [ discordantPairs := discordantPairs + 1 ]
			ifFalse: [ "Increase concordant pairs only if there are no ties"
				(isXiTied or: isYjTied) ifFalse: [ concordantPairs := concordantPairs + 1 ] ].

		"If a tie occurs for the same pair in both x and y, it is not added to neither."
		(isXiTied xor: isYjTied) ifTrue: [ 
			isXiTied ifTrue: [ tiesInX := tiesInX + 1 ].
			isYjTied ifTrue: [ tiesInY := tiesInY + 1 ] ] ].

	^ self normalizedDistanceBetween: xRankedList and: yRankedList
]

{ #category : 'initialization' }
AIKendallTauDistance >> initialize [

	super initialize.
	willWeNormalizeTheResult := true.
	self putValuesInZero
]

{ #category : 'accessing' }
AIKendallTauDistance >> normalizeResult: aBoolean [

	willWeNormalizeTheResult := aBoolean
]

{ #category : 'calculating' }
AIKendallTauDistance >> normalizedDistanceBetween: xRankedList and: yRankedList [

	"The distance is the number of discordant pairs"

	willWeNormalizeTheResult ifFalse: [ ^ discordantPairs ].

	normalizerClass ifNil: [ normalizerClass := self class defaultNormalizer ].
	
	normalizer := normalizerClass new.
	normalizer
		concordantPairs: concordantPairs;
		discordantPairs: discordantPairs;
		tiesInX: tiesInX;
		tiesInY: tiesInY;
		numberOfSamples: xRankedList size;
		minUniqueValues: (xRankedList asSet size min: yRankedList asSet size).
	
	^ normalizer normalize
]

{ #category : 'initialization' }
AIKendallTauDistance >> putValuesInZero [

	totalPairs := 0.
	concordantPairs := 0.
	discordantPairs := 0.
	tiesInX := 0.
	tiesInY := 0
]

{ #category : 'accessing' }
AIKendallTauDistance >> useNormalizer: aKendallTauNormalizerClass [

	normalizerClass := aKendallTauNormalizerClass
]
