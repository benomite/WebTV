<?php

/**
 * This is the model class for table "episode_comment_vote".
 *
 * The followings are the available columns in table 'episode_comment_vote':
 * @property string $id
 * @property string $user_id
 * @property integer $episode_comment_id
 * @property integer $value
 * @property integer $vote_time
 */
class EpisodeCommentVote extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return EpisodeCommentVote the static model class
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
		return 'episode_comment_vote';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
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
            'comment' => array(self::BELONGS_TO, 'EpisodeComment', 'episode_comment_id'),
            'voter' => array(self::BELONGS_TO, 'User', 'user_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'user_id' => 'User',
			'episode_comment_id' => 'Episode Comment',
			'value' => 'Value',
			'vote_time' => 'Vote Time',
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
		$criteria->compare('user_id',$this->user_id,true);
		$criteria->compare('episode_comment_id',$this->episode_comment_id);
		$criteria->compare('value',$this->value);
		$criteria->compare('vote_time',$this->vote_time);

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
                $this->vote_time=time();
                $this->user_id=Yii::app()->user->id;
            }

            return true;
        }
        else
            return false;
    }
}