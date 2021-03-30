set -e

echo "** XCode ***";

rm -rf ~/Library/Developer/Xcode/DerivedData/
rm -rf ~/Library/Developer/Xcode/Archives/
rm -rf ~/Library/Developer/Xcode/iOS\ Device\ Logs/

echo "\n\n*** Gradle ***";

rm -rf ~/.gradle/daemon/
rm -rf ~/.gradle/caches/
rm -rf ~/.gradle/wrapper/dists/

echo "\n\n*** Brew ***";

brew update 
brew upgrade
brew cleanup
brew unlink fastlane && brew link fastlane

rm -rf ~/yarn.log ~/node_modules

echo "\n\n*** Gem Cleanup ***";

gem cleanup --dryrun

echo "\n\n*** Docker ***";

{
  docker system prune -a -f --volumes
} || { 
  echo "Docker fail"
}

echo "\n\n*** Yarn ***";

yarn cache clean

echo "\n\n*** Npm ***";

NCU_OUTPUT=$(ncu -g)
echo $NCU_OUTPUT;

SAVEIFS=$IFS
IFS=$'\n'
NCU_LINES=($NCU_OUTPUT)
IFS=$SAVEIFS

NCU_LAST_LINE=${NCU_LINES[${#NCU_LINES[@]}-1]}

if [[ $NCU_LAST_LINE == npm* ]] ;
then
  eval $NCU_LAST_LINE;
fi

npm cache clean --force

echo "\n\n*** watchman ***";

watchman watch-del-all