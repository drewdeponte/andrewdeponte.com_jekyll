# Personal Site

This repository houses my personal site using GitHub Pages. The following will
provide all the details on how have set it up and what the everyday use of it
should look like.

## Getting Up & Running

My personal site depends on [RVM](http://rvm.io) so it must be installed and working properly.
It also depends on [Bundler](http://bundler.io) to manage all of its
dependencies. Therefore, keep in mind you must have bundler installed in the
Ruby version defined by the `.ruby-verison` file.

To get things up and running you can follow the following steps:

1. Clone the git repository
2. `cd` into the cloned repository (triggers RVM to set ruby version and
   gemset via `.ruby-version` file)
3. `bundle`

The above will install all the necessary tools in the proper Ruby version and
gemset. At this point you should be ready to move on and get into normal
usage.

## Branches

There are two important branches is this repository.

* **master** - this branch houses the static html (produced by jekyll) of the
  site. Basically, you should ideally never work in the branch, it is intended
  to be a branch where the generated static html is stored for GitHub to
  host.
* **jekyll-site-src** - this branch houses the raw jekeyll sources for the site
  which are then translated into the static html. This is the branch you want
  to do your actual authoring in.

## Writing a Blog Post

1. Checkout the **jekyll-site-src** branch if not already on it.
2. Run `./_scripts/post` from the project's root path and answer the
   questions. It will then popup Vim to let you write the blog post using
   markdown.
3. Save the file.
4. Stage and Commit the blog post file you previously wrote.

## Publishing the Site

1. Checkout the **jekyll-site-src** branch if not already on it.
2. If there are any un-committed changes either commit them or stash them
   appropriately.
3. Run `./_scripts/publish` from the project's root path.

The above helper script should handle building the static html site from the
jekyll sources, copying that generated static html site over to the **master**
branch, committing the changes, pushing the changes up to GitHub, and
checking back out the **jekyll-site-src** branch to allow you to pickup where
you left off.

## Editing the Site

1. Checkout the **jekyll-site-src** branch if not already on it.
2. Make any changes to the templates or the site (this is too broad a topic to
   cover here, look into [Jekyll](http://jekyllrb.com) for more details).
3. Test the results `jekyll serve` and then `open http://localhost:4000`
4. Rinse and repeat
5. Publish the Site as described in the above section.

