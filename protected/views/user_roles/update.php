<?php
$this->breadcrumbs=array(
	'User Roles'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List user_roles', 'url'=>array('index')),
	array('label'=>'Create user_roles', 'url'=>array('create')),
	array('label'=>'View user_roles', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage user_roles', 'url'=>array('admin')),
);
?>

<h1>Update user_roles <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>