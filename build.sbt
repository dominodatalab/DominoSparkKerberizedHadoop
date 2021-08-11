lazy val subproject = project in file("subproject")

lazy val templateAll = Project(id="template-all", base=file("."))
  .withStandardDominoSettings
  .aggregate(
    subproject
  )
  .settings(publish := { }) // Don't publish the root project
