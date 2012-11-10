<div class="dash-block" id="dash-block-<?php echo $data->id; ?>">
  <h2><?php echo CHtml::encode($data->title); ?></h2>
  <?php $this->widget('zii.widgets.CMenu', array('items' => $data->actionsAsItems())); ?>
</div>
