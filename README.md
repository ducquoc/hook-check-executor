<<<<<<< HEAD
# hook-check-executor

check/experiment the webhook with BitBucket

1/ hook the commits/push of https://bitbucket.org/ducquoc/dq-training , to commits log (no encrypted)

2/ hook the commits/push of some other BitBucket repo (such as git@bitbucket.org:ducquoc/jutil-dq.git ), create encrypted logs

3/ hook misc integration/app (Slack, FB, PayPal, ...etc)

. . .

Callback servers might be localhost/Docker/VM, or cloud (Heroku, CloudFoundry, AWS, ...etc).




## TANSTAAFL

Please bear in mind that "There is more than one way to do it" (Perl veterans: TIMTOWTDI "tin tao đi"). Webhook is good, but it's not the only one - there are always some other ways, even the classic old Shell script (Bash, Dash, Csh, Tcsh, Ksh, Zsh, ...) can do. 

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

    `./dq_push_multi_origin_bitbucket.sh`

 Example: `ducquoc/jutil-dq` GitHub sync with `ducquoc/jutil-dq` BitBucket

    `./dq_push_multi_origin_github.sh`

 Example: `ducquoc/jutil-dq` BitBucket sync with `ducquoc/jutil-dq` GitHub

=======
JUtil dq
==========

Some utilities written in Java language.


### Rationale

This can be considered Java code snippet store of mine (kind of playground).

Just let it be ;-)

### Usage

**Basic Usage**

Change directory to sub-folders and build the project.

You may also execute the main class of some.

#### Samples

  $ cd jutil

  $ mvn clean install


#### Running samples

  $ mvn compile exec:java -Dexec.classpathScope=compile -Dexec.mainClass=vn.ducquoc.jutil.App

  $ mvn exec:java -Dexec.mainClass=vn.ducquoc.jutil.App

>>>>>>> up_bb/master
