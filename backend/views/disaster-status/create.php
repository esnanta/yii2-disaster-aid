<?php

/**
 * @var yii\web\View $this
 * @var common\models\DisasterStatus $model
 */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Disaster Status',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Disaster Statuses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="disaster-status-create">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
