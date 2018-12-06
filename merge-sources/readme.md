# Merge Sources in a Project

This script accumulates the data in several sources within a Project. The
sources to be grouped are selected by looking at their tags. The tags-list
should contain one tag per group of sources to be created. When a tag is
provided in the tags-list parameter, a new group will be created with all
the sources that have this tag. Please note that in order to be accumulated,
sources need to be compatible, so their field structure must be identical.

If no tags-list is provided, all the sources will be processed and a new
unique tag will be created based on their field names sequence.

# Inputs

- The Project that contains the sources

- The tags list that identify the groups of sources to be accumulated

# Output

- The map of tags and resulting datasets
