Extension { #name : #Set }

{ #category : #'*AI-EditDistances' }
Set >> szymkiewiczSimpsonDistanceTo: aCollection [

	| intersection minSize |
	intersection := (self intersection: aCollection) size.
	minSize := self size min: aCollection size.
	^ (intersection / minSize) asFloat
]
