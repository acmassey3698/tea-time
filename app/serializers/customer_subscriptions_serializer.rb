class CustomerSubscriptionsSerializer
  def self.subscriptions(subs)
    {
      "data": subs.map do |s|
        {
          "id": s.id,
          "type": "subscription",
          "attributes": {
            "price": s.price,
            "status": s.status,
            "frequency": s.frequency,
            "tea_id": s.tea.id,
            "customer_id": s.customer.id
          }
        }
      end

    }
  end
end
