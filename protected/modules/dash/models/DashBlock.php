<?php

/**
 * This is the model class for table "{{dashblock}}".
 *
 * The followings are the available columns in table '{{dashblock}}':
 * @property string $id
 * @property string $title
 * @property string $actions
 * @property string $weight
 * @property integer $status
 */
class DashBlock extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Dashboard the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{dashblock}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
      array('title, actions', 'required'),
			array('status', 'numerical', 'integerOnly'=>true),
			array('title', 'length', 'max'=>255),
			array('weight', 'length', 'max'=>11),
			array('actions', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, title, actions, weight, status', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'title' => 'Title',
			'actions' => 'Actions',
			'weight' => 'Weight',
			'status' => 'Published',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('actions',$this->actions,true);
		$criteria->compare('weight',$this->weight,true);
		$criteria->compare('status',$this->status);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}


  /**
   * @return array default scope criteria
   */
  public function defaultScope()
  {
    return array(
      'order' => 'weight ASC, title ASC',
    );
  }


  /**
   * @return array of criteria scopes
   */
  public function scopes()
  {
    return array(
      'published' => array(
        'condition' => 'status=1',
      ),
      'ordered' => array(
        'order' => 'weight ASC, title ASC',
      ),
    );
  }


  /**
   * @return array of actions converted from url|title format.
   */
  public function actionsArray()
  {
    $items = array();
    $actions = explode("\n", $this->actions);

    if (!empty($actions)) {
      foreach ($actions as $action) {
        $i = explode('|', $action, 2);

        $url = trim($i[0]);
        $title = isset($i[1]) ? trim($i[1]) : $url;

        $items[$url] = $title;
      }
    }

    return $items;
  }


  /**
   * @return array of items for use by CMenu
   */
  public function actionsAsItems()
  {
    $items = array();
    $actions = $this->actionsArray();

    if (!empty($actions)) {
      foreach ($actions as $url => $label) {
        // Format internal URLs
        if (strtolower(substr($url, 0, 4)) !== 'http') {
          $url = array($url[0] !== '/' ? '/'. $url : $url);
        }
        $items[] = array('label' => $label, 'url' => $url); 
      }
    }

    return $items;
  }
}
