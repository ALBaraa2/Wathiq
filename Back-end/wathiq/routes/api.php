<?php

use App\Http\Controllers\Auth\AuthController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1/auth')->group(function () {
    // NFR-4.5: per-IP throttling here is defense in depth on top of the
    // per-email resend cooldown enforced inside OtpService.
    Route::post('otp/request', [AuthController::class, 'requestOtp'])->middleware('throttle:10,1');
    Route::post('otp/verify', [AuthController::class, 'verifyOtp'])->middleware('throttle:20,1');
    Route::post('refresh', [AuthController::class, 'refresh'])->middleware('throttle:20,1');
    Route::post('logout', [AuthController::class, 'logout'])->middleware('auth.jwt');
    Route::get('me', [AuthController::class, 'me'])->middleware('auth.jwt');
});

Route::get('/user', [AuthController::class, 'me'])->middleware('auth.jwt');
