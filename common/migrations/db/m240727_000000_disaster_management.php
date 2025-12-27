<?php

use yii\db\Migration;

/**
 * Class m240727_000000_create_disaster_management_tables
 */
class m240727_000000_disaster_management extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE=InnoDB';
        }

        // t_disaster_type
        $this->createTable('{{%t_disaster_type}}', [
            'id' => $this->primaryKey(),
            'code' => $this->string(50)->unique(),
            'title' => $this->string(255),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        // t_disaster_status
        $this->createTable('{{%t_disaster_status}}', [
            'id' => $this->primaryKey(),
            'code' => $this->string(50)->unique(),
            'title' => $this->string(255),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        // t_disaster
        $this->createTable('{{%t_disaster}}', [
            'id' => $this->primaryKey(),
            'title' => $this->string(255),
            'disaster_type_id' => $this->integer(),
            'disaster_status_id' => $this->integer(),
            'start_date' => $this->date(),
            'end_date' => $this->date(),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_disaster-disaster_type_id', '{{%t_disaster}}', 'disaster_type_id', '{{%t_disaster_type}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->addForeignKey('fk-t_disaster-disaster_status_id', '{{%t_disaster}}', 'disaster_status_id', '{{%t_disaster_status}}', 'id', 'RESTRICT', 'RESTRICT');

        // t_item_category
        $this->createTable('{{%t_item_category}}', [
            'id' => $this->primaryKey(),
            'code' => $this->string(50)->unique(),
            'title' => $this->string(255),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        // t_unit
        $this->createTable('{{%t_unit}}', [
            'id' => $this->primaryKey(),
            'code' => $this->string(50)->unique(),
            'title' => $this->string(255),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        // t_item
        $this->createTable('{{%t_item}}', [
            'id' => $this->primaryKey(),
            'item_category_id' => $this->integer(),
            'title' => $this->string(255),
            'unit_id' => $this->integer(),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_item-item_category_id', '{{%t_item}}', 'item_category_id', '{{%t_item_category}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->addForeignKey('fk-t_item-unit_id', '{{%t_item}}', 'unit_id', '{{%t_unit}}', 'id', 'RESTRICT', 'RESTRICT');

        // t_shelter
        $this->createTable('{{%t_shelter}}', [
            'id' => $this->primaryKey(),
            'disaster_id' => $this->integer(),
            'title' => $this->string(255),
            'latitude' => $this->decimal(11, 8),
            'longitude' => $this->decimal(11, 8),
            'evacuee_count' => $this->integer(),
            'aid_status' => $this->tinyInteger(),
            'last_aid_distribution_at' => $this->dateTime(),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_shelter-disaster_id', '{{%t_shelter}}', 'disaster_id', '{{%t_disaster}}', 'id', 'RESTRICT', 'RESTRICT');

        // t_access_route_status
        $this->createTable('{{%t_access_route_status}}', [
            'id' => $this->primaryKey(),
            'code' => $this->string(50)->unique(),
            'title' => $this->string(255),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        // t_access_route
        $this->createTable('{{%t_access_route}}', [
            'id' => $this->primaryKey(),
            'disaster_id' => $this->integer(),
            'route_name' => $this->string(255),
            'route_geometry' => 'linestring',
            'route_length_km' => $this->decimal(6, 2),
            'access_route_status_id' => $this->integer(),
            'geometry_updated_at' => $this->dateTime(),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_access_route-disaster_id', '{{%t_access_route}}', 'disaster_id', '{{%t_disaster}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->addForeignKey('fk-t_access_route-access_route_status_id', '{{%t_access_route}}', 'access_route_status_id', '{{%t_access_route_status}}', 'id', 'RESTRICT', 'RESTRICT');

        // t_vehicle_type
        $this->createTable('{{%t_vehicle_type}}', [
            'id' => $this->primaryKey(),
            'code' => $this->string(50)->unique(),
            'title' => $this->string(255),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        // t_access_route_vehicle
        $this->createTable('{{%t_access_route_vehicle}}', [
            'id' => $this->primaryKey(),
            'access_route_id' => $this->integer(),
            'vehicle_type_id' => $this->integer(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_access_route_vehicle-access_route_id', '{{%t_access_route_vehicle}}', 'access_route_id', '{{%t_access_route}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->addForeignKey('fk-t_access_route_vehicle-vehicle_type_id', '{{%t_access_route_vehicle}}', 'vehicle_type_id', '{{%t_vehicle_type}}', 'id', 'RESTRICT', 'RESTRICT');

        // t_access_route_shelter
        $this->createTable('{{%t_access_route_shelter}}', [
            'id' => $this->primaryKey(),
            'access_route_id' => $this->integer(),
            'shelter_id' => $this->integer(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_access_route_shelter-access_route_id', '{{%t_access_route_shelter}}', 'access_route_id', '{{%t_access_route}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->addForeignKey('fk-t_access_route_shelter-shelter_id', '{{%t_access_route_shelter}}', 'shelter_id', '{{%t_shelter}}', 'id', 'RESTRICT', 'RESTRICT');

        // t_aid_plan
        $this->createTable('{{%t_aid_plan}}', [
            'id' => $this->primaryKey(),
            'shelter_id' => $this->integer(),
            'distribution_plan_date' => $this->dateTime(),
            'plan_status' => $this->integer(),
            'remark' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_aid_plan-shelter_id', '{{%t_aid_plan}}', 'shelter_id', '{{%t_shelter}}', 'id', 'RESTRICT', 'RESTRICT');

        // t_aid_plan_details
        $this->createTable('{{%t_aid_plan_details}}', [
            'id' => $this->primaryKey(),
            'aid_plan_id' => $this->integer(),
            'item_id' => $this->integer(),
            'quantity' => $this->integer(),
            'unit_id' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_aid_plan_details-aid_plan_id', '{{%t_aid_plan_details}}', 'aid_plan_id', '{{%t_aid_plan}}', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk-t_aid_plan_details-item_id', '{{%t_aid_plan_details}}', 'item_id', '{{%t_item}}', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk-t_aid_plan_details-unit_id', '{{%t_aid_plan_details}}', 'unit_id', '{{%t_unit}}', 'id', 'CASCADE', 'CASCADE');

        // t_aid_distribution
        $this->createTable('{{%t_aid_distribution}}', [
            'id' => $this->primaryKey(),
            'aid_plan_id' => $this->integer(),
            'shelter_id' => $this->integer(),
            'distribution_date' => $this->dateTime(),
            'distributed_by' => $this->integer(),
            'notes' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_aid_distribution-aid_plan_id', '{{%t_aid_distribution}}', 'aid_plan_id', '{{%t_aid_plan}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->addForeignKey('fk-t_aid_distribution-shelter_id', '{{%t_aid_distribution}}', 'shelter_id', '{{%t_shelter}}', 'id', 'RESTRICT', 'RESTRICT');

        // t_aid_distribution_details
        $this->createTable('{{%t_aid_distribution_details}}', [
            'id' => $this->primaryKey(),
            'aid_distribution_id' => $this->integer(),
            'item_id' => $this->integer(),
            'quantity' => $this->integer(),
            'unit_id' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_aid_distribution_details-aid_distribution_id', '{{%t_aid_distribution_details}}', 'aid_distribution_id', '{{%t_aid_distribution}}', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk-t_aid_distribution_details-item_id', '{{%t_aid_distribution_details}}', 'item_id', '{{%t_item}}', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk-t_aid_distribution_details-unit_id', '{{%t_aid_distribution_details}}', 'unit_id', '{{%t_unit}}', 'id', 'CASCADE', 'CASCADE');

        // t_entity_type
        $this->createTable('{{%t_entity_type}}', [
            'id' => $this->primaryKey(),
            'code' => $this->string(50)->unique(),
            'title' => $this->string(255),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        // t_media_file
        $this->createTable('{{%t_media_file}}', [
            'id' => $this->primaryKey(),
            'entity_type_id' => $this->integer(),
            'entity_id' => $this->integer(),
            'file_path' => $this->string(500),
            'notes' => $this->string(255),
            'file_type' => $this->string(50),
            'mime_type' => $this->string(100),
            'taken_at' => $this->dateTime(),
            'uploaded_by' => $this->integer(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_media_file-entity_type_id', '{{%t_media_file}}', 'entity_type_id', '{{%t_entity_type}}', 'id', 'RESTRICT', 'RESTRICT');

        // t_verification_type
        $this->createTable('{{%t_verification_type}}', [
            'id' => $this->primaryKey(),
            'code' => $this->string(50)->unique(),
            'title' => $this->string(255),
            'weight' => $this->integer(),
            'description' => $this->text(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        // t_verification
        $this->createTable('{{%t_verification}}', [
            'id' => $this->primaryKey(),
            'entity_type_id' => $this->integer(),
            'entity_id' => $this->integer(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'last_activity_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_verification-entity_type_id', '{{%t_verification}}', 'entity_type_id', '{{%t_entity_type}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->createIndex('uq_entity_verification', '{{%t_verification}}', ['entity_type_id', 'entity_id'], true);


        // t_verification_vote
        $this->createTable('{{%t_verification_vote}}', [
            'id' => $this->primaryKey(),
            'verification_id' => $this->integer(),
            'verification_type_id' => $this->integer(),
            'notes' => $this->text(),
            'voted_by' => $this->integer(),
            'voted_at' => $this->dateTime(),
            'created_at' => $this->dateTime(),
            'updated_at' => $this->dateTime(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
            'is_deleted' => $this->tinyInteger(1)->defaultValue(0),
            'deleted_at' => $this->dateTime(),
            'deleted_by' => $this->integer(),
            'verlock' => $this->integer(),
            'uuid' => $this->string(36),
        ], $tableOptions);

        $this->addForeignKey('fk-t_verification_vote-verification_id', '{{%t_verification_vote}}', 'verification_id', '{{%t_verification}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->addForeignKey('fk-t_verification_vote-verification_type_id', '{{%t_verification_vote}}', 'verification_type_id', '{{%t_verification_type}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->addForeignKey('fk-t_verification_vote-voted_by', '{{%t_verification_vote}}', 'voted_by', '{{%t_user}}', 'id', 'RESTRICT', 'RESTRICT');
        $this->createIndex('uq_verification_user', '{{%t_verification_vote}}', ['verification_id', 'voted_by'], true);

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%t_verification_vote}}');
        $this->dropTable('{{%t_verification}}');
        $this->dropTable('{{%t_verification_type}}');
        $this->dropTable('{{%t_media_file}}');
        $this->dropTable('{{%t_entity_type}}');
        $this->dropTable('{{%t_aid_distribution_details}}');
        $this->dropTable('{{%t_aid_distribution}}');
        $this->dropTable('{{%t_aid_plan_details}}');
        $this->dropTable('{{%t_aid_plan}}');
        $this->dropTable('{{%t_access_route_shelter}}');
        $this->dropTable('{{%t_access_route_vehicle}}');
        $this->dropTable('{{%t_vehicle_type}}');
        $this->dropTable('{{%t_access_route}}');
        $this->dropTable('{{%t_access_route_status}}');
        $this->dropTable('{{%t_shelter}}');
        $this->dropTable('{{%t_item}}');
        $this->dropTable('{{%t_unit}}');
        $this->dropTable('{{%t_item_category}}');
        $this->dropTable('{{%t_disaster}}');
        $this->dropTable('{{%t_disaster_status}}');
        $this->dropTable('{{%t_disaster_type}}');
    }
}
