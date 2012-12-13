<?php
$this->breadcrumbs=array(
	'User Roles'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List user_roles', 'url'=>array('index')),
	array('label'=>'Create user_roles', 'url'=>array('create')),
	array('label'=>'Update user_roles', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete user_roles', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage user_roles', 'url'=>array('admin')),
);
?>

<h1>View user_roles #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'role',
		'description',
	),
)); ?>
