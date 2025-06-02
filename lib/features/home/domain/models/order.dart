class Order {
  final OrderType? type;
  final String? date;
  final String? time;
  final OrderStatus? status;
  final String? reasonTitle;
  final String? reason;

  const Order({
    this.type,
    this.date,
    this.time,
    this.status,
    this.reasonTitle,
    this.reason
  });
}

enum OrderType {
  absence, delay;
}

enum OrderStatus {
  pending, accepted, rejected;
}

List<Order> getFakeOrders() => [
  Order(
    type: OrderType.absence,
    date: '12/05/2025',
    time: '10:00',
    status: OrderStatus.pending,
    reason: 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ',
    reasonTitle: 'حالة صحية'
  ),
  Order(
      type: OrderType.delay,
      date: '12/05/2025',
      time: '10:00',
      status: OrderStatus.accepted,
      reason: 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ',
      reasonTitle: 'ازدحام الطريق'
  )
];