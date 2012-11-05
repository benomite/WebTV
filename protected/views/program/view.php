<?php
$this->breadcrumbs=array(
	'Programs'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>Yii::t('program', 'List Program'),'url'=>array('index')),
	array('label'=>Yii::t('program', 'Create Program'),'url'=>array('create')),
	array('label'=>Yii::t('program', 'Update Program'),'url'=>array('update','id'=>$model->id)),
	array('label'=>Yii::t('program', 'Delete Program'),'url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>Yii::t('program', 'Manage Program'),'url'=>array('admin')),
    array('label'=>Yii::t('program', 'Create Episode'), 'url'=>array('/episode/create', 'program'=>$model->id))
);
?>

<h1>Program <?php echo $model->title; ?></h1>

<div class="row">
    <div class="span4">
    <?php
        if(isset($model->image) && $model->image != "") {
            $path = Yii::app()->image->createUrl('main', YiiBase::getPathOfAlias('webroot.images').DIRECTORY_SEPARATOR.$model->image);
            echo CHtml::image($path, $model->title, array());
        }
    ?>
    </div>
    <div class="span5">
        <div class="hero-unit">
            <?php echo $model->description; ?>
        </div>
    </div>
</div>

<div class="row">
    <div class="span9">
        <?php
        foreach($model->episodes as $episode){
            echo $this->renderPartial('/episode/_view', array('data'=>$episode));
        }
        ?>
    </div>
</div>