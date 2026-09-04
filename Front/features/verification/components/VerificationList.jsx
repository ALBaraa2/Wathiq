'use client'

import Link from 'next/link'
import { Search, SlidersHorizontal, ArrowUpRight } from 'lucide-react'

import { Card } from '@/components/ui/Card'
import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'

import { useLang } from '@/context/LanguageContext'

import {
  getVerificationConfig,
} from '@/features/verification/config/verification.config'

import {
  verificationRequests,
} from '@/features/verification/data/verificationMock'

import { VerificationBreadcrumbs } from './VerificationBreadcrumbs'
import { VerificationTabs } from './VerificationTabs'

function getPriorityVariant(priority) {
  if (priority === 'عالية') return 'danger'
  if (priority === 'متوسطة') return 'warning'

  return 'muted'
}

export function VerificationList({ type }) {
  const { locale } = useLang()

  const config = getVerificationConfig(
    type,
    locale
  )

  const requests =
    verificationRequests[type] ?? []

  return (
    <div className="flex flex-col gap-5">

      <VerificationBreadcrumbs />

      <div>
        <h1 className="text-[26px] font-bold text-ink">
          {locale === 'ar'
            ? 'مركز التحقق'
            : 'Verification Center'}
        </h1>

        <p className="text-[13.5px] text-ink-faint mt-1.5">
          {locale === 'ar'
            ? 'إدارة ومراجعة طلبات التحقق المعلقة'
            : 'Manage and review pending verification requests'}
        </p>
      </div>

      <VerificationTabs />

      <Card className="p-0 overflow-hidden">

        <div className="px-6 py-5 border-b border-border flex items-center justify-between gap-4 flex-wrap">

          <div>
            <h2 className="text-[17px] font-bold text-ink">
              {config.label}
            </h2>

            <p className="text-[12px] text-ink-faint mt-1">
              {locale === 'ar'
                ? `${config.count} طلبًا بانتظار المراجعة`
                : `${config.count} requests pending review`}
            </p>
          </div>

          <div className="flex items-center gap-2">

            <label className="relative">
              <Search
                size={15}
                className="absolute inset-inline-end-3 top-1/2 -translate-y-1/2 text-ink-faint"
                aria-hidden="true"
              />

              <input
                className="w-52 border border-border rounded-xl bg-surface py-2.5 pe-9 ps-3 text-[12px] outline-none focus:border-brand-navy"
                placeholder={
                  locale === 'ar'
                    ? 'بحث برقم الطلب أو الاسم'
                    : 'Search by ID or name'
                }
              />
            </label>

            <Button
              variant="outline"
              size="sm"
            >
              <SlidersHorizontal size={15} />

              {locale === 'ar'
                ? 'تصفية'
                : 'Filter'}
            </Button>

          </div>
        </div>

        <div className="overflow-x-auto">

          <table className="w-full min-w-[760px]">

            <thead className="bg-surface">
              <tr>
                <th className="px-5 py-3 text-start text-[11px] text-ink-faint">
                  {locale === 'ar'
                    ? 'الطلب'
                    : 'Request'}
                </th>

                <th className="px-5 py-3 text-start text-[11px] text-ink-faint">
                  {locale === 'ar'
                    ? 'مقدم الطلب'
                    : 'Applicant'}
                </th>

                <th className="px-5 py-3 text-start text-[11px] text-ink-faint">
                  {locale === 'ar'
                    ? 'الأولوية'
                    : 'Priority'}
                </th>

                <th className="px-5 py-3 text-start text-[11px] text-ink-faint">
                  {locale === 'ar'
                    ? 'درجة المطابقة'
                    : 'Match Score'}
                </th>

                <th className="px-5 py-3 text-start text-[11px] text-ink-faint">
                  {locale === 'ar'
                    ? 'وقت التقديم'
                    : 'Submitted'}
                </th>

                <th />
              </tr>
            </thead>

            <tbody>
              {requests.map((request) => (
                <tr
                  key={request.id}
                  className="border-t border-border hover:bg-surface/60 transition-colors"
                >

                  <td className="px-5 py-4 font-semibold text-brand-navy">
                    {request.id}
                  </td>

                  <td className="px-5 py-4">
                    <div className="font-semibold text-ink">
                      {request.name}
                    </div>

                    <div className="text-[11px] text-ink-faint mt-0.5">
                      {request.role}
                    </div>
                  </td>

                  <td className="px-5 py-4">
                    <Badge
                      variant={getPriorityVariant(
                        request.priority
                      )}
                    >
                      {request.priority}
                    </Badge>
                  </td>

                  <td className="px-5 py-4">
                    <span className="font-bold text-ink">
                      {request.score}%
                    </span>
                  </td>

                  <td className="px-5 py-4 text-[12px] text-ink-muted">
                    {request.submitted}
                  </td>

                  <td className="px-5 py-4 text-end">

                    <Link
                      href={`${config.listHref}/${request.id}`}
                      className="inline-flex items-center gap-1 text-[12px] font-semibold text-brand-navy hover:underline"
                    >
                      {locale === 'ar'
                        ? 'عرض التفاصيل'
                        : 'View details'}

                      <ArrowUpRight size={14} />
                    </Link>

                  </td>

                </tr>
              ))}
            </tbody>

          </table>

        </div>

      </Card>

    </div>
  )
}