<?php
$this->breadcrumbs=array(
	'Artists',
);

$this->menu=array(
	array('label'=>'Create Artist', 'url'=>array('create')),
	array('label'=>'Manage Artist', 'url'=>array('admin')),
);
?>

<h1>Artists</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
