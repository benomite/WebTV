<?php
$this->breadcrumbs=array(
	'Programs',
);

$this->menu=array(
	array('label'=>'Create Program','url'=>array('create')),
	array('label'=>'Manage Program','url'=>array('admin')),
);
?>
<div class="row">
    <h1>Programs</h1>
</div>

<div class="row">
    <?php $this->widget('bootstrap.widgets.TbThumbnails', array(
        'dataProvider'=>$dataProvider,
        'template'=>"{items}\n{pager}",
        'itemView'=>'_view',
    )); ?>
</div>
