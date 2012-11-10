<?php
$this->breadcrumbs=array(
	'Dashboard'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'View Dashboard', 'url'=>array('index')),
	array('label'=>'Create Block', 'url'=>array('create')),
	array('label'=>'Update Block', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Block', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Blocks', 'url'=>array('admin')),
	array('label'=>'Order Blocks', 'url'=>array('order')),
);
?>

<?php $this->renderPartial('_view', array('data' => $model)); ?>
