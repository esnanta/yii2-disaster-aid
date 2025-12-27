<?php

namespace common\models\base;

use common\models\query\AccessRouteQuery;
use mootensai\behaviors\UUIDBehavior;
use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;

/**
 * This is the base model class for table "t_access_route".
 *
 * @property integer $id
 * @property integer $disaster_id
 * @property string $route_name
 * @property string $route_geometry
 * @property string $route_length_km
 * @property integer $access_route_status_id
 * @property string $geometry_updated_at
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $is_deleted
 * @property string $deleted_at
 * @property integer $deleted_by
 * @property integer $verlock
 * @property string $uuid
 *
 * @property \common\models\Disaster $disaster
 * @property \common\models\AccessRouteStatus $accessRouteStatus
 * @property \common\models\AccessRouteShelter[] $accessRouteShelters
 * @property \common\models\AccessRouteVehicle[] $accessRouteVehicles
 */
class AccessRoute extends \yii\db\ActiveRecord
{
    use \mootensai\relation\RelationTrait;

    private $_rt_softdelete;
    private $_rt_softrestore;

    public function __construct(){
        parent::__construct();
        $this->_rt_softdelete = [
            'deleted_by' => \Yii::$app->user->id,
            'deleted_at' => date('Y-m-d H:i:s'),
        ];
        $this->_rt_softrestore = [
            'deleted_by' => 0,
            'deleted_at' => date('Y-m-d H:i:s'),
        ];
    }

    /**
    * This function helps \mootensai\relation\RelationTrait runs faster
    * @return array relation names of this model
    */
    public function relationNames()
    {
        return [
            'disaster',
            'accessRouteStatus',
            'accessRouteShelters',
            'accessRouteVehicles'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['disaster_id', 'access_route_status_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['route_geometry', 'description'], 'string'],
            [['route_length_km'], 'number'],
            [['geometry_updated_at', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['route_name'], 'string', 'max' => 255],
            [['is_deleted'], 'integer'],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 't_access_route';
    }

    /**
     *
     * @return string
     * overwrite function optimisticLock
     * return string name of field are used to stored optimistic lock
     *
     */
    public function optimisticLock() {
        return 'verlock';
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
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
     * @return \yii\db\ActiveQuery
     */
    public function getDisaster()
    {
        return $this->hasOne(\common\models\Disaster::class, ['id' => 'disaster_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccessRouteStatus()
    {
        return $this->hasOne(\common\models\AccessRouteStatus::class, ['id' => 'access_route_status_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccessRouteShelters()
    {
        return $this->hasMany(\common\models\AccessRouteShelter::class, ['access_route_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccessRouteVehicles()
    {
        return $this->hasMany(\common\models\AccessRouteVehicle::class, ['access_route_id' => 'id']);
    }
    
    /**
     * @inheritdoc
     * @return array mixed
     */
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::class,
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => 'updated_at',
                'value' => new \yii\db\Expression('NOW()'),
            ],
            'blameable' => [
                'class' => BlameableBehavior::class,
                'createdByAttribute' => 'created_by',
                'updatedByAttribute' => 'updated_by',
            ],
            'uuid' => [
                'class' => UUIDBehavior::class,
                'column' => 'uuid',
            ],
        ];
    }

    /**
     * The following code shows how to apply a default condition for all queries:
     *
     * ```php
     * class Customer extends ActiveRecord
     * {
     *     public static function find()
     *     {
     *         return parent::find()->where(['deleted' => false]);
     *     }
     * }
     *
     * // Use andWhere()/orWhere() to apply the default condition
     * // SELECT FROM customer WHERE `deleted`=:deleted AND age>30
     * $customers = Customer::find()->andWhere('age>30')->all();
     *
     * // Use where() to ignore the default condition
     * // SELECT FROM customer WHERE age>30
     * $customers = Customer::find()->where('age>30')->all();
     * ```
     */

    /**
     * @inheritdoc
     * @return AccessRouteQuery the active query used by this AR class.
     */
    public static function find()
    {
        $query = new AccessRouteQuery(get_called_class());
        return $query->where(['t_access_route.is_deleted' => 0]);
    }
}
