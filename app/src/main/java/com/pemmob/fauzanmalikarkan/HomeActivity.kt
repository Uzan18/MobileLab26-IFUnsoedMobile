package com.pemmob.fauzanmalikarkan

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.pemmob.fauzanmalikarkan.ui.screen.DaftarProdukScreen
import com.pemmob.fauzanmalikarkan.ui.screen.DetailProductScreen
import com.pemmob.fauzanmalikarkan.ui.screen.HubungiKamiScreen
import com.pemmob.fauzanmalikarkan.ui.theme.JualanTheme

class HomeActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            JualanTheme {
                val navController = rememberNavController()
                NavHost(navController = navController, startDestination = "daftar_produk") {
                    composable(route = "daftar_produk") {
                        DaftarProdukScreen(navController = navController)
                    }
                    composable(
                        route = "detail/{productId}",
                        arguments = listOf(navArgument(name = "productId") {
                            type = NavType.IntType
                        })
                    ) { backStackEntry ->
                        val productId = backStackEntry.arguments?.getInt("productId") ?: 0
                        DetailProductScreen(
                            productId = productId,
                            navController = navController
                        )
                    }
                    composable(route = "hubungi_kami") {
                        HubungiKamiScreen(navController = navController)
                    }
                }
            }
        }
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    JualanTheme {
        Greeting("Android")
    }
}