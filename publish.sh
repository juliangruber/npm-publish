function publish(){
  npm version $1 &&
    git push --tags &&
    git push &&
    npm publish
}
