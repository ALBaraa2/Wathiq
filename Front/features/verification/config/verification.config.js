export const VERIFICATION_TYPES = {
  identity: {
    key: 'identity',
    label: {
      ar: 'التحقق من الهوية',
      en: 'Identity Verification',
    },
    listHref: '/dashboard/verification/identity',
    count: 21,
  },

  property: {
    key: 'property',
    label: {
      ar: 'ملكية العقار',
      en: 'Property Ownership',
    },
    listHref: '/dashboard/verification/property',
    count: 18,
  },

  lawyers: {
    key: 'lawyers',
    label: {
      ar: 'اعتماد المحامين',
      en: 'Lawyer Approval',
    },
    listHref: '/dashboard/verification/lawyers',
    count: 8,
  },
}

export const VERIFICATION_ORDER = [
  'identity',
  'property',
  'lawyers',
]

export function getVerificationConfig(type, locale = 'ar') {
  const config =
    VERIFICATION_TYPES[type] ?? VERIFICATION_TYPES.identity

  return {
    ...config,
    label: config.label[locale] ?? config.label.ar,
  }
}