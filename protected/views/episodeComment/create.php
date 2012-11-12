<?php
$this->breadcrumbs=array(
	'Episode Comments'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List EpisodeComment','url'=>array('index')),
	array('label'=>'Manage EpisodeComment','url'=>array('admin')),
);
?>

<h1>Create EpisodeComment</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>