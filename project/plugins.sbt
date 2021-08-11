
resolvers += "Domino Private Artifactory" at "https://domino.jfrog.io/domino/domino-private/"
credentials += Credentials("Artifactory Realm", "domino.jfrog.io", "domino-dependencies", "mYfmys-0dewno-huktav")

addSbtPlugin("com.dominodatalab" % "sbt-settings" % "1.0.29")
