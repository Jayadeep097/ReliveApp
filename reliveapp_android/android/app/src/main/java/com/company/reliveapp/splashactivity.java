package com.company.reliveapp;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

public class SplashActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Navigate to the main activity after the splash screen
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
        finish();
    }
}
