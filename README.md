![Build status](https://github.com/pharo-ai/edit-distances/actions/workflows/ci.yml/badge.svg)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![license-badge](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)

# Description

Provides methods to determine the distance between two objects, for example, between Strings. Edit distances are defined as "The minimum number of insertions, deletions, and substitutions required to transform one string into the other". Edit-based distances for which such weights can be defined are usually refered to as generalized distances. These methods are independent of a searching algorithm, i.e. Levenshtein or Hamming edit distances can be applied separately to a searching algorithm.

  - An edit distance does NOT count matches.
  - Some commonly referred "edit distances" compare corresponding elements and require objects of equal length (examples: Euclidean, Manhattan, Hamming,...)
  - To speed up computation, some distances are based in "tokens", and also referred as token-based distances (example: Cosine similarity).

## Implemented distances

  - Euclidean norm, also known as Euclidean length, L2 norm, L2 distance, l^2 norm
  - Manhattan distance, also known as City Block Distance.
  - Cosine similarity, note this is not the same as TF-IDF.
  - Levenshtein distance

# How to install it?

[//]: # (pi)
```smalltalk
EpMonitor disableDuring: [
	Metacello new
		repository: 'github://pharo-ai/edit-distances/src';
		baseline: 'AIEditDistances';
		load ]
```

# How to depend on it?

If you want to add the AIEditDistances to your Metacello Baselines or Configurations, copy and paste the following expression:
```smalltalk
spec
	baseline: 'AIEditDistances' 
	with: [ spec repository: 'github://pharo-ai/edit-distances/src' ]
```

# How to use it?
*Note: These are not the only distances implemented.*
```smalltalk  
#(0 3 4 5) distanceTo: #(7 6 3 -1) using: AIEuclideanDistance new.
#(10 20 10) distanceTo: #(10 20 20) using: AIManhattanDistance new.
#(3 45 7 2) distanceTo: #(2 54 13 15) using: AICosineSimilarityDistance new.
'zork' distanceTo: 'fork' using: AILevenshteinDistance new.
```
