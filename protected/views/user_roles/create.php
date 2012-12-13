<?php
$this->breadcrumbs=array(
	'User Roles'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List user_roles', 'url'=>array('index')),
	array('label'=>'Manage user_roles', 'url'=>array('admin')),
);
?>

<h1>Create user_roles</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>