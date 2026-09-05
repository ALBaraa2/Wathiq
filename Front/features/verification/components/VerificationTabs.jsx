'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useLang } from '@/context/LanguageContext'

import {
  getVerificationConfig,
  VERIFICATION_ORDER,
} from '@/features/verification/config/verification.config'

export function VerificationTabs() {
  const pathname = usePathname()
  const { locale } = useLang()

  return (
    <div
      className="flex items-center gap-2 overflow-x-auto border-b border-border"
      role="tablist"
      aria-label={
        locale === 'ar'
          ? 'أنواع التحقق'
          : 'Verification types'
      }
    >
      {VERIFICATION_ORDER.map((type) => {
        const config = getVerificationConfig(type, locale)

        const active =
          pathname === config.listHref ||
          pathname.startsWith(`${config.listHref}/`)

        return (
          <Link
            key={type}
            href={config.listHref}
            role="tab"
            aria-selected={active}
            className={`shrink-0 px-4 py-3 text-[13px] font-semibold border-b-2 transition-colors ${
              active
                ? 'text-brand-navy border-brand-gold'
                : 'text-ink-muted border-transparent hover:text-brand-navy'
            }`}
          >
            {config.label}

            <span className="text-[11px] opacity-70 ms-1">
              ({config.count})
            </span>
          </Link>
        )
      })}
    </div>
  )
}