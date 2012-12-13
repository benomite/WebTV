<?php
$this->breadcrumbs=array(
	'User Roles',
);

$this->menu=array(
	array('label'=>'Create user_roles', 'url'=>array('create')),
	array('label'=>'Manage user_roles', 'url'=>array('admin')),
);
?>

<h1>User Roles</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
