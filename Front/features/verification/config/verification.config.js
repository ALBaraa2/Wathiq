export const VERIFICATION_TYPES = {
  identity: {
    key: 'identity',
    labelKey: 'identityCheck',
    listHref: '/dashboard/verification/identity',
    count: 21,
  },

  property: {
    key: 'property',
    labelKey: 'propertyCheck',
    listHref: '/dashboard/verification/property',
    count: 18,
  },

  lawyers: {
    key: 'lawyers',
    labelKey: 'lawyerApproval',
    listHref: '/dashboard/verification/lawyers',
    count: 8,
  },
}

export const VERIFICATION_ORDER = [
  'identity',
  'property',
  'lawyers',
]

export function getVerificationConfig(type) {
  return (
    VERIFICATION_TYPES[type] ??
    VERIFICATION_TYPES.identity
  )
}