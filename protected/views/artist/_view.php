<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('description')); ?>:</b>
	<?php echo CHtml::encode($data->description); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('creationDate')); ?>:</b>
	<?php echo CHtml::encode($data->creationDate); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('lastUpdate')); ?>:</b>
	<?php echo CHtml::encode($data->lastUpdate); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('isActive')); ?>:</b>
	<?php echo CHtml::encode($data->isActive); ?>
	<br />


</div>