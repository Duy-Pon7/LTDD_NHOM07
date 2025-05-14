package com.example.shoestore.Activity;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.example.shoestore.R;
import com.example.shoestore.Retrofit.RetrofitService;

public class AdminActivity extends AppCompatActivity {

    private static final int FILECHOOSER_RESULTCODE = 1;
    private ValueCallback<Uri[]> filePathCallback;

    @SuppressLint("SetJavaScriptEnabled")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_admin);

        WebView webView = findViewById(R.id.webview);

        // Bật JavaScript cho WebView
        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setAllowFileAccess(true);  // Cho phép WebView truy cập file
        webSettings.setAllowContentAccess(true); // Cho phép truy cập nội dung

        // Thiết lập WebViewClient để xử lý các sự kiện tải trang
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                super.onPageStarted(view, url, favicon);
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                Log.d("WebView", "Page finished loading: " + url);
                super.onPageFinished(view, url);
            }

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                if (url.equals("http://" + RetrofitService.IPAddress + ":8080/redirect")) {
                    startActivity(new Intent(AdminActivity.this, LoginActivity.class));
                    return true;
                }
                return false;
            }
        });

        // ⚠️ Phần quan trọng: Cho phép WebView chọn ảnh từ thiết bị
        webView.setWebChromeClient(new WebChromeClient() {
            @Override
            public boolean onShowFileChooser(WebView webView, ValueCallback<Uri[]> filePathCallback,
                                             FileChooserParams fileChooserParams) {
                AdminActivity.this.filePathCallback = filePathCallback;

                // Tạo Intent để chọn nhiều ảnh từ bộ nhớ
                Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("image/*");  // Chỉ cho phép chọn file ảnh
                intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);  // Cho phép chọn nhiều ảnh

                // Mở chooser cho người dùng chọn ảnh
                startActivityForResult(Intent.createChooser(intent, "Chọn ảnh"), FILECHOOSER_RESULTCODE);
                return true;
            }
        });

        // Load URL vào WebView
        webView.loadUrl("http://" + RetrofitService.IPAddress + ":8080/signin-admin");
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        if (requestCode == FILECHOOSER_RESULTCODE && filePathCallback != null) {
            Uri[] results = null;

            if (resultCode == Activity.RESULT_OK) {
                if (data != null) {
                    // Kiểm tra nếu người dùng chọn nhiều ảnh
                    if (data.getClipData() != null) {
                        int count = data.getClipData().getItemCount();
                        results = new Uri[count];
                        for (int i = 0; i < count; i++) {
                            results[i] = data.getClipData().getItemAt(i).getUri();
                        }
                    } else if (data.getData() != null) {
                        // Nếu chỉ chọn một ảnh
                        results = new Uri[]{data.getData()};
                    }
                }
            }

            // Trả kết quả cho filePathCallback
            filePathCallback.onReceiveValue(results);
            filePathCallback = null;
        } else {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }
}
