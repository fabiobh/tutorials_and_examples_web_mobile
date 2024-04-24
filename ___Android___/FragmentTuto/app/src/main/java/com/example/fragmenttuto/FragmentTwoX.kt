package com.example.fragmenttuto

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.fragment.app.Fragment

// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"

class FragmentTwoX : Fragment() {

    // 1 - create a simple View that can be null
    var rootView: View? = null

    // 2 -
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    // 1 - onCreateView method from Fragment
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // 2 - get id xml file from resource and instantiate a view
        rootView = inflater.inflate(R.layout.fragment_two,container,false);

        // 3 - start a function to add new functions to the view
        initUI(rootView);

        // 4 - return the view
        return rootView;
    }

    fun initUI(rootView: View?) {
        // 5 - only show a message on Logcat to see if the button is clicked
        Log.v("info","initUI")

        // 6 - assign a variable to get a button reference from the layout
        val myButton2 = rootView?.findViewById<Button>(R.id.myButton2)

        // 7 - set a function that will do an action when the user click on the button
        myButton2?.setOnClickListener(object : View.OnClickListener {
            override fun onClick(v: View?) {
                // 5 - log message on Logcat from Activity
                MainActivity.messageFromActivity()

                // 6 - log message on Logcat
                Log.v("","clicked")

                // 7 - Call another fragment from this Fragment
                //addFragment1()

                // 8 - call fragment from Activity
                MainActivity.addFragment1FromActivity()
            }
        })
    }

    fun addFragment1() {
        val fragment = FragmentOneX()
        val supportFragmentManager = parentFragmentManager
        val fragmentTransaction = supportFragmentManager.beginTransaction()
        fragmentTransaction.add(R.id.fragmentContainer, fragment)
        fragmentTransaction.addToBackStack("FragmentOne")
        fragmentTransaction.commit()
    }


}