<?php
$this->breadcrumbs=array(
	'Episode Comments',
);

$this->menu=array(
	array('label'=>'Create EpisodeComment','url'=>array('create')),
	array('label'=>'Manage EpisodeComment','url'=>array('admin')),
);
?>

<h1>Episode Comments</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
