"
Episode Distance Algorithm
The Episode Distance is a string metric that measures the minimum number of insertions required to transform one string into another.
Unlike other edit distance algorithms (like Levenshtein), Episode Distance only allows insertions, which cost 1.

The distance is calculated as:
   episodeDistance = |len2| - LCS(str1, str2)
where:
   - |len2| is the length of the second string
   - LCS is the length of the Longest Common Subsequnce of the two strings

The result is the minimum number of insertions needed to transform the first string into the second.

Examples:
episodeDistance := AIEpisodeDistance new.
episodeDistance distanceBetween: 'MARADONA' and: 'M ARADONAS'.  """"Returns: 2""""
episodeDistance distanceBetween: 'ABC' and: 'ABCDEF'.  """"Returns: 3""""
episodeDistance distanceBetween: 'ABC' and: 'ABC'.  """"Returns: 0""""
episodeDistance distanceBetween: '' and: 'ABC'.  """"Returns: 3""""
"
Class {
	#name : 'AIEpisodeDistance',
	#superclass : 'AIAbstractEditDistance',
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'api' }
AIEpisodeDistance >> distanceBetween: firstString and: secondString [

	| lcsLength |
    secondString isEmpty ifTrue: [ 
        firstString isEmpty ifTrue: [ ^ 0 ].
        ^ Float infinity 
    ].
    
    firstString isEmpty ifTrue: [ ^ secondString size ].

    lcsLength := self longestCommonSubsequenceLength: firstString and: secondString.
    
    ^ secondString size - lcsLength
]

{ #category : 'api' }
AIEpisodeDistance >> longestCommonSubsequenceLength: firstString and: secondString [

	| m n dp |
	m := firstString size.
	n := secondString size.

	dp := CTArray2D width: n + 1 height: m + 1.

	1 to: m + 1 do: [ :i | dp atColumn: 1 atRow: i put: 0 ].
	1 to: n + 1 do: [ :j | dp atColumn: j atRow: 1 put: 0 ].

	1 to: m do: [ :i |
		1 to: n do: [ :j |
			(firstString at: i) = (secondString at: j)
				ifTrue: [
				dp atColumn: j + 1 atRow: i + 1 put: (dp atColumn: j atRow: i) + 1 ]
				ifFalse: [
					dp
						atColumn: j + 1
						atRow: i + 1
						put:
						((dp atColumn: j atRow: i + 1) max:
							 (dp atColumn: j + 1 atRow: i)) ] ] ].

	^ dp atColumn: n + 1 atRow: m + 1
]
