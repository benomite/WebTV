<?php

Yii::import('dash.models.DashBlock');

/**
 * Dash Menu Widget class file.
 */

class DashMenuWidget extends CWidget
{
  public $menuItems = array();
  public $menuActions = array();

	/**
	 * Initializes the widget.
	 */
	public function init()
	{
    $assets = Yii::app()->assetManager->publish(dirname(__FILE__) . DIRECTORY_SEPARATOR . '../assets');
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile($assets .'/css/dropdown.css');
    $cs->registerScriptFile($assets .'/js/dashmenu.js', CClientScript::POS_END);

    if (empty($this->menuItems)) {
      $models = DashBlock::model()->published()->ordered()->findAll();
      for ($i = 0; $i < sizeof($models); $i++) {
        $items = $models[$i]->actionsAsItems();
        if (!empty($items)) {
          $this->menuItems[] = array('label'=>$models[$i]->title, 'items'=>$items);
        }
      }
    }

    if (empty($this->menuActions)) {
      // Log Out
      $this->menuActions[] = array(
        'label' => 'Log Out ('. Yii::app()->user->name .')',
        'items' => $this->owner->createUrl('/site/logout'),
      );
      // Operations
      if (isset($this->owner->menu) && !empty($this->owner->menu)) {
        $this->menuActions[] = array(
          'label' => 'Operations',
          'items' => $this->owner->menu,
        );
      }
      // Dashboard
      $this->menuActions[] = array(
        'label' => 'Dashboard',
        'items' => $this->owner->createUrl('/dash'),
      );
    }

    parent::init();
	}

	/**
	 * Runs the widget.
	 */
	public function run()
	{
    $this->render('dashmenu', array(
      'menuItems' => $this->menuItems,
      'menuActions' => $this->menuActions,
    ));
	}

}
