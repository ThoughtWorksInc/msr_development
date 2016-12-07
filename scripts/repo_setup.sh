YELLOW='\033[1;33m'
NC='\033[0m' # No Color

function clone_repos() {
	while read -r REPO ; do
		REPO_FILENAME=$(basename $REPO)
		REPO_NAME=${REPO_FILENAME%.*}
		if ! [[ -d $REPO_NAME ]] ; then
			git clone $REPO
		else
			printf "${YELLOW}IGNORED${NC} $REPO_NAME repository already exists\n"
		fi
	done < $1
}