"
## Description

In probability and statistics, the Hellinger distance is used to quantify the similarity between two probability distributions. The Hellinger distance is defined in terms of the Hellinger integral [more info in the wikipedia page](https://en.wikipedia.org/wiki/Hellinger_distance).

The Hellinger distance is defined as:

$H^2(P,Q) = 1/2 \int (\sqrt{P(dx)} - \sqrt{Q(dx)})^{2}$, where P(x) and Q(x) are two probability distribution functions.

We can aproximate its value if we calculate n points of the probaility distrubutions for after summing them. At the end, the integral is just an infite sum.

So the above formula can be implemented as the followuing:

$H(P,Q) = \sqrt {1/2 \sum_{x=0}^{n} (\sqrt{P(x)} - \sqrt{Q(x)})^2}$

If we observe this is the same formula as the one of the integral, except that we approximating the value with the sum of n values of the evaluated probability functions.
We can take out the $1/2$ of the `sqrt` as $1/\sqrt {2}$ to have the followinf formula:

$H(P,Q) = 1/\sqrt {2} \sqrt {\sum_{x=0}^{n} (\sqrt{P(x)} - \sqrt{Q(x)})^2}$

We can see that $\sqrt {\sum_{x=0}^{n} (\sqrt{P(x)} - \sqrt{Q(x)})^2$ is nothing more than the norm of the vector $\sqrt {P} - \sqrt {Q}$.

So at the end we have:

$H(P,Q) = 1/\sqrt {2} \lVert \sqrt{P} - \sqrt{Q} \rVert$

## Usage

The following example takes two probability distributions, p and q, as input and returns the Hellinger distance between them.

```language=Pharo
| p q |

p := #(0.36 0.48 0.16).
q := #(0.33 0.33 0.33).
AIHellingerDistance new distanceBetween: p and: q.
```
"
Class {
	#name : #AIHellingerDistance,
	#superclass : #AIAbstractEditDistance,
	#category : #'AI-EditDistances-Distances'
}

{ #category : #api }
AIHellingerDistance >> distanceBetween: firstCollection and: secondCollection [

	^ (firstCollection asPMVector sqrt - secondCollection asPMVector sqrt)
		  norm / 2 sqrt
]
