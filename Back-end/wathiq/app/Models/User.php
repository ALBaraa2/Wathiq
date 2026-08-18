<?php

namespace App\Models;

use Database\Factories\UserFactory;
use App\Models\Concerns\HasUuidPrimaryKey;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

/**
 * Passwordless: there is no password column. Identity is proven per-request
 * by a one-time code (app.otp_codes), never stored on the model itself.
 */
#[Fillable(['email', 'phone', 'locale'])]
class User extends Authenticatable
{
    /** @use HasFactory<UserFactory> */
    use HasFactory, HasUuidPrimaryKey, Notifiable, SoftDeletes;

    protected $table = 'users';

    protected $keyType = 'string';

    public $incrementing = false;

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'phone_verified_at' => 'datetime',
            'last_login_at' => 'datetime',
            'locked_until' => 'datetime',
        ];
    }
}
