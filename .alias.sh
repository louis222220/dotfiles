alias lsh='ls -ld .?*'

# AWS
alias aws-test-credential='aws sts get-caller-identity'
function upload-s3-shared () {
	if [[ $# -eq 0 ]] ; then
		echo "a local file as an argument is required"
		return 1
	fi
	aws s3 cp $1 s3://louis-shared-warehouse/ --acl public-read --profile=louis
}
#

function curl-header-only () {
	if [[ $# -eq 0 ]] ; then
		echo "URL as an argument is required"
		return 1
	fi
	curl -sSLD - $1 -o /dev/null
}

alias composer-install-production='composer install --optimize-autoloader --no-dev --no-interaction'

alias yarn-install-production='yarn install --production --frozen-lockfile'

alias npm-install-production='npm ci --production'

function tree-node () {
	if [ -d "./node_modules" ]
	then
		echo "Ignore node_modules:"
		tree -I node_modules
	else
		tree
	fi
}

function gb-pull-prune () {
	merged_branch=$(git branch --show-current)
	default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | cut -d '/' -f4)
	git checkout $default_branch &&
	git pull &&
	git remote prune origin
	git branch -d $merged_branch
}

alias gc-finish-amend='git commit -a -v --amend --no-edit && git reset head~ && git add --all && git commit'

function nvm-start () {
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
	echo "node version: $(node --version)"
	echo "npm version: $(npm --version)"
	echo "yarn version: $(yarn --version)"
}

function nvm-upgrade () {
	nvm-start
	(
		cd "$NVM_DIR"
		git fetch --tags origin
		git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
	) && \. "$NVM_DIR/nvm.sh"
}

