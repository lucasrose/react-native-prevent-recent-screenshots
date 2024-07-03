package expo.modules.preventrecentscreenshots

import android.app.Activity
import android.os.Bundle
import android.os.Build
import android.view.WindowManager
import expo.modules.core.interfaces.ReactActivityLifecycleListener

class PreventRecentScreenshotsActivityLifecycleListener : ReactActivityLifecycleListener {
  override fun onResume(activity: Activity) {
    super.onResume(activity)

    if (BuildConfig.RN_PREVENT_RECENT_SCREENSHOTS && Build.VERSION.SDK_INT < 33) {
      activity.window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
    }
  }

  override fun onPause(activity: Activity) {
    super.onPause(activity)

    if (BuildConfig.RN_PREVENT_RECENT_SCREENSHOTS && Build.VERSION.SDK_INT < 33) {
      activity.window.setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);
    }
  }

  override fun onCreate(activity: Activity, savedInstanceState: Bundle?) {
    super.onCreate(activity, savedInstanceState)
        
    if(BuildConfig.RN_PREVENT_RECENT_SCREENSHOTS && Build.VERSION.SDK_INT >= 33) {
      activity.setRecentsScreenshotEnabled(false)
    }
  }
}