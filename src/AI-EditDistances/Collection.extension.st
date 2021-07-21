Extension { #name : #Collection }

{ #category : #'*AI-EditDistances' }
Collection >> szymkiewiczSimpsonDistanceTo: aCollection [

	| intersection minSize |
	intersection := (self asSet intersection: aCollection asSet) size.
	minSize := self asSet size min: aCollection asSet size.
	^ (intersection / minSize) asFloat
]
