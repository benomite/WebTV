<?php

/**
 * DashModule class file.
 *
 * @author Matt Kelliher
 * @license New BSD License
 * @version 0.9.1
 */

/**
 * The Dash extension allows you to create a centralized
 * administration dashboard, as well as include an
 * administration menu on your pages.
 *
 * Installation:
 *   Configure/install the schema file located in:
 *     /data/dash.sql
 *
 * Configuration:
 *    Be sure to configure the 'db' component of your app
 *    to use a table prefix, otherwise you must update
 *    the DashBlock model's table name.
 *
 * <pre>
 * return array(
 *    ...
 *    'modules' => array(
 *       ...
 *      'dash',
 *    ),
 * );
 * </pre>
 *
 * Usage:
 *    To view/configure the dashboard, simple visit 'dash'
 *    and start creating blocks. Each block has a title
 *    and a set of links (referred to as actions).
 *    Each action goes on a new line, using the format
 *      URL|Title
 *      e.g. http://google.com|Google
 *        or site/login|Login
 *
 *    To use the dashboard menu, include the following widget
 *    before the </body> tag in your main layout file.
 *    NOTE: Be sure to check the user's access before
 *    displaying the widget.
 * 
 * <pre>
 *   $this->widget('dash.components.DashMenuWidget');
 * </pre>
 */

class DashModule extends CWebModule
{
  /**
   * @property string Default module controller
   */
  public $defaultController = 'dash';

  /**
   * @property string Path to assets folder
   */
  public $assetsFolder = '';

  /**
   * @property bool Use the jQuery Masonry plugin to organize dashboard
   */
  public $useMasonry = TRUE;


  public function init()
  {
    $this->setImport(array(
      'dash.models.*',
    ));

    $this->assetsFolder = Yii::app()->assetManager->publish(
      Yii::getPathOfAlias('application.modules.dash.assets')
    );
    Yii::app()->clientScript->registerCssFile($this->assetsFolder .'/css/dash.css');

    parent::init();
  }
}
