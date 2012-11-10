<?php
$this->breadcrumbs=array(
	'Dashboard'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'View Dashboard', 'url'=>array('index')),
	array('label'=>'Create Block', 'url'=>array('create')),
	array('label'=>'View Block', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Blocks', 'url'=>array('admin')),
	array('label'=>'Order Blocks', 'url'=>array('order')),
);
?>

<h1>Update Block <em><?php echo CHtml::encode($model->title); ?></em></h1>

<?php echo $this->renderPartial('_form', array(
  'model' => $model,
  'controllerOptions' => $controllerOptions,  
)); ?>
