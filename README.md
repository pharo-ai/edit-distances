[![Build status](https://github.com/pharo-ai/edit-distances/workflows/CI/badge.svg)](https://github.com/pharo-ai/edit-distances/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/edit-distances/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/edit-distances?branch=master)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![license-badge](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)

## Table of contents

- [Description](#description)
- [How to install it](#how-to-install-it)
- [How to depend on it](#how-to-depend-on-it)
- [Implemented distances](#implemented-distances)
- [Examples](#example-1-using-manhattan-distance)


## Description

For more information please refer to the [Pharo-AI wiki](https://github.com/pharo-ai/wiki/blob/master/wiki/StringMatching/Edit-distances.md)

Edit distance is a way of quantifying how dissimilar two strings are to one another by counting the minimum number of operations required to transform one string into the other. The distance between the two documents is defined as "The minimum number of insertions, deletions, and substitutions required to transform one string into the other". Edit-based distances for which such weights can be defined are usually refered to as generalized distances. These methods are independent of a searching algorithm, i.e. Levenshtein or Hamming edit distances can be applied separately to a searching algorithm.

Edit distances find applications in natural language processing, where automatic spelling correction can determine candidate corrections for a misspelled word by selecting words from a dictionary that have a low distance to the word in question.

This package provides methods to determine the distance between two objects, for example, between Strings. Those objects, often represents documents. Normally they are strings but also they can be arrays of numbers that represent a document.

  - An edit distance does NOT count matches.
  - Some commonly referred "edit distances" compare corresponding elements and require objects of equal length (examples: Euclidean, Manhattan, Hamming,...)
  - To speed up computation, some distances are based in "tokens", and also referred as token-based distances (example: Cosine similarity).

## How to install it

```smalltalk
EpMonitor disableDuring: [
	Metacello new
		repository: 'github://pharo-ai/edit-distances/src';
		baseline: 'AIEditDistances';
		load ]
```

## How to depend on it

If you want to add the AIEditDistances to your Metacello Baselines or Configurations, copy and paste the following expression:

```smalltalk
spec
	baseline: 'AIEditDistances' 
	with: [ spec repository: 'github://pharo-ai/edit-distances/src' ]
```

## Implemented distances

These are the currently implemented distance. Note that we are currently working on this project so we will be implementing more distance in the future.

  - Euclidean norm, also known as Euclidean length, L2 norm, L2 distance, l^2 norm
  - Manhattan distance, also known as City Block Distance.
  - Cosine similarity, note this is not the same as TF-IDF.
  - Levenshtein distance
  - Kendall Tau distance
  - Szymkiewicz-Simpson coefficient
  - Shingles similarity

All the distances are implemented the strategy design pattern. They have the same API.

They are two ways of calculating the distance.

One is to use the method `distanceTo: aCollection using: aDistance`.

Or to use `aDistance distanceBetween: xCollection and: yCollection`

### Example 1: Using Manhattan distance

```st
#(10 20 10) distanceTo: #(10 20 20) using: AIManhattanDistance new "10".
```

```st
manhattanDistance := AIManhattanDistance new.
manhattanDistance distanceBetween: #( 10 20 10 ) and: #( 10 20 20 ). "10"
```

### Example 2: Using Levenshtein distance

```st
'zork' distanceTo: 'fork' using: AILevenshteinDistance new.
```

```st
levenshteinDistance := AILevenshteinDistance new.
levenshteinDistance distanceBetween: 'zork' and: 'fork' "1"
```
