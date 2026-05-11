"
I am a baseline
"
Class {
	#name : 'BaselineOfAIEditDistances',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfAIEditDistances',
	#package : 'BaselineOfAIEditDistances'
}

{ #category : 'baselines' }
BaselineOfAIEditDistances >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"External dependencies"
		spec
    		baseline: 'AIExternalVectorMatrix'
			with: [ spec repository: 'github://pharo-ai/external-dependencies' ].
		spec 
			baseline: 'ContainersArray2D' 
			with: [ spec repository: 'github://pharo-containers/Containers-Array2D/src' ].
		"Packages"
		spec
			package: 'AI-EditDistances' with: [ spec requires: #( 'AIExternalVectorMatrix' 'ContainersArray2D' ) ];
			package: 'AI-EditDistances-Tests' with: [ spec requires: #( 'AI-EditDistances' ) ]; 
			package: 'AI-Brew-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Cosine-Similarity-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Damerau-Levenshtein-Distance' with: [ spec requires: #('AI-EditDistances' 'ContainersArray2D')];
			package: 'AI-Episode-Distance' with: [ spec requires: #('AI-EditDistances' 'ContainersArray2D')];
			package: 'AI-Euclidean-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Hamming-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Hellinger-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Jaro-Winkler-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Jensen-Shannon-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Kendall-Tau-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Keyboard-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Levenshtein-Distance' with: [ spec requires: #( 'AI-EditDistances' 'ContainersArray2D' ) ];
			package: 'AI-Manhattan-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Minkowski-Distance' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Restricted-Damerau-Levenshtein-Distance' with: [ spec requires: #( 'AI-EditDistances' 'ContainersArray2D' ) ];
			package: 'AI-Shingles-Similarity' with: [ spec requires: #('AI-EditDistances')];
			package: 'AI-Szymkiewicz-Simpson-Distance' with: [ spec requires: #('AI-EditDistances')] .
		"Groups"
		spec
			group: 'Core' with: #( 'AI-EditDistances' 'AI-Brew-Distance' 'AI-Cosine-Similarity-Distance' 'AI-Damerau-Levenshtein-Distance' 'AI-Episode-Distance' 'AI-Euclidean-Distance' 'AI-Hamming-Distance' 'AI-Hellinger-Distance' 'AI-Jaro-Winkler-Distance' 'AI-Jensen-Shannon-Distance' 'AI-Kendall-Tau-Distance' 'AI-Keyboard-Distance' 'AI-Levenshtein-Distance' 'AI-Manhattan-Distance' 'AI-Minkowski-Distance' 'AI-Restricted-Damerau-Levenshtein-Distance' 'AI-Szymkiewicz-Simpson-Distance' 'AI-Shingles-Similarity' );
			group: 'Tests' with: #( 'AI-EditDistances-Tests' );
			group: 'All' with: #( 'Core' 'Tests' ) ]
]
