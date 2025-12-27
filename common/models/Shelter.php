<?php

namespace common\models;

use Yii;
use common\models\base\Shelter as BaseShelter;

/**
 * This is the model class for table "t_shelter".
 */
class Shelter extends BaseShelter
{
    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['disaster_id', 'evacuee_count', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['latitude', 'longitude'], 'number'],
            [['aid_status', 'description'], 'string'],
            [['last_aid_distribution_at', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 255],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
    /**
     * @inheritdoc
     */
    public function attributeHints(): array
    {
        return [
            'id' => Yii::t('common', 'ID'),
            'disaster_id' => Yii::t('common', 'Disaster ID'),
            'title' => Yii::t('common', 'Title'),
            'latitude' => Yii::t('common', 'Latitude'),
            'longitude' => Yii::t('common', 'Longitude'),
            'evacuee_count' => Yii::t('common', 'Evacuee Count'),
            'aid_status' => Yii::t('common', 'Aid Status'),
            'last_aid_distribution_at' => Yii::t('common', 'Last Aid Distribution At'),
            'description' => Yii::t('common', 'Description'),
            'is_deleted' => Yii::t('common', 'Is Deleted'),
            'verlock' => Yii::t('common', 'Verlock'),
            'uuid' => Yii::t('common', 'Uuid'),
        ];
    }
}
