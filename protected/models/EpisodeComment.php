<?php

/**
 * This is the model class for table "episode_comment".
 *
 * The followings are the available columns in table 'episode_comment':
 * @property integer $id
 * @property string $content
 * @property integer $episode_id
 * @property string $author_id
 * @property integer $status
 * @property integer $create_time
 */
class EpisodeComment extends CActiveRecord
{
    const STATUS_VALID = 1;
    const STATUS_DELETED = 2;

	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return EpisodeComment the static model class
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
		return 'episode_comment';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('content', 'required'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('content, episode_id, author_id', 'safe', 'on'=>'search'),
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
            'episode' => array(self::BELONGS_TO, 'Episode', 'episode_id'),
            'author' => array(self::BELONGS_TO, 'User', 'author_id'),
            'votes' => array(self::STAT, 'EpisodeCommentVote', 'episode_comment_id',
                'select'=> 'SUM(value)'),
        );
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'content' => 'Comment',
			'episode_id' => 'Episode',
			'author_id' => 'Author',
			'status' => 'Status',
			'create_time' => 'Create Time',
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

		$criteria->compare('id',$this->id);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('episode_id',$this->episode_id);
		$criteria->compare('author_id',$this->author_id,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('create_time',$this->create_time);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

    protected function beforeSave()
    {
        if(parent::beforeSave())
        {
            if($this->isNewRecord)
            {
                $this->create_time=time();
                $this->author_id=Yii::app()->user->id;
            }

            if(!isset($this->status)){
                $this->status = self::STATUS_VALID;
            }
            return true;
        }
        else
            return false;
    }
}