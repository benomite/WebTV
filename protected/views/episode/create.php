<?php
$this->breadcrumbs=array(
    Yii::t('program', 'Episodes')=>array('index'),
    Yii::t('program', 'Create'),
);

$this->menu=array(
	array('label'=>Yii::t('program', 'List Episode'),'url'=>array('index')),
	array('label'=>Yii::t('program', 'Manage Episode'),'url'=>array('admin')),
);
?>

<h1><?php echo Yii::t('program', 'Create Episode'); ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>