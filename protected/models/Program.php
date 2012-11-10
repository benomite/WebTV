<?php

/**
 * This is the model class for table "program".
 *
 * The followings are the available columns in table 'program':
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property string $tags
 * @property integer $status
 * @property integer $create_time
 * @property integer $update_time
 * @property string $author_id
 *
 * The followings are the available model relations:
 * @property Episode[] $episodes
 * @property User $author
 */
class Program extends CActiveRecord
{
    const STATUS_PROJECT=1;
    const STATUS_ONLINE=2;
    const STATUS_ARCHIVED=3;

    private $_oldTags;

	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Program the static model class
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
		return 'program';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('title, description', 'required'),
            array('status', 'in', 'range'=>array(1,2,3)),
			array('title', 'length', 'max'=>128),
            array('tags', 'match', 'pattern'=>'/^[\w\s,]+$/',
                'message'=>'Tags can only contain word characters.'),
            array('tags', 'normalizeTags'),
            array('image', 'file', 'types'=>'jpg, gif, png', 'on' => 'insert',),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('title, description, tags, status', 'safe', 'on'=>'search'),
		);
	}

    public function normalizeTags($attribute,$params)
    {
        $this->tags=Tag::array2string(array_unique(Tag::string2array($this->tags)));
    }

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'episodes' => array(self::HAS_MANY, 'Episode', 'program_id'),
			'author' => array(self::BELONGS_TO, 'User', 'author_id'),
            'episodeCount' => array(self::STAT, 'Episode', 'program_id',
                'condition'=>'status='.Episode::STATUS_ONLINE),
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
			'description' => 'Description',
            'image' => 'Image',
			'tags' => 'Tags',
			'status' => 'Status',
			'create_time' => 'Create Time',
			'update_time' => 'Update Time',
			'author_id' => 'Author',
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
		$criteria->compare('title',$this->title,true);
		$criteria->compare('description',$this->description,true);
        $criteria->compare('image',$this->image,true);
		$criteria->compare('tags',$this->tags,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('create_time',$this->create_time);
		$criteria->compare('update_time',$this->update_time);
		$criteria->compare('author_id',$this->author_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

    public function getUrl()
    {
        return Yii::app()->createUrl('program/view', array(
            'id'=>$this->id,
            'title'=>$this->title,
        ));
    }

    protected function beforeSave()
    {
        if(parent::beforeSave())
        {
            if($this->isNewRecord)
            {
                $this->create_time=$this->update_time=time();
                $this->author_id=Yii::app()->user->id;
            }
            else
                $this->update_time=time();
            return true;
        }
        else
            return false;
    }

    protected function afterSave()
    {
        parent::afterSave();
        Tag::model()->updateFrequency($this->_oldTags, $this->tags);
    }


    protected function afterFind()
    {
        parent::afterFind();
        $this->_oldTags=$this->tags;
    }

}