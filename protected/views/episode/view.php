<?php
$this->breadcrumbs=array(
    Yii::t('program', 'Programs') => array('program/index'),
    $model->program->title => array('program/view', 'id'=>$model->program->id),
    Yii::t('program', 'Episodes') => array('program/view', 'id'=>$model->program->id),
	$model->title,
);

$this->menu=array(
	array('label'=>Yii::t('program', 'List Episode'),'url'=>array('index')),
	array('label'=>Yii::t('program', 'Create Episode'),'url'=>array('create')),
	array('label'=>Yii::t('program', 'Update Episode'),'url'=>array('update','id'=>$model->id)),
	array('label'=>Yii::t('program', 'Delete Episode'),'url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>Yii::t('program', 'Are you sure you want to delete this item?'))),
	array('label'=>Yii::t('program', 'Manage Episode'),'url'=>array('admin')),
);
?>

<div class="row head-row">
    <div class="span9">
        <h1><?php echo $model->getFullTitle(); ?></h1>
    </div>
    <div class="span3">
        <div class="pull-right">
            <?php
            $this->widget('bootstrap.widgets.TbButton', array(
                'label'=>Yii::t('program','Update Episode'),
                'url'=>array('/episode/update', 'id'=>$model->id),
                'type'=>'primary', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
                'size'=>null, // null, 'large', 'small' or 'mini'
                'icon'=>'icon-edit',
            ));
            ?>
        </div>
    </div>
</div>


<div class="row episode-view">
    <div class="span3">
        <?php
        $html_link = "";
        if(isset($model->image) && $model->image != "") {
            $path = Yii::app()->image->createUrl('big_thumb', YiiBase::getPathOfAlias('webroot.images').DIRECTORY_SEPARATOR.$model->image);
            $html_link = CHtml::image($path, $model->title, array('class' => "img-polaroid"));
        }
        echo CHtml::link($html_link ,array('/episode/view','id'=>$model->id));
        ?>
    </div>
    <div class="span9">
        <?php
        echo "<h4>".$model->title."</h4>";
        echo "<p>".$model->description."</p>";
        ?>
    </div>

</div>
<div class="row episode-video">
    <div class="main-video">
        <?php
        echo $model->video;
        ?>
    </div>
</div>
<div class="row">
    <?php if(Yii::app()->user->hasFlash('commentSubmitted')): ?>
        <div class="flash-success">
            <?php echo Yii::app()->user->getFlash('commentSubmitted'); ?>
        </div>
        <?php else: ?>
        <?php
        $this->widget('bootstrap.widgets.TbAlert', array(
            'block'=>true, // display a larger alert block?
            'fade'=>true, // use transitions?
            'closeText'=>'&times;', // close link text - if set to false, no close link is displayed
            /*'alerts'=>array( // configurations per alert type
                'success'=>array('block'=>true, 'fade'=>true, 'closeText'=>'&times;'), // success, info, warning, error or danger
            ),*/
        ));
        ?>
        <?php $this->renderPartial('/episodeComment/_form',array(
            'model'=>$comment,
        )); ?>
    <?php endif; ?>
</div>
<div class="row episode-comments">
    <?php
        foreach($model->comments as $data){
            echo $this->renderPartial('/episodeComment/_view', array('data'=>$data));
        }
    ?>
</div>
