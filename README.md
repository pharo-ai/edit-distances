[![license-badge](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

# Table of Contents

- [Description](#description)
- [Installation](#installation)
  - [Baseline String](#baseline-string)
- [Usage](#usage)
  - [Subsection1](#subsection1)
- [Implementation notes](#implementation-note)
- [Contribute](#contribute)
  - [Version management](#version-management)
- [License](#license)

# Description

Provides methods to determine the distance between two objects, for example, between Strings. Edit distances are defined as "The minimum number of insertions, deletions, and substitutions required to transform one string into the other". Edit-based distances for which such weights can be defined are usually refered to as generalized distances. These methods are independent of a searching algorithm, i.e. Levenshtein or Hamming edit distances can be applied separately to a searching algorithm.

  - An edit distance does NOT count matches.
  - Some commonly referred "edit distances" compare corresponding elements and require objects of equal length (examples: Euclidean, Manhattan, Hamming,...)
  - To speed up computation, some distances are based in "tokens", and also referred as token-based distances (example: Cosine similarity).

# Implemented distances

  - Euclidean norm, also known as Euclidean length, L2 norm, L2 distance, l^2 norm
  - Manhattan distance, also known as City Block Distance.
  - Cosine similarity, note this is not the same as TF-IDF.
  - Levenshtein distance

# Installation

[//]: # (pi)
```smalltalk
EpMonitor disableDuring: [ 
	Metacello new
		baseline: 'AIEditDistances';
		repository: 'github://pharo-ai/edit-distances/src';
		load ].
```

## Baseline String 

If you want to add the AIEditDistances to your Metacello Baselines or Configurations, copy and paste the following expression:
```smalltalk
	" ... "
	spec
		baseline: 'AIEditDistances' 
		with: [ spec repository: 'https://github.com/pharo-ai/edit-distances.git' ];
	" ... "
```

# Usage

```smalltalk  
#(0 3 4 5) distanceTo: #(7 6 3 -1) using: AIEuclideanDistance new.
#(10 20 10) distanceTo: #(10 20 20) using: AIManhattanDistance new.
#(3 45 7 2) distanceTo: #(2 54 13 15) using: AICosineSimilarityDistance new.
'zork' distanceTo: 'fork' using: AILevenshteinDistance new.
```

# Contribute

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)

If you have discovered a bug or have a feature suggestion, feel free to create an issue on Github.
If you have any suggestions for how this package could be improved, please get in touch or suggest an improvement using the GitHub issues page.
If you'd like to make some changes yourself, see the following:    

  - Fork this repository to your own GitHub account and then clone it to your local device
  - Do some modifications
  - Test.
  - Add <your GitHub username> to add yourself as author below.
  - Finally, submit a pull request with your changes!
  - This project follows the [all-contributors specification](https://github.com/kentcdodds/all-contributors). Contributions of any kind are welcome!

## Version management 

This project use semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** defines the major version number
- **Y** defines the minor version number 
- **Z** defines the patch version number

When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.
