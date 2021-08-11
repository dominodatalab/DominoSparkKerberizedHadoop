# scala-jar-template

[![CircleCI](https://circleci.com/gh/cerebrotech/scala-jar-template/tree/master.svg?style=svg&circle-token=cc7c296a75720668e6f8f7144a64c59a990d7eb6)](https://circleci.com/gh/cerebrotech/scala-jar-template/tree/master)

Service Owner | Status
--------------|--------
@chrismyang   | Stable


## Responsibility

This repo is a template for repos that build a Scala SBT project into a standalone JAR.  This is meant to be used as a
[template repo](https://help.github.com/en/articles/creating-a-template-repository) in GitHub.

After creating your new repo, you'll also need to do the following steps:

1. Add your [new repo to CircleCI](https://circleci.com/add-projects/gh/cerebrotech)
2. In the new CircleCI project, [import environment variables](https://circleci.com/gh/cerebrotech/scala-jar-template/edit#env-vars)
   from the cerebrotech/scala-jar-template project
3. Try a build and confirm your JAR has succeeded and pushed to JFrog
4. Grant write access to the Engineering team to the repo
5. (Optional) [Create a token](https://circleci.com/gh/cerebrotech/scala-jar-template/edit#api) to embed a status badge in the
   README.  Replace the `circle-token` value above in this file.
