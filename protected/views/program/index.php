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
        <h1><?php echo Yii::t('program', 'Programs'); ?></h1>
    </div>
    <div class="span3">
        <div class="pull-right">
            <?php
            $this->widget('bootstrap.widgets.TbButton', array(
            'label'=>Yii::t('program','Create Program'),
            'url'=>array('create'),
            'type'=>'primary', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
            'size'=>null, // null, 'large', 'small' or 'mini'
            'icon'=>'icon-plus icon-white',
            ));
            ?>
        </div>
    </div>
</div>

<div class="row">
    <?php
    $data = array();
    foreach($model as $m){  // loop to get the data (this is different from the complex way)
        $data[] = $m->attributes;
        echo $this->renderPartial('_view', array('data'=>$m));
    }

    // the pagination widget with some options to mess
    $this->widget('CLinkPager', array(
        'currentPage'=>$pages->getCurrentPage(),
        'itemCount'=>$item_count,
        'pageSize'=>$page_size,
        'maxButtonCount'=>5,
        //'nextPageLabel'=>'My text >',
        'header'=>'',
        'htmlOptions'=>array('class'=>'pages'),
    ));
    /*$this->widget('bootstrap.widgets.TbThumbnails', array(
        'dataProvider'=>$dataProvider,
        'template'=>"{items}\n{pager}",
        'itemView'=>'_view',
    ));*/ ?>
</div>
