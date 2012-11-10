<?php
$this->breadcrumbs=array(
	'Dashboard'=>array('index'),
	'Order Blocks',
);

$this->menu=array(
	array('label'=>'View Dashboard', 'url'=>array('index')),
	array('label'=>'Create Block', 'url'=>array('create')),
	array('label'=>'Manage Blocks', 'url'=>array('admin')),
);
?>

<h1>Order Blocks</h1>

<?php
  // Organize the dataProvider data into a Zii-friendly array
  $items = array();
  $data = $dataProvider->getData();

  for ($i = 0; $i < sizeof($data); $i++) {
    $items[$data[$i]->id] = $data[$i]->title;
  }

  // Implement the JUI Sortable plugin
  $this->widget('zii.widgets.jui.CJuiSortable', array(
    'id' => 'orderList',
    'items' => $items,
  ));
  // Add a Submit button to send data to the controller
  echo CHtml::ajaxButton('Submit Changes', '', array(
    'type' => 'POST',
    'data' => array(
      // Turn the Javascript array into a PHP-friendly string
      'Order' => 'js:$("ul#orderList").sortable("toArray").toString()',
    ),
    'update' => '#order-updated',
  ));
?>
<p id="order-updated"></p>
