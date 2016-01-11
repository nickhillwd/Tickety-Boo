Rails.configuration.stripe = {
  :publishable_key => 'pk_test_neDZcQFI3r44snW2RcBeoezJ',
  :secret_key      => 'sk_test_kgP0BajYFjv9E9kSXzfo51KB'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]