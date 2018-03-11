# Release to [RubyGems.org](https://rubygems.org/)

## Instructions

### Build
Build the DismissibleBlocks gem:

    cd /path/to/gem/root
    gem build dismissible_blocks.gemspec


### Push
Push the DismissibleBlocks gem to [RubyGems.org](https://rubygems.org/):

    gem push dismissible_blocks-<VERSION>.gem

Enter your [RubyGems.org](https://rubygems.org/) credentials if required.


### Tag
Tag the version number in the Git repository:

    git tag -a v<VERSION> -m "Version <VERSION>"


--
DismissibleBlocks is copyright © 2014 [Patrick Bougie](http://patrickbougie.com/). It is free software and may be redistributed under the terms specified in the LICENSE.text file.
