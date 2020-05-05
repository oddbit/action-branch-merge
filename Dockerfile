FROM alpine:latest

LABEL repository="https://github.com/oddbit/action-branch-merge"
LABEL homepage="https://github.com/oddbit/action-branch-merge"
LABEL "com.github.actions.name"="Branch Merge"
LABEL "com.github.actions.description"="Automatically merge branches"
LABEL "com.github.actions.icon"="git-merge"
LABEL "com.github.actions.color"="green"

RUN apk --no-cache add bash curl git jq

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
