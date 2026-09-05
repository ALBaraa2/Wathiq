'use client'

import Link from 'next/link'
import { ChevronLeft } from 'lucide-react'

import { useLang } from '@/context/LanguageContext'

import { getVerificationConfig } from '@/features/verification/config/verification.config'

export function VerificationBreadcrumbs({ type }) {
  const { locale } = useLang()

  const config = type
    ? getVerificationConfig(type, locale)
    : null

  return (
    <nav
      aria-label={
        locale === 'ar'
          ? 'مسار الصفحة'
          : 'Breadcrumb'
      }
      className="flex items-center gap-2 text-[12px] text-ink-faint"
    >
      <Link
        href="/dashboard"
        className="hover:text-brand-navy transition-colors"
      >
        {locale === 'ar' ? 'الرئيسية' : 'Home'}
      </Link>

      <ChevronLeft size={14} aria-hidden="true" />

      <Link
        href="/dashboard/verification"
        className="hover:text-brand-navy transition-colors"
      >
        {locale === 'ar'
          ? 'مركز التحقق'
          : 'Verification Center'}
      </Link>

      {config && (
        <>
          <ChevronLeft
            size={14}
            aria-hidden="true"
          />

          <span className="text-ink-muted">
            {config.label}
          </span>
        </>
      )}
    </nav>
  )
}