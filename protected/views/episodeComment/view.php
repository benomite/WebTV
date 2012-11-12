<?php
$this->breadcrumbs=array(
	'Episode Comments'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List EpisodeComment','url'=>array('index')),
	array('label'=>'Create EpisodeComment','url'=>array('create')),
	array('label'=>'Update EpisodeComment','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete EpisodeComment','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage EpisodeComment','url'=>array('admin')),
);
?>

<h1>View EpisodeComment #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'content',
		'episode_id',
		'author_id',
		'status',
		'create_time',
	),
)); ?>
