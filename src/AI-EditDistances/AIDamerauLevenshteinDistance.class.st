"
The Damerau-Lavenshtein distance is a string metric for measuring the edit distance between two sequences.

The difference between this distance and the restricted Damerau-Levenshtein distance consists in that the restricted one computes the number of edit operations needed to make the strings equal under the condition that no substring is edited more than once, **whereas this algorithm presents no such restriction.**

See also: Restricted Damerau-Levenshtein distance comment class.

"
Class {
	#name : 'AIDamerauLevenshteinDistance',
	#superclass : 'AIAbstractEditDistance',
	#instVars : [
		'distanceMatrix'
	],
	#classInstVars : [
		'int'
	],
	#category : 'AI-EditDistances-Distances',
	#package : 'AI-EditDistances',
	#tag : 'Distances'
}

{ #category : 'private' }
AIDamerauLevenshteinDistance >> calculateMinValue: cost at: i at: j using: lastMatchingRow and: lastMatchColumn [
	"Here we calculate the value of all the possible operations we can do (addition, deletion, substitution and transposition).
	
	- Each operation costs 1.
 
	- To calculate the transposition cost we do:
						 The value of the cost before transposition which is the value of cell (distanceMatrix at: lastMatchingRow - 1 at: lastMatchColumn - 1)
							+
						 The distance between rows
							+
						 1 (for the cost of the transposition itself - since it's an operation)
							+
						 The distance between columns.
						
	- The distances that we sum here count the number of characters in between the transposed characters. We substract 1 to exclude the current cell from the count.
						
	- We make sure our lastMatchingRow and lastMatchColumn variables are greater than 1 so when calculating the value of this we don't get a (0,0) cell - since it 	does not 	exist."

	| addition deletion substitution transposition minValue upperCell leftCell upperLeftCell |
    
    upperCell := distanceMatrix atColumn: j atRow: i - 1.
    addition := upperCell + 1.
    
    leftCell := distanceMatrix atColumn: j - 1 atRow: i.
    deletion := leftCell + 1.
    
    upperLeftCell := distanceMatrix atColumn: j - 1 atRow: i - 1.
    substitution := upperLeftCell + cost.
    
    transposition := Float infinity.
    (lastMatchingRow > 1 and: [ lastMatchColumn > 1 ])
        ifTrue: [ 
            transposition := (distanceMatrix atColumn: lastMatchColumn - 1 atRow: lastMatchingRow - 1)
                + (i - lastMatchingRow - 1)
                + 1
                + (j - lastMatchColumn - 1) ].
                
    minValue := { addition . deletion . substitution . transposition } min.
    distanceMatrix atColumn: j atRow: i put: minValue
]

{ #category : 'private' }
AIDamerauLevenshteinDistance >> damerauLevenshteinAlgorithmFor: firstString and: secondString [
	" Here we implement the Damerau-Levenshtein algorithm.
	
	- LastMatchingRow indicates the last row with the current column's character.
	- LastMatchColumn indicates the last column in this row where the characters matched.
	(Reminder : column's characters belong to the second string and row's characters to the first string) "

	| cost lastMatchColumn secondStringChar firstStringChar lastMatchingRow charPositions |
    
    self initializeDistanceMatrixWith: firstString and: secondString.
    charPositions := Dictionary new.
    
    3 to: distanceMatrix height do: [ :i | 
        firstStringChar := firstString at: i - 2.
        lastMatchColumn := 1.
        
        3 to: distanceMatrix width do: [ :j |
            secondStringChar := secondString at: j - 2.
            lastMatchingRow := charPositions at: secondStringChar ifAbsent: 1.
            
            cost := secondStringChar = firstStringChar
                ifTrue: [ 0 ]
                ifFalse: [ 1 ].
                
            cost = 0 ifTrue: [ lastMatchColumn := j ].
            
            self calculateMinValue: cost at: i at: j using: lastMatchingRow and: lastMatchColumn ].
        
        charPositions at: firstStringChar put: i ]
]

{ #category : 'api' }
AIDamerauLevenshteinDistance >> distanceBetween: firstString and: secondString [

	firstString isEmpty ifTrue: [ ^ secondString size ].
    secondString isEmpty ifTrue: [ ^ firstString size ].
    
    self damerauLevenshteinAlgorithmFor: firstString and: secondString.
    
    ^ distanceMatrix
        atColumn: distanceMatrix width
        atRow: distanceMatrix height
]

{ #category : 'accessing' }
AIDamerauLevenshteinDistance >> distanceMatrix [
	^ distanceMatrix
]

{ #category : 'accessing' }
AIDamerauLevenshteinDistance >> distanceMatrix: aCollection [ 
	distanceMatrix := aCollection
]

{ #category : 'private' }
AIDamerauLevenshteinDistance >> fillFirstTwoRowsAndColumnsWith: firstString and: secondString [
	"It fills the first row and column with the maxDistance value and the second row and column with values starting with 0"

	| maxDistance |
    maxDistance := firstString size + secondString size.
    
    1 to: distanceMatrix height do: [ :i | 
        distanceMatrix atColumn: 1 atRow: i put: maxDistance ].
    
    1 to: distanceMatrix width do: [ :j | 
        distanceMatrix atColumn: j atRow: 1 put: maxDistance ].
    
    2 to: distanceMatrix height do: [ :i | 
        distanceMatrix atColumn: 2 atRow: i put: i - 2 ].
    
    2 to: distanceMatrix width do: [ :j | 
        distanceMatrix atColumn: j atRow: 2 put: j - 2 ].
        
    distanceMatrix atColumn: 2 atRow: 2 put: 0.
]

{ #category : 'private' }
AIDamerauLevenshteinDistance >> initializeDistanceMatrixWith: firstString and: secondString [

	distanceMatrix := CTArray2D
        width: secondString size + 2
        height: firstString size + 2.
    
    distanceMatrix atAllPut: 0.
    self fillFirstTwoRowsAndColumnsWith: firstString and: secondString
]
