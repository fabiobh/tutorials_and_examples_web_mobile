package com.example.viewmodeltutorial

import androidx.lifecycle.ViewModel

class MainActivityViewModel: ViewModel() {

    var number = 7
    fun addNumber() {
        number++
    }
}