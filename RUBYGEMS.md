# Release to [RubyGems.org](https://rubygems.org/)

## Instructions

### Build
Build the DismissibleBlocks gem:

    cd /path/to/gem/root
    gem build dismissible_blocks.gemspec


### Push to RubyGems
Push the DismissibleBlocks gem to [RubyGems.org](https://rubygems.org/):

    gem push dismissible_blocks-<VERSION>.gem

Enter your [RubyGems.org](https://rubygems.org/) credentials if required.


### Tag
Tag the version number in the Git repository:

    git tag -a v<VERSION> -m "Version <VERSION>"


### Push to GitHub
Push commits & tags to [GitHub](https://github.com/):

    git push origin --follow-tags


---
DismissibleBlocks © 2014 [Patrick Bougie](http://patrickbougie.com/).
