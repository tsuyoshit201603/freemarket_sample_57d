lady = Category.create(
  {
    id: 1,
    name:"レディース"
  }
)

lady_tops = lady.children.create(
  {
    id: 2,
    name:"トップス"
  }
)
lady_jacket = lady.children.create(
  {
    id: 3,
    name:"ジャケット/アウター"
  }
)

lady_tops.children.create(
  [
    {
      id: 4,
      name:"Tシャツ/カットソー(半袖/袖なし)"
    },
    {
      id: 5,
      name:"Tシャツ/カットソー(七分/長袖)"
    },
    {
      id: 6,
      name:"その他"
    }
  ]
)
lady_jacket.children.create(
  [
    {
      id: 7,
      name:"テーラードジャケット"
    },
    {
      id: 8,
      name:"ノーカラージャケット"
    },
    {
      id: 9,
      name:"Gジャン/デニムジャケット"
    },
    {
      id: 10,
      name:"その他"
    }
  ]
)
Size.create!(
  [
    {
      id: 1,
      size: 'XXS以下',
    },
    {
      id: 2,
      size: 'XS(SS)',
    },
    {
      id: 3,
      size: 'S',
    },
    {
      id: 4,
      size: 'M',
    },
    {
      id: 5,
      size: 'L',
    },
    {
      id: 6,
      size: 'XL(LL)',
    },
    {
      id: 7,
      size: '2XL(3L)',
    },
    {
      id: 8,
      size: '3XL(4L)',
    },
    {
      id: 9,
      size: '4XL(5L)以上',
    },
    {
      id: 10,
      size: 'FREE SIZE',
    },
  ]
)
Brand.create!(
  [
    {
      id: 1,
      name: 'NIKE',
    }
  ]
)
CommodityCondition.create!(
  [
    {
      id: 1,
      condition: '新品、未使用',
    },
    {
      id: 2,
      condition: '未使用に近い',
    },
    {
      id: 3,
      condition: '目立った傷や汚れなし',
    },
    {
      id: 4,
      condition: 'やや傷や汚れあり',
    },
    {
      id: 5,
      condition: '傷や汚れあり',
    },
    {
      id: 6,
      condition: '全体的に状態が悪い',
    }
  ]
)
ShippingCharge.create!(
  [
    {
      id: 1,
      method: '送料込み(出品者負担)',
    },
    {
      id: 2,
      method: '着払い(購入者負担)',
    }
  ]
)
DeliveryMethod.create!(
  [
    {
      id: 1,
      name: '未定',
    },
    {
      id: 2,
      name: 'らくらくメルカリ便',
    },
    {
      id: 3,
      name: 'ゆうメール',
    },
    {
      id: 4,
      name: 'レターパック',
    },
    {
      id: 5,
      name: '普通郵便(定形、定形外)',
    },
    {
      id: 6,
      name: 'クロネコヤマト',
    },
    {
      id: 7,
      name: 'ゆうパック',
    },
    {
      id: 8,
      name: 'クリックポスト',
    },
    {
      id: 9,
      name: 'ゆうパケット',
    }
  ]
)
DaysBeforeShipment.create!(
  [
    {
      id: 1,
      days: '1〜2日で発送',
    },
    {
      id: 2,
      days: '2〜3日で発送',
    },
    {
      id: 3,
      days: '4〜7日で発送',
    },
  ]
)
User.create!(
  [
    {
      id: 1,
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
      id: 1,
      condition: '出品中',
    },
    {
      id: 2,
      condition: '取引中',
    },
    {
      id: 3,
      condition: '売却済み',
    }
  ]
)
Product.create!(
  [
    {
      id: 1,
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
    }
  ]
)
UsersProduct.create!(
  [
    {
      id: 1,
      user_id: '1',
      product_id: '1',
    }
  ]
)
Picture.create!(
  [
    {
      id: 1,
      image: 'https://static.mercdn.net/thumb/photos/m81721927592_1.jpg?1566790718',
      product_id: '1',
    }
  ]
)