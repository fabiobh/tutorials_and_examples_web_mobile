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

    var rootView: View? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        rootView = inflater.inflate(R.layout.fragment_two,container,false);
        initUI(rootView);
        return rootView;

        //return inflater.inflate(R.layout.fragment_two, container, false)
    }

    fun initUI(rootView: View?) {
        Log.v("info","initUI")
        val myButton2 = rootView?.findViewById<Button>(R.id.myButton2)
        myButton2?.setOnClickListener(object : View.OnClickListener {
            override fun onClick(v: View?) {
                MainActivity.messageFromActivity()
                Log.v("","clicked")
                //addFragment1() // Call another fragment from this Fragment
                MainActivity.addFragment1FromActivity() // call fragment from Activity
            }
        })
    }

    fun addFragment3() {
        /*
        val fragment = FragmentThreeX()
        val supportFragmentManager = childFragmentManager
        val fragmentTransaction = supportFragmentManager.beginTransaction()
        fragmentTransaction.add(R.id.fragmentContainer, fragment)
        fragmentTransaction.addToBackStack("FragmentThree")
        fragmentTransaction.commit()
        */
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