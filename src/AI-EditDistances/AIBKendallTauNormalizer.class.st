"
This normalize the Kendall Tau distance using this formula:

tau_b = (P - Q) / sqrt((P + Q + T) * (P + Q + U))

Where P is the number of concordant pairs, Q the number of discordant pairs, T the number of ties only in x, and U the number of ties only in y. If a tie occurs for the same pair in both x and y, it is not added to either T or U.

Reference: Maurice G. Kendall, “The treatment of ties in ranking problems”, Biometrika Vol. 33, No. 3, pp. 239-251. 1945.

More info: [Kendall tau algorithm](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.kendalltau.html)
"
Class {
	#name : 'AIBKendallTauNormalizer',
	#superclass : 'AIAbstractKendallTauNormalizer',
	#category : 'AI-EditDistances-Normalizers',
	#package : 'AI-EditDistances',
	#tag : 'Normalizers'
}

{ #category : 'converting' }
AIBKendallTauNormalizer >> normalize [

	"kendallTauDistance is a natural number that will be normalized into the range of [-1, 1]
	See class comment."

	| numerator denominator sum1 sum2 |
	numerator := concordantPairs - discordantPairs.
	sum1 := concordantPairs + discordantPairs + tiesInX.
	sum2 := concordantPairs + discordantPairs + tiesInY.
	denominator := (sum1 * sum2) sqrt.
	^ numerator / denominator
]
