<?php
$this->breadcrumbs=array(
	'Programs'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List Program','url'=>array('index')),
	array('label'=>'Create Program','url'=>array('create')),
	array('label'=>'Update Program','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete Program','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Program','url'=>array('admin')),
);
?>

<h1>View Program #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'title',
		'description',
		'tags',
		'status',
		'create_time',
		'update_time',
		'author_id',
	),
)); ?>
