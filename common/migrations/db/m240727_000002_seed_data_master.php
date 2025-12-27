<?php

use yii\db\Migration;
use yii\db\Expression;

/**
 * Class m240727_000002_seed_data_master
 */
class m240727_000002_seed_data_master extends Migration
{
    public function safeUp()
    {
        $now = new Expression('NOW()');
        $uuid = new Expression('UUID()');

        // t_disaster_type
        $this->batchInsert('{{%t_disaster_type}}',
            ['code', 'title', 'description', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock', 'uuid'],
            [
                ['flood', 'Flood', 'Natural disaster caused by overflowing water', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['earthquake', 'Earthquake', 'Seismic activity causing ground shaking', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['landslide', 'Landslide', 'Mass movement of soil or rock down a slope', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['tsunami', 'Tsunami', 'Large sea waves caused by underwater disturbances', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['volcanic-eruption', 'Volcanic Eruption', 'Eruption of magma, ash, and gases from a volcano', $now, $now, 1, 1, 0, null, null, 0, $uuid],
            ]
        );

        // t_disaster_status
        $this->batchInsert('{{%t_disaster_status}}',
            ['code', 'title', 'description', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock', 'uuid'],
            [
                ['reported', 'Reported', 'Disaster has been reported and verified', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['in-response', 'In Response', 'Disaster is currently being handled', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['resolved', 'Resolved', 'Disaster response has been completed', $now, $now, 1, 1, 0, null, null, 0, $uuid],
            ]
        );

        // t_item_category
        $this->batchInsert('{{%t_item_category}}',
            ['code', 'title', 'description', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock', 'uuid'],
            [
                ['food', 'Food Supplies', 'Food assistance items', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['water', 'Drinking Water', 'Clean water for consumption', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['medicine', 'Medical Supplies', 'Medicines and medical equipment', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['clothing', 'Clothing', 'Clothes for affected populations', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['blanket', 'Blanket', 'Blankets for warmth and shelter', $now, $now, 1, 1, 0, null, null, 0, $uuid],
            ]
        );

        // t_shelter_type
        $this->batchInsert('{{%t_shelter_type}}',
            ['code', 'title', 'description', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock', 'uuid'],
            [
                ['school','School','School building used as shelter', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['worship-place','Worship Place','Religious building used as shelter', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['tent-camp','Tent Camp','Temporary tent-based shelter', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['community-hall','Community Hall','Public hall used as shelter', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['hospital','Hospital','Medical shelter or referral center', $now, $now, 1, 1, 0, null, null, 0, $uuid],
            ]
        );


        // t_unit
        $this->batchInsert('{{%t_unit}}',
            ['code', 'title', 'description', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock', 'uuid'],
            [
                ['pcs', 'Pieces', 'Individual item unit', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['box', 'Box', 'Box or carton unit', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['kg', 'Kilogram', 'Weight measured in kilograms', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['liter', 'Liter', 'Volume measured in liters', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['sack', 'Sack', 'Large bag or sack unit', $now, $now, 1, 1, 0, null, null, 0, $uuid],
            ]
        );

        // t_access_route_status
        $this->batchInsert('{{%t_access_route_status}}',
            ['code', 'title', 'description', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock', 'uuid'],
            [
                ['accessible', 'Accessible', 'Route is safe and fully accessible', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['minor-damage', 'Minor Damage', 'Route has minor damage but remains passable', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['major-damage', 'Major Damage', 'Route is severely damaged', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['blocked', 'Blocked', 'Route is completely inaccessible', $now, $now, 1, 1, 0, null, null, 0, $uuid],
            ]
        );

        // t_vehicle_type
        $this->batchInsert('{{%t_vehicle_type}}',
            ['code', 'title', 'description', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock', 'uuid'],
            [
                ['motorcycle', 'Motorcycle', 'Two-wheeled motor vehicle', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['car', 'Car', 'Four-wheeled passenger vehicle', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['truck', 'Truck', 'Cargo transport vehicle', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['rubber-boat', 'Rubber Boat', 'Inflatable boat for evacuation', $now, $now, 1, 1, 0, null, null, 0, $uuid],
            ]
        );

        // t_entity_type
        $this->batchInsert('{{%t_entity_type}}',
            ['code', 'title', 'description', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock', 'uuid'],
            [
                ['shelter', 'Shelter', 'Temporary shelter for displaced people', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['distribution-point', 'Distribution Point', 'Aid distribution location', $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['access-route', 'Access Route', 'Transportation or access route', $now, $now, 1, 1, 0, null, null, 0, $uuid],
            ]
        );

        // t_verification_type
        $this->batchInsert('{{%t_verification_type}}',
            ['code', 'title', 'weight', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock', 'uuid'],
            [
                ['confirmed', 'Confirmed', 1, $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['rejected', 'Rejected', -1, $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['outdated', 'Outdated', -2, $now, $now, 1, 1, 0, null, null, 0, $uuid],
                ['blocked', 'Blocked', -3, $now, $now, 1, 1, 0, null, null, 0, $uuid],
            ]
        );
    }

    public function safeDown()
    {
        $this->delete('{{%t_verification_type}}', ['in', 'code', ['confirmed', 'rejected', 'outdated', 'blocked']]);
        $this->delete('{{%t_entity_type}}', ['in', 'code', ['shelter', 'distribution-point', 'access-route']]);
        $this->delete('{{%t_vehicle_type}}', ['in', 'code', ['motorcycle', 'car', 'truck', 'rubber-boat']]);
        $this->delete('{{%t_access_route_status}}', ['in', 'code', ['accessible', 'minor-damage', 'major-damage', 'blocked']]);
        $this->delete('{{%t_unit}}', ['in', 'code', ['pcs', 'box', 'kg', 'liter', 'sack']]);
        $this->delete('{{%t_item_category}}', ['in', 'code', ['food', 'water', 'medicine', 'clothing', 'blanket']]);
        $this->delete('{{%t_disaster_status}}', ['in', 'code', ['reported', 'in-response', 'resolved']]);
        $this->delete('{{%t_disaster_type}}', ['in', 'code', ['flood', 'earthquake', 'landslide', 'tsunami', 'volcanic-eruption']]);
    }
}
