<?php
$this->breadcrumbs=array(
	'Dashboard'=>array('index'),
	'Create Block',
);

$this->menu=array(
	array('label'=>'View Dashboard', 'url'=>array('index')),
	array('label'=>'Manage Blocks', 'url'=>array('admin')),
	array('label'=>'Order Blocks', 'url'=>array('order')),
);
?>

<h1>Create Block</h1>

<?php echo $this->renderPartial('_form', array(
  'model' => $model,
  'controllerOptions' => $controllerOptions,  
)); ?>
