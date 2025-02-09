pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
    // Include Flutter plugin from the local Flutter SDK
    includeBuild("${System.getenv("FLUTTER_HOME") ?: "C:/FLUTTER/flutter"}/packages/flutter_tools/gradle")
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
    versionCatalogs {
        create("libs") {
            from(files("gradle/libs/libs.versions.toml")) // Ensure this file exists in the correct path
        }
    }
}

rootProject.name = "reliveapp"
include(":app")
