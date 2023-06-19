# Private Selection repo

This is the private companion repo to a public transparency repo, used for orchestrated the UBI selection process.

## Contents
## [./lists](./lists)
The list dir contains lists of participants in the social income program from various NGOs. When a new list hits the master branch, two things happen:
- a new file with the prefix `hash-` is added to the [./lists](./lists) directory containing a hash for every line in that list. This is committed to this repository.
- a new file with the same name and containing _only_ the hashes is committed to the public repository. This commit will trigger the draw process on that repository.

## [./scripts](./scripts)
The scripts dir contains the bash scripts used in the [Github Actions Workflows](./github/workflows) to execute the above process.
