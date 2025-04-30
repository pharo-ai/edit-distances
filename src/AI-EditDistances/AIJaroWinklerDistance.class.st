"
Jaro-Winkler Distance Algorithm

The Jaro-Winkler distance is a string metric measuring edit distance between two sequences. It's a variant of the Jaro distance 
that gives more favorable ratings to strings that match from the beginning (prefix similarity).

The Jaro distance between two strings is computed as:
   jaro = 1/3 * (m/|len1| + m/|len2| + (m-t)/m)
where:
   - m is the number of matching characters
   - t is the number of transpositions
   - |len1| and |len2| are the lengths of the strings

Jaro-Winkler adjusts this score using a prefix scale (p) that gives more weight to strings that begin with the same characters:
   jw = jaro + (l * p * (1 - jaro))
where:
   - l is the length of common prefix (up to maxPrefixLength characters)
   - p is the prefix scaling factor (default 0.1)

The result is a value from 0.0 (no similarity) to 1.0 (exact match).

Examples:

jaroWinklerDistance := AIJaroWinklerDistance new.
jaroWinklerDistance distanceBetween: 'MARTHA' and: 'MARHTA'.  \""Returns: 0.961\""
jaroWinklerDistance distanceBetween: 'DWAYNE' and: 'DUANE'.   \""Returns: 0.840\""
jaroWinklerDistance distanceBetween: 'CRATE' and: 'TRACE'.    \""Returns: 0.733\""
jaroWinklerDistance distanceBetween: 'ABCD' and: 'EFGH'.      \""Returns: 0.0\""
"
Class {
	#name : 'AIJaroWinklerDistance',
	#superclass : 'AIAbstractEditDistance',
	#instVars : [
		'prefixScale',
		'maxPrefixLength'
	],
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'api' }
AIJaroWinklerDistance >> commonPrefixLengthOf: firstString and: secondString [
	"Calculate the length of the common prefix between the two strings, up to maxPrefixLength."

	| minLength count |
	minLength := maxPrefixLength min:
		             (firstString size min: secondString size).

	count := 0.
	1 to: minLength do: [ :i |
		(firstString at: i) = (secondString at: i)
			ifTrue: [
				| char |
				char := firstString at: i.
				char isDigit ifFalse: [ count := count + 1 ] ]
			ifFalse: [ ^ count ] ].

	^ count
]

{ #category : 'api' }
AIJaroWinklerDistance >> countTranspositionsBetween: firstString and: secondString matches: matches [

	| firstMatches secondMatches k transpositions |
	matches isEmpty ifTrue: [ ^ 0 ].

	firstMatches := Array new: firstString size withAll: false.
	secondMatches := Array new: secondString size withAll: false.

	matches do: [ :pair |
		firstMatches at: pair key put: true.
		secondMatches at: pair value put: true ].
	
	transpositions := 0.
	k := 0.

	1 to: firstString size do: [ :i |
		(firstMatches at: i) ifTrue: [
			[ k < secondString size and: [ (secondMatches at: k + 1) not ] ]
				whileTrue: [ k := k + 1 ].

			k := k + 1.

			k <= secondString size ifTrue: [
				(firstString at: i) ~= (secondString at: k) ifTrue: [
					transpositions := transpositions + 1 ] ] ] ].

	^ transpositions / 2
]

{ #category : 'api' }
AIJaroWinklerDistance >> distanceBetween: firstString and: secondString [
	"Compute the Jaro-Winkler distance between two strings.
    Returns a value from 0.0 (no similarity) to 1.0 (exact match)."
    
    | jaroDistance prefixLength |
    
    jaroDistance := self jaroSimilarityBetween: firstString and: secondString.
    prefixLength := self commonPrefixLengthOf: firstString and: secondString.
    
    ^ jaroDistance + (prefixLength * prefixScale * (1 - jaroDistance))
]

{ #category : 'api' }
AIJaroWinklerDistance >> findMatchesBetween: firstString and: secondString within: distance [
	| matches matchFlags1 matchFlags2 |
    
    matches := OrderedCollection new.
    matchFlags1 := Array new: firstString size withAll: false.
    matchFlags2 := Array new: secondString size withAll: false.
    
    1 to: firstString size do: [:i |
        | start end foundMatch |
        start := (i - distance) max: 1.
        end := (i + distance) min: secondString size.
        foundMatch := false.
        
        start to: end do: [:j |
            (foundMatch not and: [(matchFlags2 at: j) not]) ifTrue: [
                (firstString at: i) = (secondString at: j) ifTrue: [
                    matches add: i -> j.
                    matchFlags1 at: i put: true.
                    matchFlags2 at: j put: true.
                    foundMatch := true.
                ]
            ]
        ].
    ].
    
    ^ matches
]

{ #category : 'initialization' }
AIJaroWinklerDistance >> initialize [

	super initialize.
	prefixScale := 0.1.
	maxPrefixLength := 4.
]

{ #category : 'api' }
AIJaroWinklerDistance >> jaroSimilarityBetween: firstString and: secondString [

	 "Calculate the basic Jaro similarity between the two strings."
    
    | len1 len2 matchDistance matches transpositions |
    
    len1 := firstString size.
    len2 := secondString size.
    
    "Handle empty strings"
    (len1 = 0 or: [len2 = 0]) ifTrue: [
        "If both are empty, they're identical (distance 1.0)"
        (len1 = 0 and: [len2 = 0]) ifTrue: [ ^ 1.0 ].
        "If only one is empty, they're completely different (distance 0.0)"
        ^ 0.0
    ].
    
    matchDistance := ((len1 max: len2) // 2) - 1.
    matchDistance := matchDistance max: 0.
    
    matches := self findMatchesBetween: firstString and: secondString within: matchDistance.
    
    matches isEmpty ifTrue: [ ^ 0.0 ].
    
    transpositions := self countTranspositionsBetween: firstString and: secondString matches: matches.
    
    ^ ((matches size / len1) +
       (matches size / len2) +
       ((matches size - transpositions) / matches size)) / 3
]

{ #category : 'accessing' }
AIJaroWinklerDistance >> maxPrefixLength [
	
	^ maxPrefixLength
]

{ #category : 'accessing' }
AIJaroWinklerDistance >> maxPrefixLength: anInteger [

	anInteger < 0 ifTrue: [
		Error signal: 'Maximum prefix length must be non-negative' ].

	maxPrefixLength := anInteger
]

{ #category : 'accessing' }
AIJaroWinklerDistance >> prefixScale [

	^ prefixScale
]

{ #category : 'accessing' }
AIJaroWinklerDistance >> prefixScale: aNumber [

	 (aNumber < 0 or: [aNumber > 0.25]) 
        ifTrue: [ Error signal: 'Prefix scaling factor must be between 0 and 0.25' ].
    
    prefixScale := aNumber
]
