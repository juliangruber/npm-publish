function publish(){
  hash ci-watch 2>/dev/null || echo "Warning: ci-watch not installed. https://github.com/juliangruber/ci-watch"
  hash gh-release-download 2>/dev/null || echo "Warning: gh-release-download not installed. https://github.com/juliangruber/gh-release-download"

  bell(){
    echo -ne '\007'
  }

  quit(){
    bell
    return $1
  }

  git push || quit 1
  hash ci-watch 2>/dev/null && ci-watch 2>/dev/null
  npm version $1 || quit 1
  git push --tags || quit 1
  git push || quit 1
  hash ci-watch 2>/dev/null && ci-watch 2>/dev/null
  hash gh-release-download 2>/dev/null && gh-release-download
  npm publish || quit 1
  quit 0
}

