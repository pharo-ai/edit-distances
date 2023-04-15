"
## Description

In probability and statistics, the Hellinger distance is used to quantify the similarity between two probability distributions.

## Usage

The following example takes two probability distributions, p and q, as input and returns the Hellinger distance between them. The method iterates over the probability values, calculates the squared difference of the square roots, sums them up, and finally multiplies the square root of the sum by `(1 / (2 sqrt))`.

```language=Pharo
| p q |

p := #(0.36 0.48 0.16).
q := #(0.33 0.33 0.33).
AIHellingerDistance distanceBetween: p and: q.
```
"
Class {
	#name : #AIHellingerDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #api }
AIHellingerDistance >> distanceBetween: firstCollection and: secondCollection [

    | numberOfElements |

	(numberOfElements := firstCollection size) = secondCollection size
		ifFalse: [ self error: 'Distributions must have the same size' ].

    ^ (1 / 2 sqrt) * ((1 to: numberOfElements)
        inject: 0
        into: [ :sum :i | sum + ((firstCollection at: i) sqrt - (secondCollection at: i) sqrt) squared.
        ]) sqrt
]
