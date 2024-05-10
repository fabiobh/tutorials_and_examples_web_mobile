package com.example.hilttutorialv2

import android.util.Log
import javax.inject.Inject

class House @Inject constructor() {
    fun alert() {
        Log.i("_I_","alert")
    }
}