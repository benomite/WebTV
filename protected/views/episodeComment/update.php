<?php
$this->breadcrumbs=array(
	'Episode Comments'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List EpisodeComment','url'=>array('index')),
	array('label'=>'Create EpisodeComment','url'=>array('create')),
	array('label'=>'View EpisodeComment','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage EpisodeComment','url'=>array('admin')),
);
?>

<h1>Update EpisodeComment <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>