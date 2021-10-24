# Readme

## Quickstart

1. `docker build -t keet .`
2. `docker run --rm -it -v "$(pwd)":/app keet bash`
    - This will change

I tend to use git like another file save. Commit small and frequently. This can
get me in trouble if I'm in a project with heavy rebasing teammates. So I'll
generally clean up and squash the commits before I open a PR for the branch I'm on.

For small projects like this, I personally commit to master for a couple commits
before I find a need to checkout a new branch. For this assessment, I'm going to
pretend like this is a big production project and branch off early.

For this project I'm going to stick with Minitest. I've been using it a lot lately
and I like its simplicity and speed. Plus it is very similar to Python's Unittest
library.
