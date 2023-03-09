"
I am a baseline
"
Class {
	#name : #BaselineOfAIEditDistances,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIEditDistances
}

{ #category : #baselines }
BaselineOfAIEditDistances >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Packages"
		spec
			package: 'AI-EditDistances';
			package: 'AI-EditDistances-Tests' with: [ spec requires: #( 'AI-EditDistances' ) ].
		spec
			group: 'Core' with: #( 'AI-EditDistances' );
			group: 'Tests' with: #( 'AI-EditDistances-Tests' );
			group: 'All' with: #( 'Core' 'Tests' ) ]
]
