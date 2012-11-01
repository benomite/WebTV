<?php
$this->breadcrumbs=array(
	'Episodes'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List Episode','url'=>array('index')),
	array('label'=>'Create Episode','url'=>array('create')),
	array('label'=>'Update Episode','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete Episode','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Episode','url'=>array('admin')),
);
?>

<h1>View Episode #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'title',
		'description',
		'video',
		'status',
		'create_time',
		'update_time',
		'program_id',
	),
)); ?>
