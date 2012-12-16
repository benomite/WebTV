<?php

/**
 * This is the model class for table "episode".
 *
 * The followings are the available columns in table 'episode':
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property string $video
 * @property integer $status
 * @property integer $create_time
 * @property integer $update_time
 * @property integer $program_id
 *
 * The followings are the available model relations:
 * @property Program $program
 * @property Schedule[] $schedules
 */
class Episode extends CActiveRecord
{
    const STATUS_PROJECT=1;
    const STATUS_ONLINE=2;

	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Episode the static model class
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
		return 'episode';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('title, video, status, program_id', 'required'),
			array('status', 'numerical', 'integerOnly'=>true),
			array('title', 'length', 'max'=>128),
            array('number', 'length', 'max'=>32),
			array('description', 'safe'),
            array('image', 'file',
                'types'=>'jpg, gif, png',
                'maxSize'=>2202000,
                'tooLarge'=>Yii::t('app', 'The file was larger than 2M. Please upload a smaller file.'),
                'on' => 'insert'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('title, description, status', 'safe', 'on'=>'search'),
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
			'program' => array(self::BELONGS_TO, 'Program', 'program_id'),
            'comments' => array(self::HAS_MANY, 'EpisodeComment', 'episode_id'),
            'commentCount' => array(self::STAT, 'EpisodeComment', 'episode_id',
                'condition'=>'status='.EpisodeComment::STATUS_VALID),
			'schedules' => array(self::HAS_MANY, 'Schedule', 'episode_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => Yii::t('program', 'ID'),
			'title' => Yii::t('program', 'Title'),
			'description' => Yii::t('program', 'Description'),
            'image' => Yii::t('program', 'Image'),
			'video' => Yii::t('program', 'Video'),
            'number' => Yii::t('program', 'Episode Number'),
			'status' => Yii::t('program', 'Status'),
			'create_time' => Yii::t('program', 'Create Time'),
			'update_time' => Yii::t('program', 'Update Time'),
			'program_id' => Yii::t('program', 'Program'),
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

		$criteria->compare('title',$this->title,true);
		$criteria->compare('description',$this->description,true);
        $criteria->compare('image',$this->image,true);
		$criteria->compare('video',$this->video,true);
        $criteria->compare('number',$this->number);
		$criteria->compare('status',$this->status);
		$criteria->compare('create_time',$this->create_time);
		$criteria->compare('program_id',$this->program_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

    public function addComment($comment)
    {
        $comment->episode_id = $this->id;
        return $comment->save();
    }

    public function getFullTitle(){
        $title = "";
        if(isset($this->number) && $this->number != ''){
            $title .= Yii::t('Program', 'Episode {num}', array('{num}'=> $this->number)).' - ';
        }
        $title .= $this->title;
        return $title;
    }
    /*
     *
     */
    protected function beforeSave()
    {
        if(parent::beforeSave())
        {
            if($this->isNewRecord) {
                $this->create_time=$this->update_time=time();
            }
            else {
                $this->update_time=time();
            }

            return true;
        }
        else
            return false;
    }
}