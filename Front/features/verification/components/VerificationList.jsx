'use client'

import Link from 'next/link'
import {
  ArrowUpRight,
  Search,
  SlidersHorizontal,
} from 'lucide-react'

import { Badge } from '@/components/ui/Badge'
import { Button } from '@/components/ui/Button'
import { Card } from '@/components/ui/Card'
import { useLang } from '@/context/LanguageContext'
import { getVerificationConfig } from '@/features/verification/config/verification.config'
import { verificationRequests } from '@/features/verification/data/verificationMock'

import { VerificationBreadcrumbs } from './VerificationBreadcrumbs'
import { VerificationTabs } from './VerificationTabs'

function getPriority(requests, requestId) {
  const orderedRequests = [...requests].sort(
    (a, b) =>
      new Date(a.submittedAt) -
      new Date(b.submittedAt),
  )

  const index = orderedRequests.findIndex(
    (request) => request.id === requestId,
  )

  if (index === 0) return 'high'
  if (index === 1) return 'medium'

  return 'low'
}

function getPriorityVariant(priority) {
  if (priority === 'high') return 'danger'
  if (priority === 'medium') return 'warning'

  return 'muted'
}

function formatSubmittedAt(value, locale) {
  return new Intl.DateTimeFormat(
    locale === 'ar' ? 'ar' : 'en',
    {
      dateStyle: 'medium',
      timeStyle: 'short',
    },
  ).format(new Date(value))
}

function getCellValue(
  request,
  requests,
  type,
  key,
  t,
  locale,
) {
  if (type === 'identity') {
    if (key === 'user') {
      return request.name
    }

    if (key === 'documentType') {
      return t.verificationCenter.documentTypes[
        request.documentType
      ]
    }

    if (key === 'submittedAt') {
      return formatSubmittedAt(
        request.submittedAt,
        locale,
      )
    }

    if (key === 'priority') {
      const priority = getPriority(
        requests,
        request.id,
      )

      return (
        <Badge
          variant={getPriorityVariant(priority)}
        >
          {t.verificationCenter.priorities[priority]}
        </Badge>
      )
    }

    if (key === 'status') {
      return t.verificationCenter.statuses[
        request.status
      ]
    }
  }

  if (type === 'property') {
    if (key === 'requestOwner') {
      return (
        <div>
          <div className="font-semibold text-brand-navy">
            {request.id}
          </div>

          <div className="mt-0.5 text-[11px] text-ink-faint">
            {request.name}
          </div>
        </div>
      )
    }

    if (key === 'propertyType') {
      return t.verificationCenter.propertyTypes[
        request.propertyType
      ]
    }

    if (key === 'area') {
      return request.area
    }

    if (key === 'city') {
      return request.city
    }

    if (key === 'submittedAt') {
      return formatSubmittedAt(
        request.submittedAt,
        locale,
      )
    }

    if (key === 'status') {
      return t.verificationCenter.statuses[
        request.status
      ]
    }
  }

  if (type === 'lawyers') {
    if (key === 'lawyer') {
      return request.name
    }

    if (key === 'licenseNumber') {
      return request.licenseNumber
    }

    if (key === 'submittedAt') {
      return formatSubmittedAt(
        request.submittedAt,
        locale,
      )
    }

    if (key === 'specialty') {
      return t.verificationCenter.specialties[
        request.specialty
      ]
    }

    if (key === 'status') {
      return t.verificationCenter.statuses[
        request.status
      ]
    }
  }

  return null
}

const columns = {
  identity: [
    'user',
    'documentType',
    'submittedAt',
    'priority',
    'status',
  ],

  property: [
    'requestOwner',
    'propertyType',
    'area',
    'city',
    'submittedAt',
    'status',
  ],

  lawyers: [
    'lawyer',
    'licenseNumber',
    'submittedAt',
    'specialty',
    'status',
  ],
}

export function VerificationList({ type }) {
  const { locale, t } = useLang()
  const config = getVerificationConfig(type)
  const requests = [
    ...(verificationRequests[config.key] ?? []),
  ].sort(
    (a, b) =>
      new Date(a.submittedAt) -
      new Date(b.submittedAt),
  )

  const activeColumns =
    columns[config.key] ?? columns.identity

  return (
    <div className="flex flex-col gap-5">
      <VerificationBreadcrumbs type={type} />

      <div>
        <h1 className="text-[26px] font-bold text-ink">
          {t.verificationCenter.title}
        </h1>

        <p className="mt-1.5 text-[13.5px] text-ink-faint">
          {t.verificationCenter.description}
        </p>
      </div>

      <VerificationTabs />

      <Card className="overflow-hidden p-0">
        <div className="flex flex-wrap items-center justify-between gap-4 border-b border-border px-6 py-5">
          <div>
            <h2 className="text-[17px] font-bold text-ink">
              {t[config.labelKey]}
            </h2>

            <p className="mt-1 text-[12px] text-ink-faint">
              {config.count}{' '}
              {t.verificationCenter.pendingRequests}
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
                className="w-52 rounded-xl border border-border bg-surface py-2.5 pe-9 ps-3 text-[12px] outline-none focus:border-brand-navy"
                placeholder={
                  t.verificationCenter.searchPlaceholder
                }
              />
            </label>

            <Button variant="outline" size="sm">
              <SlidersHorizontal size={15} />

              {t.verificationCenter.filter}
            </Button>
          </div>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full min-w-[760px]">
            <thead className="bg-surface">
              <tr>
                {activeColumns.map((column) => (
                  <th
                    key={column}
                    className="px-5 py-3 text-start text-[11px] text-ink-faint"
                  >
                    {
                      t.verificationCenter.columns[
                        config.key
                      ][column]
                    }
                  </th>
                ))}

                <th
                  aria-label={
                    t.verificationCenter.viewDetails
                  }
                />
              </tr>
            </thead>

            <tbody>
              {requests.map((request) => (
                <tr
                  key={request.id}
                  className="border-t border-border transition-colors hover:bg-surface/60"
                >
                  {activeColumns.map((column) => (
                    <td
                      key={column}
                      className="px-5 py-4 text-[12px] text-ink-muted"
                    >
                      {getCellValue(
                        request,
                        requests,
                        config.key,
                        column,
                        t,
                        locale,
                      )}
                    </td>
                  ))}

                  <td className="px-5 py-4 text-end">
                    <Link
                      href={`${config.listHref}/${request.id}`}
                      className="inline-flex items-center gap-1 text-[12px] font-semibold text-brand-navy hover:underline"
                    >
                      {t.verificationCenter.viewDetails}

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