# hook-check-executor

check/experiment the webhook with BitBucket

1/ hook the commits/push of https://bitbucket.org/ducquoc/dq-training , to commits log (no encrypted)

https://bitbucket.org/ducquoc/dq-training/commits/764428cb

2/ hook the commits/push of some other BitBucket repo (such as git@bitbucket.org:ducquoc/jutil-dq.git ), create encrypted logs

3/ hook misc integration/app (Slack, FB, PayPal, ...etc)

. . .

Callback servers might be localhost/Docker/VM, or cloud (Heroku, CloudFoundry, AWS, Google Cloud, ...etc).




## TANSTAAFL

Please bear in mind that "There is more than one way to do it" (Perl veterans: TIMTOWTDI "tin tao đi"). 

Webhook is good, but it's not the only one - there are always some other ways, even the classic old Shell script (Bash, Dash, Csh, Tcsh, Ksh, Zsh, ...) can do. 

See: 

https://ducquoc.wordpress.com/2011/11/19/ssh-without-password/
```
https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html
https://docs.gitlab.com/ee/gitlab-basics/create-your-ssh-keys.html
```

if you want to use the scripts to sync between Git repos: 

    `./dq_push_sync_fork_github.sh`
 
 Example: ducquoc/leadership forked from webflow/leadership 

    `./dq_push_sync_fork_github.sh git@github.com:webflow/leadership.git ../leadership`

 Example: `ducquoc/jutil-dq` GitHub sync with `ducquoc/jutil-dq` BitBucket

    `./dq_push_multi_origin_github.sh`

 Example: `ducquoc/jutil-dq` BitBucket sync with `ducquoc/jutil-dq` GitHub

    `./dq_push_multi_origin_bitbucket.sh`


## Misc

To "undo" the wrong commit, there are several ways but for clarity I would recommend git "revert" 

    `git revert <commit>`

Actual use may including "-m" option like this: 

    `git revert -m 1 HEAD`


Any feedback, please email to: dqonline@ducquoc.net , or use the existing PR/Issue feature of GitHub.

https://ducquoc.wordpress.com/2011/05/02/charity-begins-at-home/

