# DEFINING COLOR
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

if [[ $# == 0 ]]; then
    printf "${RED}ERROR${NC}: Please specify your project location as an argument\n"
    echo "       ./install.sh <your-git-directory>"
    exit 1
fi

if ! [ -d "$1" ]; then
    printf "${RED}ERROR${NC}: The location '$1' is not a valid directory\n"
    exit 1
fi

GIT_DIR="$1/.git"
GIT_HOOKS_DIR="$1/.git/hooks"

if ! [ -d "$GIT_DIR" ]; then
    printf "${RED}ERROR${NC}: The location '$1' is not a valid ${RED}git${NC} directory.\n"
    exit 1
fi

PRE_COMMIT_FILE="$GIT_HOOKS_DIR/pre-commit"
PRE_PUSH_FILE="$GIT_HOOKS_DIR/pre-push"

if [ -f "$PRE_COMMIT_FILE" ]; then
    printf "${RED}ERROR${NC}: There's already a pre-commit hook on this project located at '$PRE_COMMIT_FILE'\n"
    echo "       Please remove it or name it something else so we don't override it."
    exit 1
fi

if [ -f "$PRE_PUSH_FILE" ]; then
    printf "${RED}ERROR${NC}: There's already a pre-push hook on this project located at '$PRE_PUSH_FILE'\n"
    echo "       Please remove it or name it something else so we don't override it."
    exit 1
fi

SCRIPTS_DIR="scripts"
cp $SCRIPTS_DIR/pre-commit $GIT_HOOKS_DIR
cp $SCRIPTS_DIR/pre-push $GIT_HOOKS_DIR
cp $SCRIPTS_DIR/lint-staged-files $GIT_HOOKS_DIR

printf "${GREEN}INSTALLATION SUCCESSFUL${NC}\n"
exit 0

