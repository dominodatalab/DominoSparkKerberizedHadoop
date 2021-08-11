import sbt.Keys._
import sbt.file
import Dependencies._

lazy val subproject =
  Project(id = "subproject", base = file("."))
    .withStandardDominoSettings
    .checkingCoverageAt(25)
    .configs(IntegrationTest)
    .settings(
      Defaults.itSettings,
      libraryDependencies ++= Seq(
        DominoInternal.dominoScalaPrimitives
      )
    )
