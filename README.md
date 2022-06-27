## ECR Check Tag

This github action will check whether the given tag is present in the given repository

### Inputs

#### `repository_name`

**Required** Name of the repository where the tags are to be checked

#### `tag_name`

**Required** Name of the tag to be checked in the repository

#### `AWS_KEY`

**Required** The AWS ACCESS KEY ID for the account where the command is to be run

#### `AWS_SECRET`

**Required** The AWS SECRET ACCESS KEY for the account where the command is to be run

#### `AWS_REGION`

**Required** The region where the command is to be run
_Default_ us-east-1

### Outputs

#### `exists`

`bool`, will be true if the tag exists in the repo, otherwise false
