<?php

namespace common\models;

use Yii;
use common\models\base\AidDistribution as BaseAidDistribution;

/**
 * This is the model class for table "t_aid_distribution".
 */
class AidDistribution extends BaseAidDistribution
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['aid_plan_id', 'shelter_id', 'distributed_by', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['distribution_date', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['notes'], 'string'],
            [['is_deleted'], 'integer'],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
    /**
     * @inheritdoc
     */
    public function attributeHints()
    {
        return [
            'id' => Yii::t('common', 'ID'),
            'aid_plan_id' => Yii::t('common', 'Aid Plan ID'),
            'shelter_id' => Yii::t('common', 'Shelter ID'),
            'distribution_date' => Yii::t('common', 'Distribution Date'),
            'distributed_by' => Yii::t('common', 'Distributed By'),
            'notes' => Yii::t('common', 'Notes'),
            'is_deleted' => Yii::t('common', 'Is Deleted'),
            'verlock' => Yii::t('common', 'Verlock'),
            'uuid' => Yii::t('common', 'Uuid'),
        ];
    }
}
