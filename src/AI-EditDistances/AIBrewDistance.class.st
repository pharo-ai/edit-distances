"
## Description

Given two strings, obtain the number of edits required to make the first the same as the second. It is used typically when weighing multiple potentially similar strings in a data set.

This algorithm separate costs for deletion (DEL) and insertion (INS) operations, so it allows you to differentiate between the two operations and assign different weights to them if needed. The edit cost can be configured by sending the `cost:` message to an instance of this class. The cost is an `Array` of positive `Integer` interpreted as:

  - Match (0 is the default cost)
  - Insertion (1 is the default cost)
  - Deletion (1 is the default cost)
  - Substitution (1 is the default cost)

## Relation with the Wagner-Fischer algorithm

Although the Brew edit distance and Wagner-Fischer algorithm are both used to compute the edit distance between two strings, there are some differences between them:

- Cost of operations: In the Wagner-Fischer algorithm, the cost of insertion and deletion operations is the same, while in the Brew edit distance, you can have separate costs for deletion (DEL) and insertion (INS) operations. This allows you to differentiate between the two operations and assign different weights to them if needed.
- Substitution operation: The Brew edit distance algorithm includes a separate substitution (SUBST) operation, making it distinct from the match (MATCH) operation. This allows you to assign a different cost to substitutions compared to matches. In the Wagner-Fischer algorithm, a substitution is treated as a combination of deletion and insertion.
- Edit operation description: The Brew edit distance algorithm provides the description of the edits needed to transform the first string into the second one. This feature allows you to understand the specific edit operations that were performed to achieve the final edit distance. The Wagner-Fischer algorithm does not provide this information by default, although it can be modified to track the edit operations as well.

In summary, the Brew edit distance offers more flexibility in terms of operation costs and provides a description of the edit operations, while the Wagner-Fischer algorithm is a more straightforward approach to calculating the edit distance between two strings.
"
Class {
	#name : 'AIBrewDistance',
	#superclass : 'AIAbstractEditDistance',
	#instVars : [
		'cost'
	],
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'accessing' }
AIBrewDistance >> cost [
	"Answer an <Array> with the cost of edit operations as: 
		1st element: Match
		2nd element: Insert
		3rd element: Deletion
		4th element: Substitution "

	^ cost

]

{ #category : 'accessing' }
AIBrewDistance >> cost: anArray [
	"Set the receiver's cost of edit operations to anArray"

	cost := anArray
]

{ #category : 'api' }
AIBrewDistance >> distanceBetween: firstString and: secondString [
	" Keep track of the edit steps and their costs in a 2D array. "

	| n m matrix minCost |

	n := firstString size.
	m := secondString size.
	"Initialize matrix of (n + 1) x (m + 1) dimensions"
	matrix := Array new: n + 1 withAll: (Array new: m + 1 withAll: 0).

	"Initialize the first row and column"
	1 to: n + 1 do: [ :i | 
		matrix at: i put: ((matrix at: i)
				 copyReplaceFrom: 1
				 to: 1
				 with: (Array with: i - 1 * (self cost at: 2))) ].
	1 to: m + 1 do: [ :j | 
		matrix at: 1 put: ((matrix at: 1)
				 copyReplaceFrom: j
				 to: j
				 with: (Array with: j - 1 * (self cost at: 3))) ].

	"Calculate the minimum cost matrix"
	2 to: n + 1 do: [ :i | 
		2 to: m + 1 do: [ :j | 
			minCost := (firstString at: i - 1) = (secondString at: j - 1)
				           ifTrue: [ ((matrix at: i - 1) at: j - 1) + (self cost at: 1) ]
				           ifFalse: [ ((matrix at: i - 1) at: j - 1) + (self cost at: 4) ].
			matrix
				at: i
				put: ((matrix at: i) copyReplaceFrom: j to: j with: (Array with:
							  ((minCost min: ((matrix at: i - 1) at: j) + (self cost at: 2)) min:
								   ((matrix at: i) at: j - 1) + (self cost at: 3)))) ] ].

	"Answer the value at the bottom-right corner of the matrix, which represents the Brew distance between the two input strings."
	^ (matrix at: n + 1) at: m + 1
]

{ #category : 'initialization' }
AIBrewDistance >> initialize [
	" Initialize the cost Array "

	super initialize.
	cost := #( 0 1 1 1 )
]
