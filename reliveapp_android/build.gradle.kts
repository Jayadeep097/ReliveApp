// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    // Apply Android and Kotlin plugins using aliases from the Version Catalog
    alias(libs.plugins.android.application) apply false
    alias(libs.plugins.kotlin.android) apply false

    // Use Compose plugin directly from JetBrains repository
    id("org.jetbrains.compose") version "1.5.1" apply false
}

buildscript {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://maven.pkg.jetbrains.space/public/p/compose/dev") } // JetBrains Compose repository
    }
    dependencies {
        // Google Services plugin for Firebase
        classpath("com.google.gms:google-services:4.3.15")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://maven.pkg.jetbrains.space/public/p/compose/dev") } // JetBrains Compose repository
    }
}
