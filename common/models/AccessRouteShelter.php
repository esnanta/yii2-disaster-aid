<?php

namespace common\models;

use common\models\base\AccessRouteShelter as BaseAccessRouteShelters;
use common\models\query\AccessRouteSheltersQuery;
use Yii;

/**
 * This is the model class for table "t_access_route_shelters".
 */
class AccessRouteShelter extends BaseAccessRouteShelters
{
    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['access_route_id', 'shelter_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['is_deleted'], 'integer'],
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
            'access_route_id' => Yii::t('common', 'Access Route ID'),
            'shelter_id' => Yii::t('common', 'Shelter ID'),
            'is_deleted' => Yii::t('common', 'Is Deleted'),
            'verlock' => Yii::t('common', 'Verlock'),
            'uuid' => Yii::t('common', 'Uuid'),
        ];
    }

    /**
     * @inheritdoc
     * @return AccessRouteSheltersQuery the active query used by this AR class.
     */
    public static function find(): AccessRouteSheltersQuery
    {
        return new AccessRouteSheltersQuery(get_called_class());
    }
}
