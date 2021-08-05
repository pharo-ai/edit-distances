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
	spec for: #common do: [ "Dependencies"
		self polyMath: spec.

		"Packages"
		spec
			package: 'AI-EditDistances';
			package: 'AI-EditDistances-Tests'
			with: [ spec requires: #( 'AI-EditDistances' ) ].

		spec
			group: 'Core' with: #( 'AI-EditDistances' );
			group: 'Tests'
			with: #( 'AI-EditDistances' 'AI-EditDistances-Tests' );
			group: 'All' with: #( 'Core' 'Tests' );
			group: 'default' with: #( 'All' ) ]
]

{ #category : #baselines }
BaselineOfAIEditDistances >> polyMath: spec [

	spec baseline: 'PolyMath' with: [ 
		spec
			loads: #( 'Core' );
			repository: 'github://PolyMathOrg/PolyMath:master/src' ]
]
