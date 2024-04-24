package com.example.fragmenttuto

import android.os.Bundle
import android.util.Log
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.FragmentActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        -Log.i("INFO","app start")

        MainActivity.setSharedInstance(this)
        addMyFragment2()
    }

    fun addMyFragment1() {

        val fragment = FragmentOneX.newInstance("n","s")
        val supportFragmentManager = supportFragmentManager
        val fragmentTransaction = supportFragmentManager.beginTransaction()
        fragmentTransaction.add(R.id.fragmentContainer, fragment)
        fragmentTransaction.addToBackStack("FragmentOne")
        fragmentTransaction.commit()
    }

    fun addMyFragment2() {

        // 1 - create a new instance of FragmentTwoX class
        val fragment = FragmentTwoX()

        // 2 - instantiate supporFragmentManager to be able to manipulate fragment(add, replace or remove)
        val supportFragmentManager = supportFragmentManager

        // 3 - create an object to start a transaction to change a fragment
        val fragmentTransaction = supportFragmentManager.beginTransaction()

        // 4 - add a new fragment
        fragmentTransaction.add(R.id.fragmentContainer, fragment)

        // 5 - add the fragment to the back stack, it will go back to the previous activity or fragment when the user press the "back" button
        fragmentTransaction.addToBackStack("FragmentTwo")

        // 6 - complete the action
        fragmentTransaction.commit()
    }

    companion object {

        // 1 - to use a singleton pattern I create this parameter
        private lateinit var instance: AppCompatActivity

        // 2 - use this to create
        fun setSharedInstance(activity: AppCompatActivity) {
            instance = activity
        }

        // 3 - just log a message in Logcat
        fun messageFromActivity() {
            Log.i("info","message from activity")
        }

        // 4 - it works just like addMyFragment2 function
        fun addFragment1FromActivity() {
            val fragment = FragmentOneX()
            val supportFragmentManager = instance.supportFragmentManager
            val fragmentTransaction = supportFragmentManager.beginTransaction()
            fragmentTransaction.add(R.id.fragmentContainer, fragment)
            fragmentTransaction.addToBackStack("FragmentOne")
            fragmentTransaction.commit()
        }

    }

}