/**
 * Development-only dashboard preview.
 *
 * This is intentionally server-side only. It can never bypass authentication
 * in a production build because the environment check is part of the guard.
 */
export const isAuthPreviewEnabled =
  process.env.NODE_ENV === 'development' &&
  process.env.WATHIQ_AUTH_BYPASS === 'true'
