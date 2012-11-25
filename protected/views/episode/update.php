<?php
$this->breadcrumbs=array(
    Yii::t('program', 'Programs')=>array('program/index'),
    $model->program->title => array('program/view', 'id'=>$model->program->id),
    Yii::t('program', 'Episodes')=>array('index'),
	$model->title=>array('view','id'=>$model->id),
    Yii::t('program', 'Update'),
);

$this->menu=array(
	array('label'=>Yii::t('program', 'List Episode'),'url'=>array('index')),
	array('label'=>Yii::t('program', 'Create Episode'),'url'=>array('create')),
	array('label'=>Yii::t('program', 'View Episode'),'url'=>array('view','id'=>$model->id)),
	array('label'=>Yii::t('program', 'Manage Episode'),'url'=>array('admin')),
);
?>

<h1><?php Yii::t('program', 'Update Episode');
    echo $model->title; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>