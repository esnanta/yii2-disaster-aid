<?php

namespace common\models;

use common\models\base\AccessRoute as BaseAccessRoute;
use common\models\query\AccessRouteQuery;
use Yii;

/**
 * This is the model class for table "t_access_route".
 */
class AccessRoute extends BaseAccessRoute
{
    /**
     * @inheritdoc
     */
    public function rules(): array
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['disaster_id', 'access_route_status_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['route_geometry', 'description'], 'string'],
            [['route_length_km'], 'number'],
            [['geometry_updated_at', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['route_name'], 'string', 'max' => 255],
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
            'disaster_id' => Yii::t('common', 'Disaster ID'),
            'route_name' => Yii::t('common', 'Route Name'),
            'route_geometry' => Yii::t('common', 'Route Geometry'),
            'route_length_km' => Yii::t('common', 'Route Length Km'),
            'access_route_status_id' => Yii::t('common', 'Access Route Status ID'),
            'geometry_updated_at' => Yii::t('common', 'Geometry Updated At'),
            'description' => Yii::t('common', 'Description'),
            'is_deleted' => Yii::t('common', 'Is Deleted'),
            'verlock' => Yii::t('common', 'Verlock'),
            'uuid' => Yii::t('common', 'Uuid'),
        ];
    }

    /**
     * @inheritdoc
     * @return AccessRouteQuery the active query used by this AR class.
     */
    public static function find(): AccessRouteQuery
    {
        return new AccessRouteQuery(get_called_class());
    }
}
