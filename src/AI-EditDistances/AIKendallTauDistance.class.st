"
The Kendall tau rank distance is a metric that counts the number of pairwise disagreements between two ranking lists. The larger the distance, the more dissimilar the two lists are.

More info: [Kendall Tau distance](https://en.wikipedia.org/wiki/Kendall_tau_distance)
"
Class {
	#name : #AIKendallTauDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances'
}

{ #category : #accessing }
AIKendallTauDistance class >> distanceBetween: aRankedList and: anotherRankedList [

	^ aRankedList kendallTauDistanceTo: anotherRankedList
]
