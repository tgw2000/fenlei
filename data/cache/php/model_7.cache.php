<?php
$data = array (
  0 => 
  array (
    'title' => '发布人',
    'field' => 'fbr',
    'field_type' => 'int',
    'input_type' => 'radio',
    'length' => '2',
    'choices' => 
    array (
      1 => '个人',
      2 => '商家',
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
    'title' => '供需',
    'field' => 'gongxu',
    'field_type' => 'int',
    'input_type' => 'radio',
    'length' => '2',
    'choices' => 
    array (
      1 => '转让',
      2 => '求购',
    ),
    'available' => 'on',
    'required' => 'on',
    'search' => 'on',
    'search_type' => 
    array (
      0 => 'label',
    ),
  ),
  2 => 
  array (
    'title' => '价格',
    'field' => 'price',
    'field_type' => 'int',
    'input_type' => 'text',
    'length' => '10',
    'size' => '20',
    'value' => '',
    'units' => '元',
    'available' => 'on',
    'required' => 'on',
    'search' => '',
    'search_type' => '',
  ),
  3 => 
  array (
    'title' => '成色',
    'field' => 'chengse',
    'field_type' => 'int',
    'input_type' => 'radio',
    'length' => '10',
    'choices' => 
    array (
      1 => '全新',
      2 => '二手',
    ),
    'available' => 'on',
    'required' => 'on',
    'search' => '',
    'search_type' => '',
  ),
  4 => 
  array (
    'title' => '价格',
    'field' => 'price',
    'field_type' => 'int',
    'input_type' => 'select',
    'length' => '10',
    'choices' => 
    array (
      '0_100' => '100元以下',
      '100_200' => '100-200元',
      '200_500' => '200-500元',
      '500_1000' => '500-1000元',
      '1000_2000' => '1000-2000元',
      '2000_5000' => '2000-3500元',
      '3500_0' => '3500元以上',
    ),
    'available' => '',
    'required' => '',
    'search' => 'on',
    'search_type' => 
    array (
      0 => 'label',
    ),
  ),
  5 => 
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
);
?>