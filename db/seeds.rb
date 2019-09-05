Category.create!(
  [
    {
      name: 'メンズ',
      ancestry: '2',
    },
  ]
)

Size.create!(
  [
    {
      size: 'S',
    },
  ]
)

Brand.create!(
  [
    {
      name: 'NIKE',
    },
  ]
)

CommodityCondition.create!(
  [
    {
      condition: '新品',
    },
  ]
)

ShippingCharge.create!(
  [
    {
      method: '送料込み',
    },
  ]
)

DeliveryMethod.create!(
  [
    {
      name: 'クロネコヤマト',
    },
  ]
)

DaysBeforeShipment.create!(
  [
    {
      days: '1〜2日で発送',
    },
  ]
)


User.create!(
  [
    {
      family_name_kanji: '山田',
      first_name_kanji: '太郎',
      family_name_cana: 'ヤマダ',
      first_name_cana: 'タロウ',
      year: '1999',
      month: '11',
      day: '11',
      image: '',
      nickname: 'ヤマダ',
      explain: 'テストです',
      email: 'i@i',
      password: 'r1108y1108o'
    }
  ]
)

Condition.create!(
  [
    {
      condition: '傷付いている',
    },
  ]
)


Product.create!(
  [
    {
      name: 'サンダル',
      explain:'サンダルです',
      prefecture_id:'1',
      price:'1000',
      category_id:'1',
      size_id:'1',
      brand_id:'1',
      commodity_condition_id:'1',
      shipping_charge_id:'1',
      delivery_method_id:'1',
      days_before_shipment_id:'1',
      user_id:'1',
      condition_id:'1',
    },
  ]
)

UsersProduct.create!(
  [
    {
      user_id: '1',
      product_id: '1',
    },
  ]
)



Picture.create!(
  [
    {
      image: 'https://static.mercdn.net/thumb/photos/m81721927592_1.jpg?1566790718',
      product_id: '1',
    },
  ]
)