"
The Levenshtein distance is a string metric for measuring the difference between two sequences. Informally, the Levenshtein distance between two words is the minimum number of single-character edits (insertions, deletions or substitutions) required to change one word into the other.

More info on: [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
"
Class {
	#name : #AILevenshteinDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AILevenshteinDistance class >> distanceBetween: anObject and: anotherObject [

	^ anObject levenshteinDistanceTo: anotherObject
]
