package com.example.composebasiccomponents

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import com.example.composebasiccomponents.ui.theme.ComposeBasicComponentsTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            ComposeBasicComponentsTheme {
                MyExample("Android")
            }
        }
    }
}

@Composable
fun MyExample(name: String, modifier: Modifier = Modifier) {

    Column (
        modifier = Modifier.fillMaxSize().background(Color.Red)
    ){
        if (name.length > 5) {
            Text( text = "Hello $name!" )
        }
        for (i in 1..2) {
            Icon(imageVector = Icons.Default.Add,
                contentDescription = null)
        }
        Image(painter = painterResource(id = androidx.core.R.drawable.ic_call_answer),
            contentDescription = null)
        Text(
            text = "Hello my $name!"
        )
    }

}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    ComposeBasicComponentsTheme {
        MyExample("Android")
    }
}