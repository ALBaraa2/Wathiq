/**
 * Locale configuration for date/number formatting per country.
 */
export const DATE_FORMATS = {
  'ar-SA': { calendar: 'islamic', style: 'long' },
  'ar-AE': { calendar: 'gregory', style: 'long' },
  'ar-EG': { calendar: 'gregory', style: 'long' },
  default:  { calendar: 'gregory', style: 'long' },
}

export function formatDate(date, locale = 'ar-SA') {
  return new Intl.DateTimeFormat(locale, { dateStyle: 'medium' }).format(
    date instanceof Date ? date : new Date(date)
  )
}
