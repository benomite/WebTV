<div id="dash-menu-wrapper">
  <ul id="dash-menu">
    <!-- Favicon -->
    <li id="dash-menu-icon">
      <?php $favicon = CHtml::image(
        Yii::app()->request->baseUrl .'/favicon.ico', 'Home', array(
          'height' => 16,
          'width' => 16,
        )); ?>
      <a href="<?php Yii::app()->request->baseUrl; ?>/"><?php echo $favicon; ?></a>
    </li>
    <!-- Menu Actions -->
    <?php foreach ($menuActions as $section): ?>
    <li class="dash-menu-action">
      <?php 
        if (is_array($section['items'])) {
          echo CHtml::tag('span', array(), $section['label']);
          Yii::app()->controller->widget('zii.widgets.CMenu', array('items'=>$section['items']));
        }
        else {
          echo CHtml::link($section['label'], $section['items']);
        }
      ?>
    </li>
    <?php endforeach; ?>
    <!-- Menu Items -->
    <?php foreach ($menuItems as $section): ?>
    <li class="dash-menu-item">
      <span><?php echo $section['label']; ?></span>
      <?php Yii::app()->controller->widget('zii.widgets.CMenu', array('items'=>$section['items'])); ?>
    </li>
    <?php endforeach; ?>
  </ul>
</div>
