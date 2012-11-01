<?php
$this->breadcrumbs=array(
	'Episodes',
);

$this->menu=array(
	array('label'=>'Create Episode','url'=>array('create')),
	array('label'=>'Manage Episode','url'=>array('admin')),
);
?>

<h1>Episodes</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
