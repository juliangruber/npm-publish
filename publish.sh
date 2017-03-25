function publish(){
  git push &&
    travis-watch &&
    npm version $1 &&
    git push --tags &&
    git push &&
    travis-watch &&
    npm publish
}

