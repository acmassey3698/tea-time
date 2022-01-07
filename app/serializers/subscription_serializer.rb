class SubscriptionSerializer
  def self.one_sub(subscription)
    {
      'data': {
        'id': subscription.id,
        'type': "subscription",
        'attributes': {
          'customer_email': subscription.customer.email,
          'tea_name': subscription.tea.name,
          'price': subscription.price,
          'status': subscription.status,
          'frequency': subscription.frequency
        }
      }
    }
  end
end
