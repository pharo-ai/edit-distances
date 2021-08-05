Extension { #name : #SequenceableCollection }

{ #category : #'*AI-EditDistances' }
SequenceableCollection >> combinations: aNumber [

	"Take the items in the receiver, aNumber at a time, return all the combinations"

	^ Array streamContents: [ :stream | 
		  self
			  combinations: aNumber
			  atATimeDo: [ :combination | stream nextPut: combination copy ] ]
]
