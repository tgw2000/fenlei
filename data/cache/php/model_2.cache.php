<?php
$data = array (
  0 => 
  array (
    'title' => '是否中介',
    'field' => 'zj',
    'field_type' => 'int',
    'input_type' => 'radio',
    'length' => '2',
    'choices' => 
    array (
      1 => '个人',
      2 => '中介',
    ),
    'available' => 'on',
    'required' => 'on',
    'search' => 'on',
    'search_type' => 
    array (
      0 => 'nav',
    ),
  ),
  1 => 
  array (
    'title' => '装修',
    'field' => 'makes',
    'field_type' => 'int',
    'input_type' => 'radio',
    'length' => '2',
    'choices' => 
    array (
      1 => '毛坯',
      2 => '简易',
      3 => '中档',
      4 => '高档',
    ),
    'available' => 'on',
    'required' => 'on',
    'search' => '',
    'search_type' => '',
  ),
  2 => 
  array (
    'title' => '户型',
    'field' => 'fwhx',
    'field_type' => 'int',
    'input_type' => 'select',
    'length' => '2',
    'choices' => 
    array (
      1 => '单间',
      2 => '1室1厅',
      3 => '2室1厅',
      4 => '2室2厅',
      5 => '3室1厅',
      6 => '3室2厅',
      7 => '其它',
    ),
    'available' => 'on',
    'required' => 'on',
    'search' => 'on',
    'search_type' => 
    array (
      0 => 'label',
    ),
  ),
  3 => 
  array (
    'title' => '出租方式',
    'field' => 'fangsi',
    'field_type' => 'int',
    'input_type' => 'radio',
    'length' => '2',
    'choices' => 
    array (
      1 => '整租',
      2 => '合租',
    ),
    'available' => 'on',
    'required' => 'on',
    'search' => '',
    'search_type' => '',
  ),
  4 => 
  array (
    'title' => '物业',
    'field' => 'wylx',
    'field_type' => 'int',
    'input_type' => 'radio',
    'length' => '2',
    'choices' => 
    array (
      1 => '普通住宅',
      2 => '商品房',
      3 => '公寓',
      4 => '别墅',
      5 => '民房',
      6 => '其它',
    ),
    'available' => 'on',
    'required' => 'on',
    'search' => 'on',
    'search_type' => 
    array (
      0 => 'label',
    ),
  ),
  5 => 
  array (
    'title' => '租金',
    'field' => 'price',
    'field_type' => 'int',
    'input_type' => 'text',
    'length' => '10',
    'size' => '',
    'value' => '',
    'units' => '元/月',
    'available' => 'on',
    'required' => 'on',
    'search' => '',
    'search_type' => '',
  ),
  6 => 
  array (
    'title' => '租金',
    'field' => 'price',
    'field_type' => 'varchar',
    'input_type' => 'select',
    'length' => '255',
    'choices' => 
    array (
      '0_200' => '200元以下',
      '200_500' => '200-500元',
      '500_800' => '500-800元',
      '800_1500' => '800-1500元',
      '1500_0' => '1500元以上',
    ),
    'available' => '',
    'required' => '',
    'search' => 'on',
    'search_type' => 
    array (
      0 => 'label',
    ),
  ),
  7 => 
  array (
    'title' => '区域',
    'field' => 'qy',
    'field_type' => 'int',
    'input_type' => 'select',
    'length' => '2',
    'choices' => 
    array (
      1 => '市中区',
      2 => '任城区',
      3 => '高新区',
      4 => '兖州',
      5 => '曲阜',
      6 => '邹城',
      7 => '泗水',
      8 => '微山',
      9 => '鱼台',
      10 => '金乡',
      11 => '嘉祥',
      12 => '梁山',
      13 => '汶上',
    ),
    'available' => 'on',
    'required' => '',
    'search' => 'on',
    'search_type' => 
    array (
      0 => 'label',
    ),
  ),
  8 => 
  array (
    'title' => '详细地址',
    'field' => 'address',
    'field_type' => 'varchar',
    'input_type' => 'text',
    'length' => '255',
    'size' => '40',
    'value' => '',
    'units' => '',
    'available' => 'on',
    'required' => 'on',
    'search' => '',
    'search_type' => '',
  ),
  9 => 
  array (
    'title' => '配套设施',
    'field' => 'equipment',
    'field_type' => 'varchar',
    'input_type' => 'checkbox',
    'length' => '255',
    'choices' => 
    array (
      1 => '水电煤',
      2 => '宽带',
      3 => '有线电视',
      4 => '床铺',
      5 => '管道气',
      6 => '厨具',
      7 => '家俱',
      8 => '防盗门',
      9 => '电梯',
      10 => '电话',
      11 => '冰箱',
      12 => '洗衣机',
      13 => '热水器',
      14 => '空调',
      15 => '暖气',
      16 => '饮水机',
      17 => '车库',
      18 => '院子',
    ),
    'available' => 'on',
    'required' => '',
    'search' => '',
    'search_type' => '',
  ),
  10 => 
  array (
    'title' => '房屋朝向',
    'field' => 'direction',
    'field_type' => 'int',
    'input_type' => 'select',
    'length' => '10',
    'choices' => 
    array (
      1 => '东面',
      2 => '南面',
      3 => '西面',
      4 => '北面',
    ),
    'available' => 'on',
    'required' => '',
    'search' => '',
    'search_type' => '',
  ),
  11 => 
  array (
    'title' => '所在楼层',
    'field' => 'floor',
    'field_type' => 'int',
    'input_type' => 'text',
    'length' => '10',
    'size' => '',
    'value' => '',
    'units' => '层',
    'available' => 'on',
    'required' => '',
    'search' => '',
    'search_type' => '',
  ),
  12 => 
  array (
    'title' => '楼层总数',
    'field' => 'floorall',
    'field_type' => 'int',
    'input_type' => 'text',
    'length' => '10',
    'size' => '',
    'value' => '',
    'units' => '层',
    'available' => 'on',
    'required' => '',
    'search' => '',
    'search_type' => '',
  ),
  13 => 
  array (
    'title' => '房屋面积',
    'field' => 'housearea',
    'field_type' => 'int',
    'input_type' => 'text',
    'length' => '10',
    'size' => '',
    'value' => '',
    'units' => '平方米',
    'available' => 'on',
    'required' => '',
    'search' => '',
    'search_type' => '',
  ),
);
?>