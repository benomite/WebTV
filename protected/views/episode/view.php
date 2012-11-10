<?php
$this->breadcrumbs=array(
    'Programs'=>array('program/index'),
    $model->program->title => array('program/view', 'id'=>$model->program->id),
	'Episodes'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List Episode','url'=>array('index')),
	array('label'=>'Create Episode','url'=>array('create')),
	array('label'=>'Update Episode','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete Episode','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Episode','url'=>array('admin')),
);
?>

<div class="row head-row">
    <div class="span10">
        <h1>View Episode #<?php echo $model->id; ?></h1>
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
