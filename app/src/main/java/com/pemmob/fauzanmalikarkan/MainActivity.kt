package com.pemmob.fauzanmalikarkan

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.pemmob.fauzanmalikarkan.ui.theme.JualanTheme

// Pastikan import ini sesuai dengan nama package Anda tempat menyimpan screen
import com.pemmob.fauzanmalikarkan.ui.screen.BasicInfoScreen
import com.pemmob.fauzanmalikarkan.ui.screen.HubungiKamiScreen

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            JualanTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    // Mendeklarasikan pengontrol navigasi
                    val navController = rememberNavController()

                    // NavHost mengatur rute layar pertama kali (startDestination)
                    NavHost(navController = navController, startDestination = "basic_info") {

                        // Mendaftarkan layar BasicInfoScreen
                        composable(route = "basic_info") {
                            BasicInfoScreen(
                                onNavigateToContact = { navController.navigate(route = "form_screen") }
                            )
                        }

                        // Mendaftarkan layar HubungiKamiScreen
                        composable(route = "form_screen") {
                            HubungiKamiScreen(navController = navController)
                        }
                    }
                }
            }
        }
    }
}