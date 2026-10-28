package dev.droidtop.hackerkeyboard

import android.app.Activity
import android.content.Intent
import android.os.Bundle

/**
 * The app's icon: opens the keyboard's own start screen (Hacker's Keyboard's Main, where it is enabled and chosen
 * as the input method, with its settings one tap away). The keyboard module keeps Main off the launcher because
 * droidtop, which embeds it, has one icon of its own.
 */
class LauncherActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        startActivity(Intent().setClassName(this, "org.pocketworkstation.pckeyboard.Main"))
        finish()
    }
}
