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
        /*
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
        */
        Log.i("INFO","app start")
        //addMyFragment3()

        MainActivity.setSharedInstance(this)
        addMyFragment2()
    }

    fun addMyFragment1() {
        /*
        addFragement
        replaceFragment
        removeFragment
        */
        val fragment = FragmentOneX.newInstance("n","s")
        val supportFragmentManager = supportFragmentManager
        val fragmentTransaction = supportFragmentManager.beginTransaction()
        fragmentTransaction.add(R.id.fragmentContainer, fragment)
        fragmentTransaction.addToBackStack("FragmentOne")
        fragmentTransaction.commit()
    }

    fun addMyFragment2() {

        val fragment = FragmentTwoX()
        val supportFragmentManager = supportFragmentManager
        val fragmentTransaction = supportFragmentManager.beginTransaction()
        fragmentTransaction.add(R.id.fragmentContainer, fragment)
        fragmentTransaction.addToBackStack("FragmentTwo")
        fragmentTransaction.commit()
    }

    fun addMyFragment3() {
/*
        val fragment = FragmentThreeX()
        val supportFragmentManager = supportFragmentManager
        val fragmentTransaction = supportFragmentManager.beginTransaction()
        fragmentTransaction.add(R.id.fragmentContainer, fragment)
        fragmentTransaction.addToBackStack("FragmentThree")
        fragmentTransaction.commit()

 */
    }


    companion object {

        private lateinit var instance: AppCompatActivity

        fun setSharedInstance(activity: AppCompatActivity) {
            instance = activity
        }
        fun messageFromActivity() {
            Log.i("info","message from activity")
        }
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