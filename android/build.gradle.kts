// ===== Project-level build.gradle.kts =====

buildscript {
    extra["kotlin_version"] = "1.9.10"
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.1.1")
        classpath("com.google.gms:google-services:4.3.15") // Firebase
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Custom build directory logic (Kotlin DSL compliant)
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val subBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(subBuildDir)
    project.evaluationDependsOn(":app")
}

// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
