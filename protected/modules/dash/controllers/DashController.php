<?php

class DashController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',
				'actions'=>array('index','view','create','update','populate'),
				'users'=>array('@'),
			),
			array('allow',
				'actions'=>array('admin','order','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model = new DashBlock;
    $controllers = $this->getAppControllers();

    // Convert controllers to option list
    $controllerOptions = array('- select -');
    foreach ($controllers as $id => $item) {
      $title = $item['module'] ? $item['module'] .': '. $id : $id;
      $controllerOptions[$id] = ucwords($title);
    }

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['DashBlock']))
		{
			$model->attributes=$_POST['DashBlock'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('create', array(
			'model' => $model,
      'controllerOptions' => $controllerOptions,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
    $controllers = $this->getAppControllers();

    // Convert controllers to option list
    $controllerOptions = array('- select -');
    foreach ($controllers as $id => $item) {
      $title = $item['module'] ? $item['module'] .': '. $id : $id;
      $controllerOptions[$id] = ucwords($title);
    }

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['DashBlock']))
		{
			$model->attributes=$_POST['DashBlock'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update', array(
			'model' => $model,
      'controllerOptions' => $controllerOptions,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('DashBlock', array(
      'criteria' => array(
        'condition' => 'status=1',
      ),
      'pagination' => array(
        'pageSize' => 100,
      ),
    ));
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

  /**
   * Handles the ordering of models.
   */
  public function actionOrder()
  {
    // Handle the POST request data submission
    if (isset($_POST['Order'])) {
      // Since we converted the Javascript array to a string,
      // convert the string back to a PHP array
      $models = explode(',', $_POST['Order']);

      for ($i = 0; $i < sizeof($models); $i++) {
        if ($model = DashBlock::model()->findbyPk($models[$i])) {
          $model->weight = $i;
          $model->save();
        }
      }

      echo 'Updated: '. date('Y-m-d H:i:s');
    }
    // Handle the regular model order view
    else {
      $dataProvider = new CActiveDataProvider('DashBlock', array(
        'pagination' => FALSE,
        'criteria' => array(
          'order' => 'weight ASC, title ASC',
        ),
      ));

      $this->render('order', array(
        'dataProvider' => $dataProvider,
      ));
    }
  }

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new DashBlock('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Dash']))
			$model->attributes=$_GET['Dash'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}


  /**
   * Prints a list of controller actions
   */
  public function actionPopulate()
  {
    if (isset($_POST['controller'])) {
      $controllers = $this->getAppControllers();

      if (isset($controllers[$_POST['controller']])) {
        $items = array();
        $actions = $controllers[$_POST['controller']]['actions'];

        if (!empty($actions)) {
          foreach ($actions as $id => $route) {
            $items[] = $route .'|'. ucwords($id);  
          }
        }

        echo implode("\n", $items);
      }
    }
  }


	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=DashBlock::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='dashblock-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}


  /**
   * Return an array of controllers and their actions.
   */
  public function getAppControllers()
  {
    $controllers = array();
    $directories = array(
      Yii::app()->controllerPath,
    );
    $directories = $this->scanModules(Yii::app()->getModules());
    array_unshift($directories, Yii::app()->controllerPath);

    foreach ($directories as $module => $dir) {
      foreach (glob($dir . DIRECTORY_SEPARATOR .'*Controller.php') as $controller) {
        $class = pathinfo($controller, PATHINFO_FILENAME);

        if (!class_exists($class, FALSE))
          require($controller);

        if (!class_exists($class, FALSE) || !is_subclass_of($class, 'CController'))
          continue;
 
        $controller_id = preg_replace('/controller/', '', strtolower($class), 1);
        $item = array(
          'module' => is_string($module) ? $module : NULL,
          'actions' => array(),
        );

        foreach (get_class_methods($class) as $method) {
          if (!preg_match('/^action\w+$/', $method))
            continue;

          $action_id = preg_replace('/action/', '', strtolower($method), 1);

          if ($action_id !== 's') {
            $route = $controller_id .'/'. $action_id;

            if (is_string($module)) $route = $module .'/'. $route;

            $item['actions'][$action_id] = $route;
          }
        }

        $controllers[$controller_id] = $item;
      }
    }

    return $controllers;
  }

  /**
   * Return an array of controller directories
   */
  function scanModules($modules = array(), $parent = NULL)
  {
    $directories = array();

    foreach ($modules as $id => $mod) {
      $module = $parent ? $parent->getModule($id) : Yii::app()->getModule($id);

      $directories[$id] = $module->controllerPath;

      $subModules = $module->getModules();
      if (!empty($subModules)) {
        foreach ($subModules as $sId => $sMod) {
          $directories = array_merge($directories, $this->scanModules($subModules, $module));
        }
      }
    }

    return $directories;
  }
}
