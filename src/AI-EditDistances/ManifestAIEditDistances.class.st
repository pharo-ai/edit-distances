"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAIEditDistances,
	#superclass : #PackageManifest,
	#category : #'AI-EditDistances-Manifest'
}

{ #category : #'code-critics' }
ManifestAIEditDistances class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AIDamerauLevenshteinDistance #distanceBetween:and: #false)) #'2022-04-27T13:06:01.205162+02:00') )
]

{ #category : #'code-critics' }
ManifestAIEditDistances class >> ruleToDoCollectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AIDamerauLevenshteinDistance #distanceBetween:and: #false)) #'2022-04-27T13:05:58.266897+02:00') )
]

{ #category : #'code-critics' }
ManifestAIEditDistances class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AIDamerauLevenshteinDistance #distanceBetween:and: #false)) #'2022-04-28T14:53:50.097914+02:00') )
]
