<?php
$this->breadcrumbs=array(
	Yii::t('program', 'Programs'),
);

$this->menu=array(
	array('label'=>Yii::t('program', 'Create Program'),'url'=>array('create')),
	array('label'=>Yii::t('program', 'Manage Program'),'url'=>array('admin')),
);
?>
<div class="row head-row">
    <div class="span9">
        <h1><?php Yii::t('program', 'Programs'); ?></h1>
    </div>
    <div class="span3">
        <div class="pull-right">
            <?php
            $this->widget('bootstrap.widgets.TbButton', array(
            'label'=>Yii::t('program','Create Program'),
            'url'=>array('create'),
            'type'=>'primary', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
            'size'=>null, // null, 'large', 'small' or 'mini'
            'icon'=>'icon-plus',
            ));
            ?>
        </div>
    </div>
</div>

<div class="row">
    <?php $this->widget('bootstrap.widgets.TbThumbnails', array(
        'dataProvider'=>$dataProvider,
        'template'=>"{items}\n{pager}",
        'itemView'=>'_view',
    )); ?>
</div>
