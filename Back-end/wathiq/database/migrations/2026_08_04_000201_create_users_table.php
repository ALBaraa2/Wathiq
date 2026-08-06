<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Module 1 (FR-1.x), NFR-4.3/4.5.
     *
     * Note on tenancy: `users` is deliberately NOT tenant-scoped. A person may
     * hold membership in more than one company; the membership is what carries
     * the tenant, via app.tenant_memberships. Putting tenant_id on users
     * directly would force duplicate accounts and duplicate KYC for the same
     * human being.
     */
    public function up(): void
    {
        DB::unprepared(<<<'SQL'
            create type app.user_status as enum (
                'pending_verification',  -- registered, email not yet confirmed (UC-039)
                'active',
                'suspended',             -- admin action (FR-13.1)
                'deactivated'            -- user-initiated
            );

            create table app.users (
                id                 uuid primary key default app.uuid_generate_v7(),
                email              app.email        not null,
                phone              app.phone,
                password_hash      text             not null,
                status             app.user_status  not null default 'pending_verification',
                locale             app.locale       not null default 'ar',
                email_verified_at  timestamptz,
                phone_verified_at  timestamptz,
                last_login_at      timestamptz,
                -- NFR-4.5 brute-force protection. Cleared on successful authentication.
                failed_login_count smallint         not null default 0,
                locked_until       timestamptz,
                created_at         timestamptz      not null default now(),
                updated_at         timestamptz      not null default now(),
                deleted_at         timestamptz,

                constraint users_verified_implies_timestamp check (
                    status <> 'pending_verification' or email_verified_at is null
                )
            );

            -- Partial: a soft-deleted account must not block re-registration of the address.
            create unique index users_email_key on app.users (email) where deleted_at is null;
            create unique index users_phone_key on app.users (phone) where phone is not null and deleted_at is null;
            create index users_status_idx on app.users (status) where deleted_at is null;

            create trigger users_touch
                before update on app.users
                for each row execute function app.touch_updated_at();

            comment on column app.users.password_hash is
              'Argon2id preferred, bcrypt acceptable (NFR-4.3). Never plaintext, never reversible encryption.';
        SQL);
    }

    public function down(): void
    {
        DB::unprepared(<<<'SQL'
            drop table if exists app.users;
            drop type if exists app.user_status;
        SQL);
    }
};
