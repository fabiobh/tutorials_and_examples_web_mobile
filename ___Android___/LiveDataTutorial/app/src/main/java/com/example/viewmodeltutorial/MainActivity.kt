package com.example.viewmodeltutorial

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import kotlinx.android.synthetic.main.activity_main.*

// example
// https://www.youtube.com/watch?v=suC0OM5gGAA

class MainActivity : AppCompatActivity() {

    private var number: Int? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val viewModel = ViewModelProvider(this)[MainActivityViewModel::class.java]
        viewModel.timerValue.value = 15000
        viewModel.startTimer()
        viewModel.seconds().observe(this, Observer {
            myText.text = it.toString()
        })
        viewModel.finished.observe(this, Observer {
            if(it) {
                Toast.makeText(this, "Finished!",Toast.LENGTH_LONG).show()
            }
        })

        startButton.setOnClickListener {
            //viewModel.timerValue.value = 8000
            //viewModel.startTimer()

            try {
                viewModel.timerValue.value = editTextNumber.text.toString().toLong()
                viewModel.startTimer()
            } catch (e: Exception) {
                Toast.makeText(this, "Invalid Number: $e", Toast.LENGTH_LONG).show()
            }

        }

        stopButton.setOnClickListener {
            viewModel.stopTimer()
        }

    }
}