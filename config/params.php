<?php

return [
    'adminEmail' => 'zhaojt_wechat@126.com',
    'pageSize' => [
        'manage' => 4,
        'user' => 4,
        'product' => 10,
        'frontproduct' => 3,
        'order' => 10,
    ],
    'defaultValue' => [
        'avatar' => 'assets/admin/img/contact-img.png',
    ],
    'qiniu' => [
        'accessKey' => 'IIimd48IpIPRGXwUrzPhdFa3HAzvysRV8JQRFpBv',
        'secretKey' => 'iVbVVOq5YMSHy6dhzMxZ0OODipV8P-18LZgXJ8dW',
        'bucket' => 'goular',
        'domain' => 'http://on5lx46o2.bkt.clouddn.com/'
    ],
    'express' => [
        1 => '中通快递',
        2 => '顺丰快递',
        3 => '包邮'
    ],
    'expressPrice' => [
        1 => 15,
        2 => 20,
        3 => 0
    ]
];
