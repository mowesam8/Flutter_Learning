import com.android.build.gradle.BaseExtension

plugins {
    id("com.android.application") apply false
    id("com.google.gms.google-services") version "4.5.0" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    // Legacy Flutter plugins (e.g. cloud_firestore <4) define custom BuildConfig
    // fields, which AGP 8 disables by default. Registered before
    // evaluationDependsOn, which can trigger eager evaluation.
    afterEvaluate {
        extensions.findByType(BaseExtension::class.java)?.buildFeatures?.buildConfig = true
    }

    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
