pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "hacker-keyboard-reborn"

// The app: a launcher entry and the app's identity around the keyboard.
include(":app")
// droidtop's keyboard module, copied unchanged by scripts/sync-keyboard.sh (see keyboard/UPSTREAM).
include(":keyboard")
