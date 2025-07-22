package blackorbs.dev.fittrack_pro

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel

object EventChannelPlugin : EventChannel.StreamHandler {

    private var sink: EventChannel.EventSink? = null
    private val mainHandler = Handler(Looper.getMainLooper()) // for running on main thread

    override fun onListen(args: Any?, events: EventChannel.EventSink?) {
        sink = events
    }

    override fun onCancel(args: Any?) {
        sink = null
    }

    fun sendStats(data: String) {
        mainHandler.post {
            sink?.success(data)
        }
    }
}
