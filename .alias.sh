alias lsh='ls -ld .?*'

# AWS
alias aws-test-credential='aws sts get-caller-identity'
#

alias yarn-install-production='yarn install --production --frozen-lockfile'
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
alias pu='./vendor/bin/phpunit'
alias pux='./vendor/bin/phpunit --testdox'
alias pdu='php artisan dusk'
alias pdux='php artisan dusk --testdox'
alias pduxf='php artisan dusk:fails --testdox'
alias gcpins='gcloud compute instances'
