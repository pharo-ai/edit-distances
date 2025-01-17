"
This normalize the Kendall Tau distance using this formula:

tau_c = 2 (P - Q) / (n**2 * (m - 1) / m)

Where P is the number of concordant pairs, Q the number of discordant pairs. n is the total number of samples, and m is the number of unique values in either x or y, whichever is smaller.

Reference: Maurice G. Kendall, “The treatment of ties in ranking problems”, Biometrika Vol. 33, No. 3, pp. 239-251. 1945.

More info: [Kendall tau algorithm](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.kendalltau.html)
"
Class {
	#name : 'AICKendallTauNormalizer',
	#superclass : 'AIAbstractKendallTauNormalizer',
	#category : 'AI-EditDistances-Normalizers',
	#package : 'AI-EditDistances',
	#tag : 'Normalizers'
}

{ #category : 'converting' }
AICKendallTauNormalizer >> normalize [

	"kendallTauDistance is a natural number that will be normalized into the range of [-1, 1]
	See class comment."

	| numerator denominator |
	numerator := 2 * (concordantPairs - discordantPairs).
	denominator := numberOfSamples squared * (minUniqueValues - 1 / minUniqueValues).
	^ numerator / denominator
]
