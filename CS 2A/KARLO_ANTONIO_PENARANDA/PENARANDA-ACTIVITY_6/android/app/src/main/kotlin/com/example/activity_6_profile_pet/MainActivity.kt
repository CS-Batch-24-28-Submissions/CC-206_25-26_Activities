package com.example.activity_6_profile_pet

import android.media.MediaPlayer
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private var mediaPlayer: MediaPlayer? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "activity_6_profile_pet/pet_sound",
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "playDogBark" -> {
                    try {
                        playDogBark()
                        result.success(null)
                    } catch (exception: Exception) {
                        result.error(
                            "DOG_BARK_ERROR",
                            "Unable to play the dog bark sound.",
                            exception.localizedMessage,
                        )
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun playDogBark() {
        mediaPlayer?.release()

        val assetPath = flutterAssets.getAssetFilePathByName("assets/audio/dog_bark.wav")
        val assetFileDescriptor = assets.openFd(assetPath)
        assetFileDescriptor.use { descriptor ->
            mediaPlayer = MediaPlayer().apply {
                setDataSource(
                    descriptor.fileDescriptor,
                    descriptor.startOffset,
                    descriptor.length,
                )
                setOnCompletionListener { player ->
                    player.release()
                    if (mediaPlayer == player) {
                        mediaPlayer = null
                    }
                }
                prepare()
                start()
            }
        }
    }

    override fun onDestroy() {
        mediaPlayer?.release()
        mediaPlayer = null
        super.onDestroy()
    }
}
